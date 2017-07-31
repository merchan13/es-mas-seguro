CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
      provider:              'AWS',
      aws_access_key_id:     ENV["AWS_ACCESS_ID"],
      aws_secret_access_key: ENV["AWS_ACCESS_SECRET_KEY"],
      region: 'sa-east-1'
  }
  config.fog_directory  = "esmasseguro"
  config.fog_public     = false

  # Use local storage if in development or test
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  # Use AWS storage if in production
  if Rails.env.production?
    CarrierWave.configure do |config|
      config.storage = :fog
    end
  end
end
