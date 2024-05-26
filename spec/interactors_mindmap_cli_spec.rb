# frozen_string_literal: true

RSpec.describe InteractorsMindmap::Cli do
  it "run cli with --all file option" do
    expect do
      InteractorsMindmap::Cli.new(["--all"]).run
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

  it "run cli with --version option" do
    expect do
      InteractorsMindmap::Cli.new(["--version"]).run
    end.to output("#{InteractorsMindmap::VERSION}\n").to_stdout
  end

  it "run cli with wrong argument option" do
    expect do
      InteractorsMindmap::Cli.new(["-a"]).run
    end.to output(HELP_TEXT).to_stdout
  end
end
