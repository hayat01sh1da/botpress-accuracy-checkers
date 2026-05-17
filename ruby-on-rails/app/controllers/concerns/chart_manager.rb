# rbs_inline: enabled

module ChartManager
  PATH = Rails.root.join('tmp', 'downloads')

  def save_chart(filename, path_to_accuracy_score_chart)
    Dir.mkdir(PATH) unless Dir.exist?(PATH)
    File.open(PATH.join(filename), 'w') { |f| f.puts(path_to_accuracy_score_chart) }
  end

  def tmp_charts
    Dir[PATH.join('accuracy_score_chart*.csv')]
  end

  def tmp_chart
    tmp_charts.last
  end

  def matrix_chart
    CSV.open(tmp_chart) { |f| f.read } if tmp_chart
  end

  def clear_tmp_charts
    FileUtils.rm_rf(tmp_charts) if tmp_charts.any?
  end
end
