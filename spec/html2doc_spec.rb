require "base64"

def html_input(x)
  <<~HTML
    <html><head><title>blank</title>
    <meta name="Originator" content="Me"/>
    </head>
    <body>
  #{x}
    </body></html>
  HTML
end

def html_input_no_title(x)
  <<~HTML
    <html><head>
    <meta name="Originator" content="Me"/>
    </head>
    <body>
  #{x}
    </body></html>
  HTML
end

def html_input_empty_head(x)
  <<~HTML
    <html><head></head>
    <body>
  #{x}
    </body></html>
  HTML
end

WORD_HDR = <<~HDR
MIME-Version: 1.0
Content-Type: multipart/related; boundary="----=_NextPart_"

------=_NextPart_
Content-Location: file:///C:/Doc/test.htm
Content-Type: text/html; charset="utf-8"

<?xml version="1.0"?>
<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:w="urn:schemas-microsoft-com:office:word" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:m="http://schemas.microsoft.com/office/2004/12/omml" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]>
<xml>
<w:WordDocument>
<w:View>Print</w:View>
<w:Zoom>100</w:Zoom>
<w:DoNotOptimizeForBrowser/>
</w:WordDocument>
</xml>
<![endif]-->
<meta http-equiv=Content-Type content="text/html; charset=utf-8"/>

  <link rel=File-List href="test_files/filelist.xml"/>
<title>blank</title><style><![CDATA[
  <!--
HDR

WORD_HDR_END = <<~HDR
-->
]]></style>
<meta name="Originator" content="Me"/>
</head>
HDR

def word_body(x, fn)
  <<~BODY
<body>
  #{x}
  #{fn}</body></html>
  BODY
end

WORD_FTR1 = <<~FTR
  ------=_NextPart_
Content-Location: file:///C:/Doc/test_files/filelist.xml
Content-Transfer-Encoding: base64
Content-Type: #{Html2Doc::mime_type('filelist.xml')}

PHhtbCB4bWxuczpvPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTpvZmZpY2UiPgog
ICAgICAgIDxvOk1haW5GaWxlIEhSZWY9Ii4uL3Rlc3QuaHRtIi8+ICA8bzpGaWxlIEhSZWY9ImZp
bGVsaXN0LnhtbCIvPgo8L3htbD4K

------=_NextPart_--
FTR

WORD_FTR2 = <<~FTR
  ------=_NextPart_
Content-Location: file:///C:/Doc/test_files/filelist.xml
Content-Transfer-Encoding: base64
Content-Type: #{Html2Doc::mime_type('filelist.xml')}
PHhtbCB4bWxuczpvPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTpvZmZpY2UiPgog
ICAgICAgIDxvOk1haW5GaWxlIEhSZWY9Ii4uL3Rlc3QuaHRtIi8+ICA8bzpGaWxlIEhSZWY9ImZp
bGVsaXN0LnhtbCIvPgogIDxvOkZpbGUgSFJlZj0iaGVhZGVyLmh0bWwiLz4KPC94bWw+Cg==
------=_NextPart_
FTR

WORD_FTR3 = <<~FTR
------=_NextPart_
Content-Location: file:///C:/Doc/test_files/filelist.xml
Content-Transfer-Encoding: base64
Content-Type: #{Html2Doc::mime_type('filelist.xml')}

PHhtbCB4bWxuczpvPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTpvZmZpY2UiPgog
ICAgICAgIDxvOk1haW5GaWxlIEhSZWY9Ii4uL3Rlc3QuaHRtIi8+ICA8bzpGaWxlIEhSZWY9IjFh
YzIwNjVmLTAzZjAtNGM3YS1iOWE2LTkyZTgyMDU5MWJmMC5wbmciLz4KICA8bzpGaWxlIEhSZWY9
ImZpbGVsaXN0LnhtbCIvPgo8L3htbD4K
------=_NextPart_
Content-Location: file:///C:/Doc/test_files/cb7b0d19-891e-4634-815a-570d019d454c.png
Content-Transfer-Encoding: base64
Content-Type: image/png
------=_NextPart_--
FTR

