class User < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  ROLES = %w[admin project_leader worker economy]
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  belongs_to :department
  belongs_to :profession
  mount_uploader :image, ImageUploader

  def has_role?(role)
    roles.include? role.to_s
  end

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :mobile,     presence: true, uniqueness: true
  validates :emp_id,     presence: true
  validates :department_id,  presence: true
  validates :roles,  presence: true

  # Worker
  has_and_belongs_to_many :tasks
  has_many :projects, :through => :tasks
  has_many :hours_spents
  has_many :categories, :through => :projects


  def self.get_roles
    ROLES
  end

  def name
    "#{ first_name } #{ last_name }"
  end

  def self.workers
    User.where("'worker' = ANY (roles)")
  end

  def avatar
    image.url.present? ? image.url : "http://robohash.org/#{name}"
  end
  
  def full_name
    "#{ first_name } #{ last_name }".strip
  end

  def full_name=(name)
    name = name.split(' ')
    self.last_name  = name.pop
    self.first_name = name.join(' ')
  end

  def project_departments
    Department.find(owns_project_ids) if owns_project_ids
  end

  def owns_projects
    Project.where(user_id: id).all
  end

  def owns_project_ids
    owns_projects.pluck(:department_id).compact
  end

  protected

  def send_devise_notification(notification, *args)
    if new_record? || changed?
      pending_notifications << [notification, args]
    else
      token = args.first
      reset_url =  "#{edit_user_password_url(self, 
        reset_password_token: token, 
        host: ENV['DOMAIN'] || 'allieroforms.dev' )}"
      msg = "Klikk her for nytt passord hos Orwapp: #{reset_url}"
      Sms.send_msg("47#{mobile}", msg)
    end
  end

  def after_resetting_password_path_for(resource)
    root_path
  end

  def avatar_path
    "users/#{ name.parameterize }.jpg"
  end
end
