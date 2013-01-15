module Rack
  class IsTheSiteStillUp

    attr_reader :app, :path

    def initialize(app, path = '/online', &block)
      @app  = app
      @path = path
      @msg  = block_given? ? block : lambda {"Site is Still Up"}
    end

    def msg
      @msg.call
    end


    def call(env)
      req = Rack::Request.new(env)
      if req.path == path
        [200, {"Content-Type" => "text/html"}, [msg]]
      else
        app.call(env)
      end
    end
  end
end
