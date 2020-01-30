class Shortenedlink < ApplicationRecord
  validates :longLink, presence: true
  validates :shortLink, presence: true
end
