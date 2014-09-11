#require 'v1/entities/users'
module V1
  class Base < Grape::API
    puts "in Base"
    version 'v1', using: :path, vendor: 'orwapp', cascade: false

    mount Users

  end
end
