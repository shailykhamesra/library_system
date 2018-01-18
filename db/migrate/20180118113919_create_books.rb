class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :code
      t.string :author
      t.decimal :price
      t.string :publication
      t.string :version
      t.decimal :copy
      t.references :library, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.references :issue_history, index: true, foreign_key: true

    end
  end
end
