## Description

Pure Ruby library for extracting files out of zip archives. Currently it only works with Zip's using the deflate algorithm.

## Documentation

Pass an IO object to the [Zip::Scanner](https://github.com/tjsingleton/s7-e3/blob/master/lib/zip/scanner.rb) and us [#local_files](https://github.com/tjsingleton/s7-e3/blob/master/lib/zip/scanner.rb#L40) to return an array of [Zip::LocalFile](https://github.com/tjsingleton/s7-e3/blob/master/lib/zip/local_file.rb). You can use the [#inflate](https://github.com/tjsingleton/s7-e3/blob/master/lib/zip/local_file.rb#L11) method to decompress the file.

## Examples

### Getting the compressed files

    file    = File.open("sample/Archive.zip", "rb")
    scanner = Zip::Scanner.new(file)
    files   = scanner.local_files

### Inflating the files

    # following above example
    unzipped = parts.map do |file|
      file.inflate # returns a StringIO instance
    end

## Questions and/or Comments

Feel free to email [TJ Singleton](tjsingleton@vantagestreet.com) with any questions.
