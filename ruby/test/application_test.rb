require 'minitest/autorun'

class ApplicationTest < Minitest::Test
  def setup
    @dirname = File.join('test', 'tmp')
    Dir.mkdir(dirname) unless Dir.exist?(dirname)
  end

  def teardown
    files_to_remove = Dir[File.dirname(__FILE__) + '/tmp/*']
    FileUtils.rm_f(files_to_remove) if files_to_remove.any?
    Dir.delete(File.dirname(__FILE__) + '/tmp/')
  end

  private

  attr_reader :dirname
end
