# frozen_string_literal: true

class Article < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  has_many :comments
end
