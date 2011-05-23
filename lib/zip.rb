require "zlib"
require "bindata"

require_relative "zip/bit_flag"
require_relative "zip/central_directory"
require_relative "zip/dos_date"
require_relative "zip/dos_time"
require_relative "zip/local_file"
require_relative "zip/scanner"

module Zip
  SIGNATURES = {
      :header_signature         => [0x50, 0x4b, 0x05, 0x05],
      :local_file_header        => [0x50, 0x4b, 0x03, 0x04],
      :data_descriptor          => [0x50, 0x4b, 0x07, 0x08],
      :archive_extra_data       => [0x50, 0x4b, 0x06, 0x08],
      :central_file_header      => [0x50, 0x4b, 0x01, 0x02],
      :end_of_central_directory => [0x50, 0x4b, 0x05, 0x06]
  }

  COMPRESSION_METHODS = {
    0 => 'none',
    1 => 'shrunk',
    2 => 'reduced - 1',
    3 => 'reduced - 2',
    4 => 'reduced - 3',
    5 => 'reduced - 4',
    6 => 'imploded',
    7 => 'tokenized',
    8 => 'deflate',
    9 => 'deflate64',
   10 => 'PKWARE Data Compression Library Imploding (old IBM TERSE)',
   11 => 'Reserved by PKWARE',
   12 => 'bzip2',
   13 => 'Reserved by PKWARE',
   14 => 'LZMA (EFS)',
   15 => 'Reserved by PKWARE',
   16 => 'Reserved by PKWARE',
   17 => 'Reserved by PKWARE',
   18 => 'IBM TERSE (new)',
   19 => 'IBM LZ77 z Architecture (PFS)',
   97 => 'WavPack compressed data',
   98 => 'PPMd version I, Rev 1'
  }
end
