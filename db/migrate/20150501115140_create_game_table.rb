class CreateGameTable < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :click_count
      t.timestamps null: false
    end
  end
end
