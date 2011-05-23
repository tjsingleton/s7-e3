module Zip
  class BitFlag < BinData::Record
    endian :little

    (0..15).each {|n| bit1 "bit#{n}"}
  end
end
