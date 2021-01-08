class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :location
      t.string :lat
      t.string :lng
      t.string :date

      t.timestamps
    end
  end
end
