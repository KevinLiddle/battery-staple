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

      expect(DictionaryReader.read).to eq(["foobar", "barjim"])
    end
  end

  it "excludes words with 3 or fewer letters" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("\njimsedge\njim \nyim\r\n tim\njims\njimberjawed\n")
      end
      expect(DictionaryReader.read).to eq(["jimsedge", "jims", "jimberjawed"])
    end
  end

  it "excludes words that start with a capital letter" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("Yabba\ndabba\nDoo\n")
      end
      expect(DictionaryReader.read).to eq(["dabba"])
    end
  end

  it "removes the profane flag from words when clean flag is not set" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("yabba\ndabba\npoop:profane\n")
      end
      expect(DictionaryReader.read(false)).to eq(["yabba", "dabba", "poop"])
    end
  end

  it "does not include profane words when clean flag is true" do
    FakeFS do
      File.open("#{File.dirname(__FILE__)}/../lib/dictionary.txt", "w") do |file|
        file.write("yabba\ndabba\npoop:profane\n")
      end
      expect(DictionaryReader.read(true)).to eq(["yabba", "dabba"])
    end
  end

end
