class Reclamation < ApplicationRecord

  validates :object, presence: true
  validates :description, presence: true
  validates :nom, presence: true
  validates :cours, presence: true
end
