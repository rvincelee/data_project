class AddConferenceRefToDivisions < ActiveRecord::Migration[7.0]
  def change
    add_reference :divisions, :conference, null: false, foreign_key: true
  end
end
