class CreateStates < ActiveRecord::Migration[7.1]
  def change
    create_table :states do |t|

      t.timestamps
    end
  end
end
