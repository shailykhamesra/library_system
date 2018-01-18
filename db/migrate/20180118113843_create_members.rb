class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.string :address
      t.decimal :phone
      t.column :gender ,:integer
      t.decimal :code
      t.date :validitydate
      t.boolean :is_author
      t.references :library, index: true, foreign_key: true

    end
  end
end
