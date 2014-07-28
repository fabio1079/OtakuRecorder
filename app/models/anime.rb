class Anime < ActiveRecord::Base
  extend FriendlyId

  belongs_to :author
  has_and_belongs_to_many :tags

  friendly_id :title, use: :slugged

  validates :title,
    :presence=>true,
    :uniqueness=>true,
    :length=>{ :minimum=>2, :maximum=>80 }

  validates :season_title,
    :length=>{ :maximum=>80 }

  validates :season, :episode,
    :presence=>true,
    :length=>{ :minimum=>1, :maximum=>10 }
end
