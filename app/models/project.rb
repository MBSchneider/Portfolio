class Project < ActiveRecord::Base
  has_many :comments, as: :commentable
  validates_presence_of :title

  attr_accessible :title, :technologies_used, :image, :remote_image_url

  after_save :enqueue_image

  # validates_presence_of :title, :technologies_used
  # validates_length_of :title, :minimum => 4

  mount_uploader :image, ImageUploader

  def image_name
    File.basename(image.path || image.filename) if image
  end

  def enqueue_image
    ImageWorker.perform_async(id, key) if key.present?
  end

  class ImageWorker
    include Sidekiq::Worker

    def perform(id, key)
      project = Project.find(id)
      project.key = key
      project.remote_image_url = project.image.direct_fog_url(with_path: true)
      project.save!
      project.update_column(:image_processed, true)
    end
  end
end
