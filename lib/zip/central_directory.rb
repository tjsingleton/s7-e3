module Zip
  module CentralDirectory
    class Header < BinData::Record
      endian :little

      uint32 :signature # 0x02014b50
      uint16 :created_version
      uint16 :required_version
      uint16 :bit_flag
      uint16 :compression_method
      uint16 :last_modified_time
      uint16 :last_modified_date
      uint32 :crc32
      uint32 :size_compressed
      uint32 :size_uncompressed
      uint16 :file_name_length
      uint16 :extra_field_length
      uint16 :file_comment_length
      uint16 :starting_disk_number
      uint16 :file_attributes_internal
      uint32 :file_attributes_external
      uint32 :local_header_offset

      string :file_name,    :read_length => :file_name_length
      string :extra_field,  :read_length => :extra_field_length
      string :file_comment, :read_length => :file_comment_length
    end

    class EndRecord < BinData::Record
      endian :little

      uint32 :signature # 0x06054b50
      uint16 :disk_number
      uint16 :disk_number_with_central_directory
      uint16 :total_entries_this_disk
      uint16 :total_entries
      uint32 :size_of_central_directory
      uint32 :central_directory_offset
      uint16 :file_comment_length

      string :file_comment, :read_length => :file_comment_length
    end
  end
end
