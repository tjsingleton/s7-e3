module Zip
  class Scanner
    attr_reader :contents

    def initialize(file)
      @contents = file.read
    end

    def index(*needle)
      @contents.each_byte.each_cons(needle.size).each_with_index do |haystack, i|
        yield(i) if haystack == needle
      end
    end

    def signatures
      _signatures = []
      Zip::SIGNATURES.each do |key, signature|
        index(*signature) do |i|
          _signatures << [i, key]
        end
      end
      _signatures
    end

    def chunks
      _signatures = signatures.sort
      # marker for the end of the file + 1 since we are using exclusive ranges
      _signatures << [@contents.length+1, :OUT_OF_BOUNDS]
      _signatures.each_cons(2).map do |(start, current_key), (finish, next_key)|
        [current_key, start...finish]
      end
    end

    def read_chunk(range)
      @contents[range]
    end

    def local_files
      chunks.map do |key, range|
        if key == :local_file_header
          LocalFile.new read_chunk(range)
        end
      end.compact
    end

    def to_s
      %Q{<Zip::Scanner bytes="#{@contents.length}">}
    end
  end
end
