# frozen_string_literal: true

class Rack::Attack
  throttle('req/ip', limit: 300, period: 5.minutes, &:ip)

  throttle('logins/email', limit: 5, period: 20.seconds) do |req|
    req.params['email'].presence if req.path.eql?('/authenticate') && req.post?
  end

  throttle('logins/ip', limit: 5, period: 20.seconds) do |req|
    req.ip if req.path.eql?('/authenticate') && req.post?
  end
end
