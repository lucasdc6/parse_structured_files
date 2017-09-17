require 'parse_structured_files/plain_text'
require 'parse_structured_files/field_set'
require 'rspec'

describe ParseStructuredFiles::PlainText  do 
  before { @parser = ParseStructuredFiles::PlainText.new('spec/file_test', general_expresion: /(?<l>.*)/) }
  it "Accessing with Method correctly" do
    @parser.each { |line| expect(line.l).to eq "011112222" }
  end

  it "Accessing like Hash correctly" do
    @parser.each { |line| expect(line[:l]).to eq "011112222" }
  end
end
