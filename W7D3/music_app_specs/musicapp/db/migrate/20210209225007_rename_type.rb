class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :albums, :type, :type_album
  end
end
