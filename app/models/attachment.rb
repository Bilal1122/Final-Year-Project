class Attachment < ActiveRecord::Base

  belongs_to :attachable, :polymorphic => true, touch: true

  validates_presence_of :attachment

  delegate :url, :size, :path, to: :attachment

  def extension_white_list
    %w[jpg jpeg gif png pdf txt]
  end
end
