class Application
  def call(env)
    [200, {'Content-Type' => 'text/html'}, ["Rackathon!"]]
  end
end
