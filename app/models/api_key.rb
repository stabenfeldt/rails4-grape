class ApiKey < ActiveRecord::Base

  before_validation :generate_access_token

  validates :name, :access_token, :active, presence: true


  def self.exist?(token)
    ApiKey.where(:access_token => token, active:true).count > 0
  end


  private

  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end unless ApiKey.exist?(self.access_token)
  end
end

