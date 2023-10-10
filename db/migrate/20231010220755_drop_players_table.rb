class DropPlayersTable < ActiveRecord::Migration[6.0]
  def up
  end

  def down
    drop_table :players
  end
end
