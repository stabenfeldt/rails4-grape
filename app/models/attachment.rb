class Attachment < ActiveRecord::Base
  validates :document, :presence => true
  validates :project,  :presence => true

  belongs_to :project
  mount_uploader :document, DocumentUploader
end
