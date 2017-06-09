module LazyHighCharts

  # generate initializing code
  def self.generate_init_code(dependent_js)
    js_dir = File.expand_path("../../js/highcharts_js", __FILE__)
    path = File.expand_path("../../../templates/highcharts/init.inline.js.erb", __FILE__)
    template = File.read(path)
    ERB.new(template).result(binding)
  end

  # Enable to show plots on IRuby notebook
  def self.init_iruby(
    dependent_js=['highcharts.js']
  )
    # , 'highcharts-3d.js', 'highstock.js'
    js = self.generate_init_code(dependent_js)
    IRuby.display(IRuby.javascript(js))
  end

end
