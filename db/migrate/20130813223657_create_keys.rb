class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.string :word
      t.integer :language

      t.timestamps
    end
  end
end
