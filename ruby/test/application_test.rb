require 'minitest/autorun'

class ApplicationTest < Minitest::Test
  def setup
    @dirname = File.join('test', 'tmp')
    Dir.mkdir(dirname) unless Dir.exist?(dirname)
  end

  def teardown
    files_to_remove = Dir[File.join(dirname, '*')]
    FileUtils.rm_rf(files_to_remove) if files_to_remove.any?
    Dir.delete(dirname)
  end

  private

  attr_reader :dirname
end
