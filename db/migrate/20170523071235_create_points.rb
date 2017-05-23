class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :x
      t.integer :y
      t.boolean :busy
      t.boolean :start
      t.boolean :goal
      t.references :game, foreign_key: true
      t.integer :cost

      t.timestamps
    end
  end
end
