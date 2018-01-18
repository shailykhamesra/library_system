class CreateIssueHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_histories do |t|
      t.numeric :member_id
      t.numeric :book_id
      t.date :return
      t.date :issue
      t.string :name
      t.decimal :copy
      t.references :member, index: true, foreign_key: true

    end
  end
end
