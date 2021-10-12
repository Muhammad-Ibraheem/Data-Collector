class Keyword < ApplicationRecord
  has_many :csv_keywords
  has_many :csvs, through: :csv_keywords
end
