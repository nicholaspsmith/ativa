class Post < ActiveRecord::Base
  belongs_to :phase
  belongs_to :project
  belongs_to :user
  default_scope order('created_at DESC')
  before_save :set_defaults

  mount_uploader :attachment, ImageUploader

  def snippet(options = {})
    if options[:length]
      message.truncate options[:length]
    else
      message.truncate 300
    end
  end

  private

    def set_defaults
      if self.title == "" then self.title = "Post #{rand(255)}" end
      if self.message == "" then self.message = "(no message)" end
    end
  
end