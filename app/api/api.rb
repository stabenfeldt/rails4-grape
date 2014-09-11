#require 'grape-swagger'
#require 'base.rb'

class API < Grape::API
  prefix 'api'

  format :json
  default_format :json

  mount V1::Base
  #add_swagger_documentation api_version: 'v1', mount_path: 'docs'
end
