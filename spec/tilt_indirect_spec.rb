$: << 'lib'
ENV['MT_NO_PLUGINS'] = '1' # Work around stupid autoloading of plugins
require 'minitest/global_expectations/autorun'
require 'tilt'
require 'tilt/string'
require 'tilt/indirect'

describe "tilt-indirect" do
  it "is registered for .indirect files" do
    assert_equal Tilt::IndirectTemplate, Tilt['spec/relative.indirect']
    assert_equal Tilt::IndirectRawTemplate, Tilt['spec/relative.indirectraw']
  end

  it "renders the template returned by the indirection" do
    Tilt.new('spec/relative.indirect').render.chomp.must_equal "1"
    Tilt.new('spec/absolute.indirect').render.chomp.must_equal "2"
  end

  it "renders the template returned by the indirection" do
    Tilt.new('spec/relative.indirectraw').render.chomp.must_equal "1"
    Tilt.new('spec/absolute.indirectraw').render.chomp.must_equal "\#{'2'}"
  end
end
