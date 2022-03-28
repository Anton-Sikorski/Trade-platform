# frozen_string_literal: true

module ReadCache
  extend ActiveSupport::Concern

  class << self
    def redis
      @redis ||= Redis.new(driver: :hiredis, url: (ENV["REDIS_URL"] || "redis://127.0.0.1:6379"))
    end
  end
end
