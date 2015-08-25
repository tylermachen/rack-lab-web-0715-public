class RandomNumber
  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, response = @app.call(env)
    body = response.first + " - #{rand.to_i.to_s}"
    [status, headers, [body]]
  end
end
