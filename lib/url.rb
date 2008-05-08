module Mack
  module Rendering
    # Used when someone calls render(:url => "http://www.mackframework.com")
    class Url < Base
      
      def render
        options = {:method => :get, :raise_exception => false}.merge(self.options)
        url = options[:url]
        remote = url.match(/^[a-zA-Z]+:\/\//)
        case options[:method]
        when :get
          if remote
            do_render_remote_url(url_with_query(url, options[:parameters]), options) do |uri, options|
              Net::HTTP.get_response(uri)
            end
          else
            MACK_DEFAULT_LOGGER.debug("found a local url: #{url}")
            do_render_local_url(url_with_query(url, options[:parameters]), options) do |url, options|
              MACK_DEFAULT_LOGGER.debug("call the mock request object")
              Rack::MockRequest.new(self.view_binder.app_for_rendering).get(url, options)
            end
          end
        when :post
          if remote
            do_render_remote_url(url, options) do |uri, options|
              Net::HTTP.post_form(uri, options[:parameters] || {})
            end
          else
            do_render_local_url(url, options) do |url, options|
              Rack::MockRequest.new(self.view_binder.app_for_rendering).post(url, options)
            end
          end
        else
          raise Mack::Errors::UnsupportRenderUrlMethodType.new(options[:method])
        end
      end
      
      private
      def do_render_remote_url(url, options)
        Timeout::timeout(app_config.mack.render_url_timeout || 5) do
          uri = URI.parse(url)
          response = yield uri, options
          if response.code == "200"
            return response.body
          else
            if options[:raise_exception]
              raise Mack::Errors::UnsuccessfulRenderUrl.new(uri, response)
            else
              return ""
            end
          end
        end
      end
      
      def do_render_local_url(url, options)
        Timeout::timeout(app_config.mack.render_url_timeout || 5) do
          cooks = {}
          self.view_binder.controller.cookies.all.each do |c,v|
            cooks[c] = v[:value]
          end
          request = self.view_binder.controller.request
          options = {"HTTP_COOKIE" => cooks.join("%s=%s", "; "), "SERVER_NAME"=> request.host, "SERVER_PORT" => request.port.to_s}.merge(options)
          MACK_DEFAULT_LOGGER.debug options.inspect
          response = yield url, options
          if response.successful?
            return response.body
          else
            if options[:raise_exception]
              raise Mack::Errors::UnsuccessfulRenderUrl.new(url, response)
            else
              return ""
            end
          end
        end
      end
      
      def url_with_query(url, parameters = {})
        unless parameters.empty?
          url = url.to_s.dup
          url << "?"
          url << parameters.to_params(true)
        end
        MACK_DEFAULT_LOGGER.debug "url: #{url}"
        url
      end
      
    end # Url
  end # Rendering
end # Mack