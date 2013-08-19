class RenameLanguageToLanguageId < ActiveRecord::Migration
  def up
    rename_column :keys, :language, :language_id
    rename_column :onomas, :language, :language_id
    remove_column :links, :language
  end

  def down
    add_column :links, :language, :integer
    rename_column :keys, :language_id, :language
    rename_column :onomas, :language_id, :language
  end
end
