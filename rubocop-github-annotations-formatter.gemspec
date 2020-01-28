require_relative 'lib/rubocop-github-annotation-formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "rubocop-github-annotations-formatter"
  spec.version       = RubocopGithubAnnotationFormatter::VERSION
  spec.authors       = ["Colby Swandale"]
  spec.email         = ["me@colby.fyi"]

  spec.summary       = %q{Format rubocop output for Github Annotations}
  spec.description   = %q{Format rubocop output for Github Annotations}
  spec.homepage      = "https://github.com/colby-swandale/rubocop-github-annotations-formatter"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/colby-swandale/rubocop-github-annotations-formatter"

  spec.require_paths = ["lib"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.add_dependency "rubocop"
end
