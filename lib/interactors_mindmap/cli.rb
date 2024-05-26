# frozen_string_literal: true

# InteractorsMindmap module
module InteractorsMindmap
  # Command line interface
  class Cli
    HELP_TEXT = <<~HELP_TEXT
      Usage:
        interactors_mindmap [options]
      Options:
        --md    # Generate md file
        --html  # Generate html file
        --help  # Show this message
    HELP_TEXT

    attr_reader :argv

    def initialize(argv)
      @argv = argv
    end

    def run
      first_argument = argv.first
      case first_argument
      when "--all"
        generate_all_docs
      when "--md"
        generate_md_doc
      when "--html"
        generate_html_doc
      when "--help"
        help
      end
    end

    private

    def generate_all_docs
      InteractorsMindmap.generate_docs
    end

    def generate_md_doc
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path
      InteractorsMindmap.generate_md_file(interactor_names)
    end

    def generate_html_doc
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path
      InteractorsMindmap.generate_html_file(interactor_names)
    end

    def help
      puts HELP_TEXT
    end
  end
end
