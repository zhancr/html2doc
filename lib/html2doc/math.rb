require "uuidtools"
require "asciimath"
require "htmlentities"
require "nokogiri"
require "xml/xslt"

module Html2Doc
  @xslt = XML::XSLT.new
  @xslt.xsl = File.read(File.join(File.dirname(__FILE__), "mathml2omml.xsl"))
  @xslt.xsl = File.read(File.join(File.dirname(__FILE__), "mml2omml.xsl"), encoding: "utf-8")
  @xsltemplate = Nokogiri::XSLT(File.read(File.join(File.dirname(__FILE__), "mml2omml.xsl"), encoding: "utf-8"))

  def self.asciimath_to_mathml1(x)
    AsciiMath.parse(HTMLEntities.new.decode(x)).to_mathml.
        gsub(/<math>/, "<math xmlns='http://www.w3.org/1998/Math/MathML'>")
  end

  def self.asciimath_to_mathml(doc, delims)
    return doc if delims.nil? || delims.size < 2
    m = doc.split(/(#{Regexp.escape(delims[0])}|#{Regexp.escape(delims[1])})/)
    m.each_slice(4).map.with_index do |(*a), i|
      warn "MathML #{i} of #{(m.size / 4).floor}" if i % 500 == 0 && m.size > 1000 && i > 0
      a[2].nil? || a[2] = asciimath_to_mathml1(a[2])
      a.size > 1 ? a[0] + a[2] : a[0]
    end.join
  end

  # random fixes to MathML input that OOXML needs to render properly
  def self.ooxml_cleanup(m, docnamespaces)
    m.xpath(".//xmlns:msup[name(preceding-sibling::*[1])='munderover']",
            docnamespaces).each do |x|
      x1 = x.replace("<mrow></mrow>").first
      x1.children = x
    end
    m.add_namespace(nil, "http://www.w3.org/1998/Math/MathML")
    m.to_s
  end

  def self.mathml_to_ooml(docxml)
    docnamespaces = docxml.collect_namespaces
    m = docxml.xpath("//*[local-name() = 'math']")
    m.each_with_index do |x, i|
      warn "Math OOXML #{i} of #{m.size}" if i % 100 == 0 && m.size > 500 && i > 0
      @xslt.xml = ooxml_cleanup(x, docnamespaces)
      ooxml = @xslt.serve.gsub(/<\?[^>]+>\s*/, "").
        gsub(/ xmlns(:[^=]+)?="[^"]+"/, "").
        gsub(%r{<(/)?([a-z])}, "<\\1m:\\2")
      ooxml = uncenter(x, ooxml)
      x.swap(ooxml)
    end
  end

  # if oomml has no siblings, by default it is centered; override this with
  # left/right if parent is so tagged
  def self.uncenter(m, ooxml)
    if m.next == nil && m.previous == nil
      alignnode = m.at(".//ancestor::*[@style][local-name() = 'p' or local-name() = "\
                       "'div' or local-name() = 'td']/@style") or return ooxml
      if alignnode.text.include? ("text-align:left")
        ooxml = "<m:oMathPara><m:oMathParaPr><m:jc "\
          "m:val='left'/></m:oMathParaPr>#{ooxml}</m:oMathPara>"
      elsif alignnode.text.include? ("text-align:right")
        ooxml = "<m:oMathPara><m:oMathParaPr><m:jc "\
          "m:val='right'/></m:oMathParaPr>#{ooxml}</m:oMathPara>"
      end
    end
    ooxml
  end
end
