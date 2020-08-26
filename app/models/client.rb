class Client < ApplicationRecord
  validates :name, presence: true

  has_many :projects, autosave: true
end
