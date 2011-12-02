require 'fakefs/safe'
require 'dictionary_reader'

describe DictionaryReader do

  it "loads words from dictionary text file" do

    FakeFS do
      File.open("dictionary.txt", "w") do |file|
        file.write("\nfoobar\n\nbarjim\n\n")
      end

      DictionaryReader.read.should == ["foobar", "barjim"]
    end

  end

  it "excludes words with 3 or fewer letters" do
    FakeFS do
      File.open("dictionary.txt", "w") do |file|
        file.write("\njimsedge\njim\njims\njimberjawed\n")
      end
      DictionaryReader.read.should == ["jimsedge", "jims", "jimberjawed"]
    end
  end

  it "excludes words that start with a capital letter" do
    FakeFS do
      File.open("dictionary.txt", "w") do |file|
        file.write("Yabba\ndabba\nDoo")
      end
      DictionaryReader.read.should == ["dabba"]
    end
  end
end
