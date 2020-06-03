class Video < ApplicationRecord
  belongs_to :user
  has_one_attached :video_file
  has_one_attached :mp4_file
  has_one_attached :thumbnail

  #manually added to copy pubnub.com
  validates_attachment_content_type :video_file, content_type: /\Avideo/
  validates_attachment_content_type :mp4_file, content_type: /.*/
  validates_attachment_presence :video_file
  def publish!
    self.published = true
    save
  end
  def all_formats_encoded?
    self.mp4_file.path
    ? true : false
  end

end
