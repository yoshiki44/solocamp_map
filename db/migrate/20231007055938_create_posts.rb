class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :city
      t.string :field_name
      t.date :date

      t.timestamps
    end
  end
end
