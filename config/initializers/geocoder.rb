if Rails.env.production?
  Geocoder.configure(
      cache: Redis.new(path: '~/.redis/sock')
  )
end
