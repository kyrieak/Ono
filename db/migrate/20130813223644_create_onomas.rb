class CreateOnomas < ActiveRecord::Migration
  def change
    create_table :onomas do |t|
      t.string :name
      t.integer :language

      t.timestamps
    end
  end
end
