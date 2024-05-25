# frozen_string_literal: true

require_relative "interactors_mindmap/version"
require_relative "interactors_mindmap/interactors_names_parser"
require_relative "interactors_mindmap/doc_files_generator"
require_relative "interactors_mindmap/cli"
require_relative "interactors_mindmap/tree_node"

# Module to parse file names and generate interactors docs
module InteractorsMindmap
  INTERACTORS_FILES_PATH = "**/app/interactors/*.rb"
  NO_INTERACTORS_FOUND_MESSAGE = "No interactors found!"
  MD_FILE_GENERATED_MESSAGE = "Interactors .md file successfully generated!"
  HTML_FILE_GENERATED_MESSAGE = "Interactors .html file successfully generated!"

  def self.generate_docs(interactors_files_path = INTERACTORS_FILES_PATH)
    interactor_names = interactor_names_from_files_on_path(interactors_files_path)

    if interactor_names.one?
      puts NO_INTERACTORS_FOUND_MESSAGE
      return
    end
    generate_md_file(interactor_names)
    generate_html_file(interactor_names)
  end

  def self.interactor_names_from_files_on_path(interactors_files_path = INTERACTORS_FILES_PATH)
    InteractorsMindmap::InteractorsNamesParser.perform(files_path: interactors_files_path)
  end

  def self.generate_md_file(interactor_names)
    if interactor_names.one?
      puts NO_INTERACTORS_FOUND_MESSAGE
      return
    end

    InteractorsMindmap::DocFilesGenerator.generate_md_file(interactor_names: interactor_names)

    puts MD_FILE_GENERATED_MESSAGE
  end

  def self.generate_html_file(interactor_names)
    if interactor_names.one?
      puts NO_INTERACTORS_FOUND_MESSAGE
      return
    end

    InteractorsMindmap::DocFilesGenerator.generate_html_file(interactor_names: interactor_names)

    puts HTML_FILE_GENERATED_MESSAGE
  end
end
