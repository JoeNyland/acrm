class Company < ApplicationRecord

  validates :name, presence: true, length: { maximum: 255, minimum: 3 }, uniqueness: {case_sensitive: false}
  validates :website, presence: true

end
