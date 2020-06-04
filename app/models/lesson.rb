class Lesson < ApplicationRecord
belongs_to :chapter
has_one :videos
end
