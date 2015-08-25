class ErbMaker
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    if env["PATH_INFO"] == '/about'
      body = "<h1><a href='/'>Are you lost?</a></h1>"
      [status, headers, [body]]
    else
      @response = response
      template = File.read("lib/templates/index.html.erb")
      body = ERB.new(template).result(binding)
      [status, headers, [body]]
    end
  end
end
