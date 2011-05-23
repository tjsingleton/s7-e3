module Zip
  class DOS_Time < BinData::Record
    endian :little

    bit5 :second
    bit6 :minute
    bit5 :hour
  end
end
