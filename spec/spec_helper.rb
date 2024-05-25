# frozen_string_literal: true

require "simplecov"

SimpleCov.start

require "interactors_mindmap"

EXPECTED_MD_FILE = "spec/fixtures/files/interactors.md"
EXPECTED_HTML_FILE = "spec/fixtures/files/interactors.html"

VERSION = InteractorsMindmap::VERSION
MD_FILE_GENERATED_MESSAGE = InteractorsMindmap::MD_FILE_GENERATED_MESSAGE
HTML_FILE_GENERATED_MESSAGE = InteractorsMindmap::HTML_FILE_GENERATED_MESSAGE
NO_INTERACTORS_FOUND_MESSAGE = InteractorsMindmap::NO_INTERACTORS_FOUND_MESSAGE

MD_FILE_NAME = InteractorsMindmap::DocFilesGenerator::MD_FILE_NAME
HTML_FILE_NAME = InteractorsMindmap::DocFilesGenerator::HTML_FILE_NAME

HELP_TEXT = InteractorsMindmap::Cli::HELP_TEXT

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
