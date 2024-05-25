# frozen_string_literal: true

RSpec.describe InteractorsMindmap::DocFilesGenerator do
  it "generate html interactors docs files" do
    expect do
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path
      InteractorsMindmap.generate_html_file(interactor_names)
    end.to output("#{HTML_FILE_GENERATED_MESSAGE}\n").to_stdout

    expect(FileUtils.compare_file(EXPECTED_HTML_FILE, HTML_FILE_NAME)).to eql(true)
  end

  it "returns error message when interactors folder is not found when generating html file" do
    expect do
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path("")
      InteractorsMindmap.generate_html_file(interactor_names)
    end.to output("#{NO_INTERACTORS_FOUND_MESSAGE}\n").to_stdout
  end
end
