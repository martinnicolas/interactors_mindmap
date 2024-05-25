# frozen_string_literal: true

RSpec.describe InteractorsMindmap do
  it "has a version number" do
    expect(VERSION).not_to be nil
  end

  it "generate all interactors docs files" do
    expect do
      InteractorsMindmap.generate_docs
    end.to output("#{MD_FILE_GENERATED_MESSAGE}\n#{HTML_FILE_GENERATED_MESSAGE}\n").to_stdout

    expect(FileUtils.compare_file(EXPECTED_MD_FILE, MD_FILE_NAME)).to eql(true)
    expect(FileUtils.compare_file(EXPECTED_HTML_FILE, HTML_FILE_NAME)).to eql(true)
  end

  it "returns error message when interactors folder is not found" do
    expect do
      InteractorsMindmap.generate_docs("")
    end.to output("#{NO_INTERACTORS_FOUND_MESSAGE}\n").to_stdout
  end
end
