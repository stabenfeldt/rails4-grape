Hi,

I get a `Unable to autoload constant Base` even though a `puts` tells me that the class is loaded.
What am I doing wrong? 


**app/api/api.rb**

```ruby
class API < Grape::API
  prefix 'api'
  format :json
  default_format :json
  mount V1::Base   # Everything loads perfectly until I add this line.
end
```

**app/api/v1/base.rb**
```ruby
module V1
  class Base < API
    puts "=== DEBUG - in Base"
    version 'v1', using: :path, vendor: 'orwapp', cascade: false
 
    mount Users
 
  end
end
```


```bash
$ rspec spec/api

12:58:29 - INFO - Run all
12:58:29 - INFO - Running all specs
=== DEBUG - in Base
/dependencies.rb:481:in `load_missing_constant': 
Unable to autoload constant Base,
 expected /Users/martins/Work/myapp/app/api/v1/base.rb to define it (LoadError)
        from /Users/martins/Work/myapp/app/api/api.rb:9:in `<class:API>'
        from /Users/martins/Work/myapp/app/api/api.rb:3:in `<top (required)>'
```

**spec/api/users_spec.rb**

```ruby
describe 'GET /api/v1/users/:id', focus: true do
  let(:user) { Fabricate :user }
                                                                  
  it 'returns that specific user' do
    get "/api/v1/users/#{ user.id }", {}, https_and_authorization
    response.status.should eq 200
    parse_response_for(:user)['email'].should eq user.email
  end
end
```


```bash
 $ ack grape Gemfile.lock
  remote: git://github.com/intridea/grape.git
    grape (0.9.1)
    grape-entity (0.4.4)
    grape-swagger (0.8.0)
      grape
      grape-entity
```
