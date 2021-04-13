class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :term
      t.string :filter
      t.json :response

      t.timestamps
    end
  end
end
