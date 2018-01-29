# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "html2doc/version"

Gem::Specification.new do |spec|
  spec.name          = "html2doc"
  spec.version       = Html2Doc::VERSION
  spec.authors       = ["Ribose Inc."]
  spec.email         = ["open.source@ribose.com"]

  spec.summary       = "Convert HTML document to Microsoft Word document"
    "in AsciiDoc."
  spec.description   = <<~DESCRIPTION
    Convert HTML document to Microsoft Word document.

    This gem is in active development.
  DESCRIPTION

  spec.homepage      = "https://github.com/riboseinc/html2doc"
  spec.license       = "MIT"

  spec.bindir        = "bin"
  spec.require_paths = ["lib"]
  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec}/*`.split("\n")
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.add_dependency "htmlentities", "~> 4.3.4"
  spec.add_dependency "image_size"
  spec.add_dependency "mime-types"
  spec.add_dependency "nokogiri", "~> 1.8.1"
  spec.add_dependency "thread_safe"
  spec.add_dependency "uuidtools"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "byebug", "~> 9.1"
  spec.add_development_dependency "equivalent-xml", "~> 0.6"
  spec.add_development_dependency "guard", "~> 2.14"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "rubocop", "~> 0.50"
  spec.add_development_dependency "simplecov", "~> 0.15"
  spec.add_development_dependency "timecop", "~> 0.9"
end
