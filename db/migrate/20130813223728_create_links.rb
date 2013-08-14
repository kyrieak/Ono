class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.integer :key_id
      t.integer :onoma_id
      t.integer :language

      t.timestamps
    end
  end
end
