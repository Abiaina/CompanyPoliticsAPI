class Company < ApplicationRecord
  has_and_belongs_to_many :share_holders
  has_and_belongs_to_many :top_recipients
  belongs_to :most_lobbied_bill
  has_many :subsidiaries
end
