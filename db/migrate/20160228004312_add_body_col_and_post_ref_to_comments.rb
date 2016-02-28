class AddBodyColAndPostRefToComments < ActiveRecord::Migration
  def change
    add_column :comments, :body, :text
    add_reference :comments, :post, index: true, foreign_key: true
  end
end
