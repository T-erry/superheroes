class HeroPower < ApplicationRecord
  belongs_to :hero
  belongs_to :power
  validates :power_id, presence: true
  validates :hero_id, presence: true
  validates :power_id, uniqueness: { scope: :hero_id, message: 'already added to the hero' }
  validates :strength, inclusion: { in: ['Strong', 'Weak', 'Average'] }
  
end
