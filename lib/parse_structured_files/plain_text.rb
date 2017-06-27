# A collection of classes used to parse different kinds of files
module ParseStructuredFiles
  # A ParseFile is an abstraction of a parser
  class PlainText

    attr_reader :file_name

    # Initialize a ParseFile
    #
    # @param file_name [String] path to the file
    def initialize(file_name)
      @file_name = File::basename file_name
      @file = File.open(file_name, "r")
    end

    # Executes the block for every line of the file
    #
    # @param block [Proc]
    # @return [ParseFile]
    def each(&block)
      @file.rewind
      @file.each do | line |
        parse(line).do_with_line(&block)
      end
      self
    end

    private
    # Convert an array to a Fieldset object
    # @param arr [Array]
    # @return [Fieldset]
    def to_fieldset(arr)
      Fieldset[arr]
    end

    # Parse a line using the regexp
    # @param line [String]
    # @param structure [Regexp] store all in 'line' field by default
    # @return [Fieldset]
    def parse(line, structure: /(?<line>.*)/)
      line = line.match(structure)
      raise "Error in the line parse" if line.nil?
      to_fieldset line.names.zip(line.captures)
    end
  end
end
