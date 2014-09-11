module V1::ApiHelpers
  def restrict_access!
    token = headers['Authorization'] if headers.has_key?('Authorization')
    if token && ApiKey.exist?(token)
    else
      error!('Unauthorized, fucker', 401)
    end
  end
end
