class CsvKeyword < ApplicationRecord
  belongs_to :keyword
  belongs_to :csv
end
