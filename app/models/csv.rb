class Csv < ApplicationRecord
belongs_to :user
has_many :csv_keywords
has_many :keywords, through: :csv_keywords
end
