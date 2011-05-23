require_relative "../lib/zip"

describe Zip do
  let(:file)    { File.open("sample/Archive.zip", "rb") }
  let(:scanner) { Zip::Scanner.new(file) }
  let(:files)   { scanner.local_files }

  it "can extract the file names" do
    files[0].file_name.should == "Archive/"
    files[1].file_name.should == "Archive/README.md"
    files[2].file_name.should == "Archive/SUBMISSION_GUIDELINES.md"
  end

  it "can inflate the files" do
    file1 = File.open('sample/Archive/README.md').read
    file2 = File.open('sample/Archive/SUBMISSION_GUIDELINES.md').read

    files[1].inflate.read.should == file1
    files[2].inflate.read.should == file2
  end
end
