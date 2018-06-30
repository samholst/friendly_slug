class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :title
      t.string :slug
      t.string :color
      t.bigint :views

      t.timestamps
    end
  end
end
