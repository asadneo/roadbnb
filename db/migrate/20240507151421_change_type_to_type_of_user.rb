class ChangeTypeToTypeOfUser < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :type, :type_of_user
  end
end
