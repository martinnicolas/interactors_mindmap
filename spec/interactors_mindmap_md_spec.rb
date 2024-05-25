# frozen_string_literal: true

RSpec.describe InteractorsMindmap::DocFilesGenerator do
  it "generate md interactors docs files" do
    expect do
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path
      InteractorsMindmap.generate_md_file(interactor_names)
    end.to output("#{MD_FILE_GENERATED_MESSAGE}\n").to_stdout

    expect(FileUtils.compare_file(EXPECTED_MD_FILE, MD_FILE_NAME)).to eql(true)
  end

  it "returns error message when interactors folder is not found when generating md file" do
    expect do
      interactor_names = InteractorsMindmap.interactor_names_from_files_on_path("")
      InteractorsMindmap.generate_md_file(interactor_names)
    end.to output("#{NO_INTERACTORS_FOUND_MESSAGE}\n").to_stdout
  end
end
