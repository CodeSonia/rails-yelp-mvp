# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, presence: true
  # must have a rating between 0 and 5 and must be a num. not 2.5
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