HEADERHTML  = <<~FTR
<html xmlns:v="urn:schemas-microsoft-com:vml"
xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:w="urn:schemas-microsoft-com:office:word"
xmlns:m="http://schemas.microsoft.com/office/2004/12/omml"
xmlns:mv="http://macVmlSchemaUri" xmlns="http://www.w3.org/TR/REC-html40">
<head>
<meta name=Title content="">
<meta name=Keywords content="">
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Word.Document>
<meta name=Generator content="Microsoft Word 15">
<meta name=Originator content="Microsoft Word 15">
<link id=Main-File rel=Main-File href="FILENAME.html">
<!--[if gte mso 9]><xml>
<o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]-->
</head>
<body lang=EN link=blue vlink="#954F72">
<div style='mso-element:footnote-separator' id=fs>
<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
normal'><span lang=EN-GB><span style='mso-special-character:footnote-separator'><![if !supportFootnotes]>
<hr align=left size=1 width="33%">
<![endif]></span></span></p>
</div>
<div style='mso-element:footnote-continuation-separator' id=fcs>
<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
normal'><span lang=EN-GB><span style='mso-special-character:footnote-continuation-separator'><![if !supportFootnotes]>
<hr align=left size=1>
<![endif]></span></span></p>
</div>
<div style='mso-element:endnote-separator' id=es>
<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
normal'><span lang=EN-GB><span style='mso-special-character:footnote-separator'><![if !supportFootnotes]>
<hr align=left size=1 width="33%">
<![endif]></span></span></p>
</div>
<div style='mso-element:endnote-continuation-separator' id=ecs>
<p class=MsoNormal style='margin-bottom:0cm;margin-bottom:.0001pt;line-height:
normal'><span lang=EN-GB><span style='mso-special-character:footnote-continuation-separator'><![if !supportFootnotes]>
<hr align=left size=1>
<![endif]></span></span></p>
</div>
<div style='mso-element:header' id=eh1>
<p class=MsoHeader align=left style='text-align:left;line-height:12.0pt;
mso-line-height-rule:exactly'><span lang=EN-GB>ISO/IEC&#x26;nbsp;CD 17301-1:2016(E)</span></p>
</div>
<div style='mso-element:header' id=h1>
<p class=MsoHeader style='margin-bottom:18.0pt'><span lang=EN-GB
style='font-size:10.0pt;mso-bidi-font-size:11.0pt;font-weight:normal'>&#xa9;
ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All rights reserved</span><span lang=EN-GB
style='font-weight:normal'><o:p></o:p></span></p>
</div>
<div style='mso-element:footer' id=ef1>
<p class=MsoFooter style='margin-top:12.0pt;line-height:12.0pt;mso-line-height-rule:
exactly'><!--[if supportFields]><b style='mso-bidi-font-weight:normal'><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'>&#xa0;</span>PAGE<span style='mso-spacerun:yes'>&#xa0;&#xa0;
</span>\\* MERGEFORMAT <span style='mso-element:field-separator'></span></span></b><![endif]--><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-no-proof:yes'>2</span></span></b><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-element:field-end'></span></span></b><![endif]--><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-tab-count:1'>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span>&#xa9;
ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All rights reserved<o:p></o:p></span></p>
</div>
<div style='mso-element:header' id=eh2>
<p class=MsoHeader align=left style='text-align:left;line-height:12.0pt;
mso-line-height-rule:exactly'><span lang=EN-GB>ISO/IEC&#x26;nbsp;CD 17301-1:2016(E)</span></p>
</div>
<div style='mso-element:header' id=h2>
<p class=MsoHeader align=right style='text-align:right;line-height:12.0pt;
mso-line-height-rule:exactly'><span lang=EN-GB>ISO/IEC&#x26;nbsp;CD 17301-1:2016(E)</span></p>
</div>
<div style='mso-element:footer' id=ef2>
<p class=MsoFooter style='line-height:12.0pt;mso-line-height-rule:exactly'><!--[if supportFields]><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'>&#xa0;</span>PAGE<span style='mso-spacerun:yes'>&#xa0;&#xa0;
</span>\\* MERGEFORMAT <span style='mso-element:field-separator'></span></span><![endif]--><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-no-proof:yes'>ii</span></span><!--[if supportFields]><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-end'></span></span><![endif]--><span lang=EN-GB
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span style='mso-tab-count:
1'>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span>&#xa9;
ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All rights reserved<o:p></o:p></span></p>
</div>
<div style='mso-element:footer' id=f2>
<p class=MsoFooter style='line-height:12.0pt'><span lang=EN-GB
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'>&#xa9; ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All
rights reserved<span style='mso-tab-count:1'>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span></span><!--[if supportFields]><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-begin'></span> PAGE<span style='mso-spacerun:yes'>&#xa0;&#xa0;
</span>\\* MERGEFORMAT <span style='mso-element:field-separator'></span></span><![endif]--><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-no-proof:yes'>iii</span></span><!--[if supportFields]><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-end'></span></span><![endif]--><span lang=EN-GB
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span></p>
</div>
<div style='mso-element:footer' id=ef3>
<p class=MsoFooter style='margin-top:12.0pt;line-height:12.0pt;mso-line-height-rule:
exactly'><!--[if supportFields]><b style='mso-bidi-font-weight:normal'><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-element:field-begin'></span><span
style='mso-spacerun:yes'>&#xa0;</span>PAGE<span style='mso-spacerun:yes'>&#xa0;&#xa0;
</span>\\* MERGEFORMAT <span style='mso-element:field-separator'></span></span></b><![endif]--><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-no-proof:yes'>2</span></span></b><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-element:field-end'></span></span></b><![endif]--><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><span
style='mso-tab-count:1'>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span>&#xa9;
ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All rights reserved<o:p></o:p></span></p>
</div>
<div style='mso-element:footer' id=f3>
<p class=MsoFooter style='line-height:12.0pt'><span lang=EN-GB
style='font-size:10.0pt;mso-bidi-font-size:11.0pt'>&#xa9; ISO/IEC&#x26;nbsp;2016&#x26;nbsp;&#x2013; All
rights reserved<span style='mso-tab-count:1'>&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0;&#xa0; </span></span><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-element:field-begin'></span>
PAGE<span style='mso-spacerun:yes'>&#xa0;&#xa0; </span>\\* MERGEFORMAT <span
style='mso-element:field-separator'></span></span></b><![endif]--><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-no-proof:yes'>3</span></span></b><!--[if supportFields]><b
style='mso-bidi-font-weight:normal'><span lang=EN-GB style='font-size:10.0pt;
mso-bidi-font-size:11.0pt'><span style='mso-element:field-end'></span></span></b><![endif]--><span
lang=EN-GB style='font-size:10.0pt;mso-bidi-font-size:11.0pt'><o:p></o:p></span></p>
</div>
</body>
</html>
FTR

