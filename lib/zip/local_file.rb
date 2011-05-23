module Zip
  class LocalFile
    DICT_SIZE = 32_768 # kB

    attr_reader :header

    def initialize(contents)
      @header          = Header.read(contents)
    end

    def inflate
      compressed_data = StringIO.new(@header.compressed_data)
      inflator        = Zlib::Inflate.new(-Zlib::MAX_WBITS)
      inflated        = StringIO.new

      while chunk = compressed_data.read(DICT_SIZE)
        inflated << inflator.inflate(chunk)
      end

      inflated.rewind

      inflated
    end

    def file_name
      @header.file_name
    end

    def to_s
      %Q{<Zip::LocalFile name="#{@header.file_name}">}
    end

    class Header < BinData::Record
      endian :little

      uint32   :signature # 0x04034b50
      uint16   :required_version
      bit_flag :bit_flag
      uint16   :compression_method
      dos_time :last_modified_time
      dos_date :last_modified_date
      uint32   :crc32
      uint32   :size_compressed
      uint32   :size_uncompressed
      uint16   :file_name_length
      uint16   :extra_field_length

      string   :file_name,   :read_length => :file_name_length
      string   :extra_field, :read_length => :extra_field_length

      rest     :compressed_data
    end

    class DataDescriptor < BinData::Record
      endian :little

      uint32 :signature # 0x08074b50
      uint32 :crc32
      uint32 :size_compressed
      uint32 :size_uncompressed
    end
  end
end
