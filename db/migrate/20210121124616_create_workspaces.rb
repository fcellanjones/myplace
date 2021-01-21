class CreateWorkspaces < ActiveRecord::Migration[6.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :capacity
      t.string :first_line_address
      t.string :city
      t.string :postcode

      t.timestamps
    end
  end
end
