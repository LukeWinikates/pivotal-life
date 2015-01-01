SCHEDULER.every '30s', first_in: 0 do
  data = DumbartonFetcher.new(ENV['SF511_AUTH_TOKEN']).data
  send_event('dumbarton', { data: data })
end
