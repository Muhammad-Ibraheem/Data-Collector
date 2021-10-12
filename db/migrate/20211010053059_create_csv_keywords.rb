class CreateCsvKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :csv_keywords do |t|
      t.bigint :keyword_id, null: false, foreign_key: true
      t.bigint :csv_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
