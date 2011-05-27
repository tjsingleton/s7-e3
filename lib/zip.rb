require "zlib"
require "bindata"

require_relative "zip/struct/bit_flag"
require_relative "zip/struct/dos_date"
require_relative "zip/struct/dos_time"
require_relative "zip/central_directory"
require_relative "zip/local_file"
require_relative "zip/scanner"

module Zip
  SIGNATURES = {
      header_signature:         [0x50, 0x4b, 0x05, 0x05],
      local_file_header:        [0x50, 0x4b, 0x03, 0x04],
      data_descriptor:          [0x50, 0x4b, 0x07, 0x08],
      archive_extra_data:       [0x50, 0x4b, 0x06, 0x08],
      central_file_header:      [0x50, 0x4b, 0x01, 0x02],
      end_of_central_directory: [0x50, 0x4b, 0x05, 0x06]
  }
end
