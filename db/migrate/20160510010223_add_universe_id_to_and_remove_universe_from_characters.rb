class AddUniverseIdToAndRemoveUniverseFromCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :universe_id, :integer
    remove_column :characters, :universe
  end
end
