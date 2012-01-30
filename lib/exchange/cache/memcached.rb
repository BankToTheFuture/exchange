require 'memcached'

module Exchange
  module Cache
    class Memcached < Base
      class << self
        
        def client
          @@client ||= ::Memcached.new("#{Exchange::Configuration.cache_host}:#{Exchange::Configuration.cache_port}")
        end
        
        def cached api, &block
          begin
            result = JSON.load client.get(key(api))
          rescue ::Memcached::NotFound
            result = block.call
            if result && !result.empty?
              client.set key(api), result.to_json, Exchange::Configuration.update == :daily ? 86400 : 3600
            end
          end
          
          result
        end
        
      end
    end
  end
end