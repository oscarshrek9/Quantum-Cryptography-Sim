module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 5499
# Optimized logic batch 2490
# Optimized logic batch 3163
# Optimized logic batch 4702
# Optimized logic batch 9770
# Optimized logic batch 5871
# Optimized logic batch 6099
# Optimized logic batch 3914
# Optimized logic batch 7743
# Optimized logic batch 6637