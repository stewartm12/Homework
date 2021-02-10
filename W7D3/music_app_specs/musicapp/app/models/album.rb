class Album < ApplicationRecord
  validates :title, :year, :band_id, :type_album, presence: true
  validates :type_album, inclusion: { in: %w(live studio)}

  belongs_to :band,
  class_name: :Band,
  foreign_key: :band_id
end