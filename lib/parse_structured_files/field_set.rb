require "ostruct"

module ParseStructuredFiles

  # Representation of field of the file given
  #
  # Normally, these fields are used to validate the integrity of the file
  class Fieldset < OpenStruct

    # Create a new Fieldset with the given array
    # @return [Fieldset]
    def self.[](arr)
      self.new(arr.to_h)
    end

    # Do nothing with a line when 'each' is called
    # @param block [Proc]
    def do_with_line(&block); end

    # Return a DataFieldset
    # @return [DataFieldset]
    def as_data_fieldset
      DataFieldset[self]
    end
  end

  # Representation of a special field of the file given
  #
  # That field is processed by the block given to 'each' message
  class DataFieldset < Fieldset

    # call the block given with the self as parameter
    # @param block [Proc]
    def do_with_line(&block)
      block.call self
    end
  end
end
