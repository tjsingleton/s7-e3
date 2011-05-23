module Zip
  class DOS_Date < BinData::Record
    endian :little

    bit5 :day
    bit4 :month
    bit7 :years_since_1980
  end
end
