# frozen_string_literal: true

class Restaurant < ApplicationRecord
  # when a restaurant is destroyed, all reviews will be destroyed as well
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true
  # category has a fixed list
  validates :category, presence: true, inclusion: { in: %w[chinese italian japanese french belgian] }
end
