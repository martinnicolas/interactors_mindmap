# frozen_string_literal: true

RSpec.describe InteractorsMindmap::Cli do
  it "run cli with no args files option" do
    expect do
      InteractorsMindmap::Cli.new([""]).run
    end.to output("#{MD_FILE_GENERATED_MESSAGE}\n#{HTML_FILE_GENERATED_MESSAGE}\n").to_stdout
  end

  it "run cli with --md file option" do
    expect do
      InteractorsMindmap::Cli.new(["--md"]).run
    end.to output("#{MD_FILE_GENERATED_MESSAGE}\n").to_stdout
  end

  it "run cli with --html file option" do
    expect do
      InteractorsMindmap::Cli.new(["--html"]).run
    end.to output("#{HTML_FILE_GENERATED_MESSAGE}\n").to_stdout
  end

  it "run cli with --help option" do
    expect do
      InteractorsMindmap::Cli.new(["--help"]).run
    end.to output(HELP_TEXT).to_stdout
  end
end
