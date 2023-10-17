class AddDivisionRefToTeams < ActiveRecord::Migration[7.0]
  def change
    add_reference :teams, :division, null: false, foreign_key: true
  end
end
