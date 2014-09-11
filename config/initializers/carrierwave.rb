if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',                        
      :aws_access_key_id      => ENV['STABENFELDT_AWS_ACCESS_KEY_ID'],
      :aws_secret_access_key  => ENV['STABENFELDT_SECRET_ACCESS_KEY'],
      :region                 => 'eu-west-1',
      #:host                   => 's3.example.com',
      #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
    }
    config.fog_directory  = 'alliero-orwapp'                        # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
  
end
