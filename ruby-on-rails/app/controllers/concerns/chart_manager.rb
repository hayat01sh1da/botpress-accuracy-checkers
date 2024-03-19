module ChartManager
  PATH = Rails.root.join('tmp', 'downloads')

  def save_chart(filename, csv_chart)
    Dir.mkdir(PATH) unless Dir.exist?(PATH)
    File.open(PATH.join(filename), 'w') { |f| f.puts(csv_chart) }
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
    FileUtils.rm_f(tmp_charts) if tmp_charts.any?
  end
end
