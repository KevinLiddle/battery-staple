require 'fakefs/safe'
require 'dictionary_reader'

describe DictionaryReader do

  it "loads words from dictionary text file" do
    FakeFS do
      Dir.mkdir("..")
      Dir.mkdir("lib")
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("\nfoobar\n\nbarjim\n\n")
      end

      DictionaryReader.read.should == ["foobar", "barjim"]
    end
  end

  it "excludes words with 3 or fewer letters" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("\njimsedge\njim \nyim\r\n tim\njims\njimberjawed\n")
      end
      DictionaryReader.read.should == ["jimsedge", "jims", "jimberjawed"]
    end
  end

  it "excludes words that start with a capital letter" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("Yabba\ndabba\nDoo\n")
      end
      DictionaryReader.read.should == ["dabba"]
    end
  end

  it "removes the profane flag from words when clean flag is not set" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("yabba\ndabba\npoop:profane\n")
      end
      DictionaryReader.read(false).should == ["yabba", "dabba", "poop"]
    end
  end

  it "does not include profane words when clean flag is true" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("yabba\ndabba\npoop:profane\n")
      end
      DictionaryReader.read(true).should == ["yabba", "dabba"]
    end
  end

end
