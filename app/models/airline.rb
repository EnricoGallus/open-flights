class Airline < ApplicationRecord
  has_many :reviews

  # Slugify airline name into a url safe param before create
  # Ex: 'United Airlines'.parameterize => 'united-airlines'
  before_create -> (airline) do
    airline.slug = airline.name.parameterize
  end

  def average_score
    reviews.average(:score).to_f.round(2)
  end
end
