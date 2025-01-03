# frozen_string_literal: true

require_relative "lib/interactors_mindmap/version"

Gem::Specification.new do |spec|
  spec.name = "interactors_mindmap"
  spec.version = InteractorsMindmap::VERSION
  spec.authors = ["martinnicolas"]
  spec.email = ["ttincho77@gmail.com"]

  spec.summary = "Mindmap chart for Interactors."
  spec.description = "Mindmap chart for Interactors."
  spec.homepage = "https://github.com/martinnicolas/interactors_mindmap"
  spec.license = "MIT"
  spec.required_ruby_version = "~> 3.3.6"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/martinnicolas/interactors_mindmap"
  spec.metadata["changelog_uri"] = "https://github.com/martinnicolas/interactors_mindmap/blob/master/CHANGELOG.md"
  spec.metadata["bug_tracker_uri"] = "https://github.com/martinnicolas/interactors_mindmap/issues"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"
end
