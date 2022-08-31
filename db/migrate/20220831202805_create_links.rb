class CreateLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :links do |t|
      t.string :og_url
      t.string :slug
      t.integer :clicks

      t.timestamps
    end
  end
end
