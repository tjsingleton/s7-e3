require 'pathname'
$sample_path = Pathname.new(__FILE__).dirname.join('..', 'sample').expand_path

require_relative "../lib/zip"
