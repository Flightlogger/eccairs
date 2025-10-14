# frozen_string_literal: true

require_relative "lib/eccairs/version"

Gem::Specification.new do |spec|
  spec.name = "eccairs"
  spec.version = Eccairs::VERSION
  spec.authors = ["Joseph Carpenter"]
  spec.email = ["joseph@flightlogger.net"]

  spec.summary = "Generate ECCAIRS Aviation v5.1.0.0 XML reports with a Rails-style DSL"
  spec.description = "A Ruby gem for generating ECCAIRS (European Coordination Centre for Accident and Incident Reporting Systems) XML reports compliant with the ECCAIRS Aviation v5.1.0.0 taxonomy."
  spec.homepage = "https://github.com/Flightlogger/eccairs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Flightlogger/eccairs"
  spec.metadata["changelog_uri"] = "https://github.com/Flightlogger/eccairs/blob/main/CHANGELOG.md"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ docs/ Gemfile .gitignore .rspec spec/ .github/ .rubocop.yml])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.16"
  spec.add_dependency "zeitwerk", "~> 2.7"
end
