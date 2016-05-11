class AddUniverseToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :universe, :string
  end
end
