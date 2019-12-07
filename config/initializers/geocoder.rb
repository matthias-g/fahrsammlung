if Rails.env.production?
  Geocoder.configure(
      cache: Redis.new(path: '/home/fsml/.redis/sock')
  )
end
