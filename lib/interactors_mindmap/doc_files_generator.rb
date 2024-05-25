# frozen_string_literal: true

# InteractorsMindmap module
module InteractorsMindmap
  # Generate doc files
  class DocFilesGenerator
    HTML_FILE_NAME = "interactors.html"
    MD_FILE_NAME = "interactors.md"

    attr_reader :interactor_names

    def initialize(interactor_names:)
      @interactor_names = interactor_names
    end

    def self.generate_md_file(interactor_names:)
      new(interactor_names: interactor_names).generate_md_file
    end

    def self.generate_html_file(interactor_names:)
      new(interactor_names: interactor_names).generate_html_file
    end

    def generate_md_file
      magic_comments = <<~COMMENTS
        ---
          markmap:
            initialExpandLevel: 6
            colorFreezeLevel: 2
        ---

      COMMENTS

      File.write(MD_FILE_NAME, magic_comments)

      interactor_names.each do |interactor_name|
        File.open(MD_FILE_NAME, "a") { |f| f.write "#{interactor_name}\n" }
      end
    end

    def generate_html_file
      page = <<~HTML
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="UTF-8" />
            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <title>Markmap</title>
            <style>
              svg.markmap {
                width: 100%;
                height: 100vh;
              }
            </style>
            <script src="https://cdn.jsdelivr.net/npm/markmap-autoloader@0.16"></script>
          </head>
          <body>
            <div class="markmap">
              <script type="text/template">
                ---
                  markmap:
                    initialExpandLevel: 6
                    colorFreezeLevel: 2
                ---

                #{interactor_names.join("\n        ")}
              </script>
            </div>
          </body>
        </html>
      HTML

      File.open(HTML_FILE_NAME, "w") { |f| f.write page }
    end
  end
end
