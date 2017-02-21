class CreateIdeas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
