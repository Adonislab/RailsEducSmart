class Appreciation < ApplicationRecord

  validates :notes, presence: true
  validates :appreciation, presence: true
  validates :nom, presence: true
  validates :cours, presence: true
end
