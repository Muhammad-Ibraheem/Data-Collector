class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :name
      t.integer :number_of_ads
      t.integer :total_search_results
      t.float :time_taken
      t.datetime :process_time
      t.string :html_code
      t.timestamps
    end
  end
end