DEFAULT_STYLESHEET = File.read("lib/html2doc/wordstyle.css", encoding: "utf-8").freeze

def guid_clean(x)
  x.gsub(/NextPart_[0-9a-f.]+/, "NextPart_")
end

def image_clean(x)
  x.gsub(%r{[0-9a-f-]+\.png}, "image.png").
    gsub(%r{[0-9a-f-]+\.gif}, "image.gif").
    gsub(%r{[0-9a-f-]+\.(jpeg|jpg)}, "image.jpg").
    gsub(%r{------=_NextPart_\s+Content-Location: file:///C:/Doc/test_files/image\.(png|gif).*?\s-----=_NextPart_}m, "------=_NextPart_").
    gsub(%r{Content-Type: image/(png|gif|jpeg)[^-]*------=_NextPart_-?-?}m, "").
    gsub(%r{ICAgICAg[^-]*-----}m, "-----").
    gsub(%r{\s*</img>\s*}m, "</img>").
    gsub(%r{</body>\s*</html>}m, "</body></html>")
end

RSpec.describe Html2Doc do
  it "has a version number" do
    expect(Html2Doc::VERSION).not_to be nil
  end

  it "processes a blank document" do
    Html2Doc.process(html_input(""), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END} 
    #{word_body("", '<div style="mso-element:footnote-list"/>')} #{WORD_FTR1}
    OUTPUT
  end

  it "removes any temp files" do
    File.delete("test.doc")
    Html2Doc.process(html_input(""), filename: "test")
    expect(File.exist?("test.doc")).to be true
    expect(File.exist?("test.htm")).to be false
    expect(File.exist?("test_files")).to be false
  end

  it "processes a stylesheet in an HTML document with a title" do
    Html2Doc.process(html_input(""), filename: "test", stylesheet: "lib/html2doc/wordstyle.css")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END} 
    #{word_body("", '<div style="mso-element:footnote-list"/>')} #{WORD_FTR1}
    OUTPUT
  end

  it "processes a stylesheet in an HTML document without a title" do
    Html2Doc.process(html_input_no_title(""), filename: "test", stylesheet: "lib/html2doc/wordstyle.css")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR.sub("<title>blank</title>", "")} 
    #{DEFAULT_STYLESHEET} #{WORD_HDR_END} 
    #{word_body("", '<div style="mso-element:footnote-list"/>')} #{WORD_FTR1}
    OUTPUT
  end

  it "processes a stylesheet in an HTML document with an empty head" do
    Html2Doc.process(html_input_empty_head(""), filename: "test", stylesheet: "lib/html2doc/wordstyle.css")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR.sub("<title>blank</title>", "")}
    #{DEFAULT_STYLESHEET} 
    #{WORD_HDR_END.sub('<meta name="Originator" content="Me"/>'+"\n", "").sub("</style>\n</head>", "</style></head>")} 
    #{word_body("", '<div style="mso-element:footnote-list"/>')} #{WORD_FTR1}
    OUTPUT
  end

  it "processes a header" do
    Html2Doc.process(html_input(""), filename: "test", header_file: "spec/header.html")
    html = guid_clean(File.read("test.doc", encoding: "utf-8"))
    hdr = Base64.decode64(html.sub(%r{^.*Content-Location: file:///C:/Doc/test_files/header.html}, "").
                           sub(%r{^.*Content-Type: text/html charset="utf-8"}m, "").
                           sub(%r{------=_NextPart_--.*$}m, "")).force_encoding("UTF-8")
    #expect(hdr.gsub(/\xa0/, " ")).to match_fuzzy(HEADERHTML)
    expect(HTMLEntities.new.encode(hdr, :hexadecimal).
           gsub(/\&#x3c;/, "<").gsub(/\&#x3e;/, ">").gsub(/\&#x27;/, "'").gsub(/\&#x22;/, '"').
           gsub(/\&#xd;/, "&#xa;").gsub(/\&#xa;/, "\n")).to match_fuzzy(HEADERHTML)
    expect(html.sub(%r{Content-Location: file:///C:/Doc/test_files/header.html.*$}m, "")).
           to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET.gsub(/FILENAME/, "test")} 
    #{WORD_HDR_END} #{word_body("", '<div style="mso-element:footnote-list"/>')} #{WORD_FTR2}
    OUTPUT
  end

  it "processes a header with an image" do
    Html2Doc.process(html_input(""), filename: "test", header_file: "spec/header_img.html")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).to match(%r{Content-Type: image/png})
  end


  it "processes a populated document" do
    simple_body = "<h1>Hello word!</h1>
    <div>This is a very simple document</div>"
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body(simple_body, '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "processes AsciiMath" do
    Html2Doc.process(html_input(%[<div>{{sum_(i=1)^n i^3=((n(n+1))/2)^2 text("integer"))}}</div>]), filename: "test", asciimathdelims: ["{{", "}}"])
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('
       <div><m:oMath>
       <m:nary><m:naryPr><m:chr m:val="&#x2211;"></m:chr><m:limLoc m:val="undOvr"></m:limLoc><m:grow m:val="on"></m:grow><m:subHide m:val="off"></m:subHide><m:supHide m:val="off"></m:supHide></m:naryPr><m:sub>
       <m:r><m:t>i=1</m:t></m:r>
       </m:sub><m:sup><m:r><m:t>n</m:t></m:r></m:sup><m:e><m:sSup><m:e><m:r><m:t>i</m:t></m:r></m:e><m:sup><m:r><m:t>3</m:t></m:r></m:sup></m:sSup></m:e></m:nary>
       <m:r><m:t>=</m:t></m:r>
       <m:sSup><m:e>
       <m:r><m:t>(</m:t></m:r>
       <m:f><m:fPr><m:type m:val="bar"></m:type></m:fPr><m:num>
       <m:r><m:t>n</m:t></m:r>
       <m:r><m:t>(n+1)</m:t></m:r>
       </m:num><m:den><m:r><m:t>2</m:t></m:r></m:den></m:f>
       <m:r><m:t>)</m:t></m:r>
       </m:e><m:sup><m:r><m:t>2</m:t></m:r></m:sup></m:sSup>
       <m:r><m:rPr><m:nor></m:nor></m:rPr><m:t>"integer"</m:t></m:r>
       </m:oMath>
    </div>', '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "left-aligns AsciiMath" do
    Html2Doc.process(html_input("<div style='text-align:left;'>{{sum_(i=1)^n i^3=((n(n+1))/2)^2}}</div>"), filename: "test", asciimathdelims: ["{{", "}}"])
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('
       <div style="text-align:left;"><m:oMathPara><m:oMathParaPr><m:jc m:val="left"/></m:oMathParaPr><m:oMath>
       <m:nary><m:naryPr><m:chr m:val="&#x2211;"></m:chr><m:limLoc m:val="undOvr"></m:limLoc><m:grow m:val="on"></m:grow><m:subHide m:val="off"></m:subHide><m:supHide m:val="off"></m:supHide></m:naryPr><m:sub>
       <m:r><m:t>i=1</m:t></m:r>
       </m:sub><m:sup><m:r><m:t>n</m:t></m:r></m:sup><m:e><m:sSup><m:e><m:r><m:t>i</m:t></m:r></m:e><m:sup><m:r><m:t>3</m:t></m:r></m:sup></m:sSup></m:e></m:nary>
       <m:r><m:t>=</m:t></m:r>
       <m:sSup><m:e>
       <m:r><m:t>(</m:t></m:r>
       <m:f><m:fPr><m:type m:val="bar"></m:type></m:fPr><m:num>
       <m:r><m:t>n</m:t></m:r>
       <m:r><m:t>(n+1)</m:t></m:r>
       </m:num><m:den><m:r><m:t>2</m:t></m:r></m:den></m:f>
       <m:r><m:t>)</m:t></m:r>
       </m:e><m:sup><m:r><m:t>2</m:t></m:r></m:sup></m:sSup>
       </m:oMath>
       </m:oMathPara></div>', '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "right-aligns AsciiMath" do
    Html2Doc.process(html_input("<div style='text-align:right;'>{{sum_(i=1)^n i^3=((n(n+1))/2)^2}}</div>"), filename: "test", asciimathdelims: ["{{", "}}"])
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('
       <div style="text-align:right;"><m:oMathPara><m:oMathParaPr><m:jc m:val="right"/></m:oMathParaPr><m:oMath>
       <m:nary><m:naryPr><m:chr m:val="&#x2211;"></m:chr><m:limLoc m:val="undOvr"></m:limLoc><m:grow m:val="on"></m:grow><m:subHide m:val="off"></m:subHide><m:supHide m:val="off"></m:supHide></m:naryPr><m:sub>
       <m:r><m:t>i=1</m:t></m:r>
       </m:sub><m:sup><m:r><m:t>n</m:t></m:r></m:sup><m:e><m:sSup><m:e><m:r><m:t>i</m:t></m:r></m:e><m:sup><m:r><m:t>3</m:t></m:r></m:sup></m:sSup></m:e></m:nary>
       <m:r><m:t>=</m:t></m:r>
       <m:sSup><m:e>
       <m:r><m:t>(</m:t></m:r>
       <m:f><m:fPr><m:type m:val="bar"></m:type></m:fPr><m:num>
       <m:r><m:t>n</m:t></m:r>
       <m:r><m:t>(n+1)</m:t></m:r>
       </m:num><m:den><m:r><m:t>2</m:t></m:r></m:den></m:f>
       <m:r><m:t>)</m:t></m:r>
       </m:e><m:sup><m:r><m:t>2</m:t></m:r></m:sup></m:sSup>
       </m:oMath>
       </m:oMathPara></div>', '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "wraps msup after munderover in MathML" do
    Html2Doc.process(html_input("<div><math xmlns='http://www.w3.org/1998/Math/MathML'>
<munderover><mo>&#x2211;</mo><mrow><mi>i</mi><mo>=</mo><mn>0</mn></mrow><mrow><mi>n</mi></mrow></munderover><msup><mn>2</mn><mrow><mi>i</mi></mrow></msup></math></div>"), filename: "test", asciimathdelims: ["{{", "}}"])
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div><m:oMath>
       <m:nary><m:naryPr><m:chr m:val="&#x2211;"></m:chr><m:limLoc m:val="undOvr"></m:limLoc><m:grow m:val="on"></m:grow><m:subHide m:val="off"></m:subHide><m:supHide m:val="off"></m:supHide></m:naryPr><m:sub><m:r><m:t>i=0</m:t></m:r></m:sub><m:sup><m:r><m:t>n</m:t></m:r></m:sup><m:e><m:sSup><m:e><m:r><m:t>2</m:t></m:r></m:e><m:sup><m:r><m:t>i</m:t></m:r></m:sup></m:sSup></m:e></m:nary></m:oMath>
    </div>', '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "processes tabs" do
    simple_body = "<h1>Hello word!</h1>
    <div>This is a very &tab; simple document</div>"
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body(simple_body.gsub(/\&tab;/, %[<span style="mso-tab-count:1">&#xA0; </span>]), '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "makes unstyled paragraphs be MsoNormal" do
    simple_body = '<h1>Hello word!</h1>
    <p>This is a very simple document</p>
    <p class="x">This style stays</p>'
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body(simple_body.gsub(/<p>/, %[<p class="MsoNormal">]), '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "makes unstyled list entries be MsoNormal" do
    simple_body = '<h1>Hello word!</h1>
    <ul>
    <li>This is a very simple document</li>
    <li class="x">This style stays</li>
    </ul>'
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body(simple_body.gsub(/<li>/, %[<li class="MsoNormal">]), '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "resizes images for height, in a file in a subdirectory" do
    simple_body = '<img src="19160-6.png">'
    Html2Doc.process(html_input(simple_body), filename: "spec/test")
    testdoc = File.read("spec/test.doc", encoding: "utf-8")
    expect(testdoc).to match(%r{Content-Type: image/png})
    expect(image_clean(guid_clean(testdoc))).to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{image_clean(word_body('<img src="test_files/cb7b0d19-891e-4634-815a-570d019d454c.png" width="400" height="388"></img>', '<div style="mso-element:footnote-list"/>'))}
    #{image_clean(WORD_FTR3)}
    OUTPUT
  end

  it "resizes images for width" do
    simple_body = '<img src="spec/19160-7.gif">'
    Html2Doc.process(html_input(simple_body), filename: "test")
    testdoc = File.read("test.doc", encoding: "utf-8")
    expect(testdoc).to match(%r{Content-Type: image/gif})
    expect(image_clean(guid_clean(testdoc))).to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{image_clean(word_body('<img src="test_files/cb7b0d19-891e-4634-815a-570d019d454c.gif" width="400" height="118"></img>', '<div style="mso-element:footnote-list"/>'))}
    #{image_clean(WORD_FTR3).gsub(/image\.png/, "image.gif")}
    OUTPUT
  end

  it "resizes images for height" do
    simple_body = '<img src="spec/19160-8.jpg">'
    Html2Doc.process(html_input(simple_body), filename: "test")
    testdoc = File.read("test.doc", encoding: "utf-8")
    expect(testdoc).to match(%r{Content-Type: image/jpeg})
    expect(image_clean(guid_clean(testdoc))).to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{image_clean(word_body('<img src="test_files/cb7b0d19-891e-4634-815a-570d019d454c.jpg" width="208" height="680"></img>', '<div style="mso-element:footnote-list"/>'))}
    #{image_clean(WORD_FTR3).gsub(/image\.png/, "image.jpg")}
    OUTPUT
  end

  it "resizes images with missing or auto sizes" do
    image = { "src" => "spec/19160-8.jpg" }
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
    image["width"] = "20"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [20, 65]
    image.delete("width")
    image["height"] = "50"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [15, 50]
    image.delete("height")
    image["width"] = "500"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
    image.delete("width")
    image["height"] = "500"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
    image["width"] = "20"
    image["height"] = "auto"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [20, 65]
    image["width"] = "auto"
    image["height"] = "50"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [15, 50]
    image["width"] = "500"
    image["height"] = "auto"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
    image["width"] = "auto"
    image["height"] = "500"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
    image["width"] = "auto"
    image["height"] = "auto"
    expect(Html2Doc.image_resize(image, "spec/19160-8.jpg", 100, 100)).to eq [30, 100]
  end

  it "does not move images if they are external URLs" do
    simple_body = '<img src="https://example.com/19160-6.png">'
    Html2Doc.process(html_input(simple_body), filename: "test")
    testdoc = File.read("test.doc", encoding: "utf-8")
    expect(image_clean(guid_clean(testdoc))).to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{image_clean(word_body('<img src="https://example.com/19160-6.png"></img>', '<div style="mso-element:footnote-list"/>'))}
    #{image_clean(WORD_FTR1)}
    OUTPUT
  end

  it "warns about SVG" do
    simple_body = '<img src="https://example.com/19160-6.svg">'
    expect{ Html2Doc.process(html_input(simple_body), filename: "test") }.to output("https://example.com/19160-6.svg: SVG not supported\n").to_stderr
  end

  it "processes epub:type footnotes" do
    simple_body = '<div>This is a very simple 
     document<a epub:type="footnote" href="#a1">1</a> allegedly<a epub:type="footnote" href="#a2">2</a></div>
     <aside id="a1">Footnote</aside>
     <aside id="a2">Other Footnote</aside>'
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>This is a very simple
    document<a epub:type="footnote" href="#_ftn1" style="mso-footnote-id:ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a> allegedly<a epub:type="footnote" href="#_ftn2" style="mso-footnote-id:ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a></div>',
    '<div style="mso-element:footnote-list"><div style="mso-element:footnote" id="ftn1">
<p id="" class="MsoFootnoteText"><a style="mso-footnote-id:ftn1" href="#_ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Footnote</p></div>
<div style="mso-element:footnote" id="ftn2">
<p id="" class="MsoFootnoteText"><a style="mso-footnote-id:ftn2" href="#_ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Other Footnote</p></div>
</div>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "processes class footnotes" do
    simple_body = '<div>This is a very simple
     document<a class="footnote" href="#a1">1</a> allegedly<a class="footnote" href="#a2">2</a></div>
     <aside id="a1">Footnote</aside>
     <aside id="a2">Other Footnote</aside>'
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>This is a very simple
    document<a class="footnote" href="#_ftn1" style="mso-footnote-id:ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a> allegedly<a class="footnote" href="#_ftn2" style="mso-footnote-id:ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a></div>',
    '<div style="mso-element:footnote-list"><div style="mso-element:footnote" id="ftn1">
<p id="" class="MsoFootnoteText"><a style="mso-footnote-id:ftn1" href="#_ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Footnote</p></div>
<div style="mso-element:footnote" id="ftn2">
<p id="" class="MsoFootnoteText"><a style="mso-footnote-id:ftn2" href="#_ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Other Footnote</p></div>
</div>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "extracts paragraphs from footnotes" do
    simple_body = '<div>This is a very simple
     document<a class="footnote" href="#a1">1</a> allegedly<a class="footnote" href="#a2">2</a></div>
     <aside id="a1"><p>Footnote</p></aside>
     <div id="a2"><p>Other Footnote</p></div>'
    Html2Doc.process(html_input(simple_body), filename: "test")
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>This is a very simple
    document<a class="footnote" href="#_ftn1" style="mso-footnote-id:ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a> allegedly<a class="footnote" href="#_ftn2" style="mso-footnote-id:ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a></div>',
    '<div style="mso-element:footnote-list"><div style="mso-element:footnote" id="ftn1">
<p class="MsoFootnoteText"><a style="mso-footnote-id:ftn1" href="#_ftn1" name="_ftnref1" title="" id="_ftnref1"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Footnote</p></div>
<div style="mso-element:footnote" id="ftn2">
<p class="MsoFootnoteText"><a style="mso-footnote-id:ftn2" href="#_ftn2" name="_ftnref2" title="" id="_ftnref2"><span class="MsoFootnoteReference"><span style="mso-special-character:footnote"></span></span></a>Other Footnote</p></div>
</div>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "labels lists with list styles" do
    simple_body = <<~BODY
      <div><ul>
      <li><div><p><ol><li><ul><li><p><ol><li><ol><li>A</li><li><p>B</p><p>B2</p></li><li>C</li></ol></li></ol></p></li></ul></li></ol></p></div></li></ul></div>
    BODY
    Html2Doc.process(html_input(simple_body), filename: "test", liststyles: {ul: "l1", ol: "l2"})
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>
    <p style="mso-list:l1 level1 lfo1;" class="MsoListParagraphCxSpFirst"><div><p class="MsoNormal"><p style="mso-list:l2 level2 lfo1;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level4 lfo1;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level5 lfo1;" class="MsoListParagraphCxSpFirst">A</p><p style="mso-list:l2 level5 lfo1;" class="MsoListParagraphCxSpMiddle">B<p class="MsoListParagraphCxSpMiddle">B2</p></p><p style="mso-list:l2 level5 lfo1;" class="MsoListParagraphCxSpLast">C</p></p></p></p></div></p></div>',
    '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end


  it "restarts numbering of lists with list styles" do
    simple_body = <<~BODY
      <div>
      <ol><li><div><p><ol><li><ul><li><p><ol><li><ol><li>A</li></ol></li></ol></p></li></ul></li></ol></p></div></li></ol>
      <ol><li><div><p><ol><li><ul><li><p><ol><li><ol><li>A</li></ol></li></ol></p></li></ul></li></ol></p></div></li></ol></div>
    BODY
    Html2Doc.process(html_input(simple_body), filename: "test", liststyles: {ul: "l1", ol: "l2"})
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>
      <p style="mso-list:l2 level1 lfo1;" class="MsoListParagraphCxSpFirst"><div><p class="MsoNormal"><p style="mso-list:l2 level2 lfo1;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level4 lfo1;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level5 lfo1;" class="MsoListParagraphCxSpFirst">A</p></p></p></p></div></p>
      <p style="mso-list:l2 level1 lfo2;" class="MsoListParagraphCxSpFirst"><div><p class="MsoNormal"><p style="mso-list:l2 level2 lfo2;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level4 lfo2;" class="MsoListParagraphCxSpFirst"><p style="mso-list:l2 level5 lfo2;" class="MsoListParagraphCxSpFirst">A</p></p></p></p></div></p></div>',
    '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

  it "replaces id attributes with explicit a@name bookmarks" do
    simple_body = <<~BODY
      <div>
        <p id="a">Hello</p>
        <p id="b"/>
      </div>
    BODY
    Html2Doc.process(html_input(simple_body), filename: "test", liststyles: {ul: "l1", ol: "l2"})
    expect(guid_clean(File.read("test.doc", encoding: "utf-8"))).
      to match_fuzzy(<<~OUTPUT)
    #{WORD_HDR} #{DEFAULT_STYLESHEET} #{WORD_HDR_END}
    #{word_body('<div>
        <p class="MsoNormal"><a name="a" id="a"></a>Hello</p>
        <p class="MsoNormal"><a name="b" id="b"></a></p>
      </div>',
    '<div style="mso-element:footnote-list"/>')}
    #{WORD_FTR1}
    OUTPUT
  end

end
