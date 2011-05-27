require 'pathname'
$fixture_path = Pathname.new(__FILE__).dirname.join('fixtures').expand_path

require_relative "../lib/zip"
