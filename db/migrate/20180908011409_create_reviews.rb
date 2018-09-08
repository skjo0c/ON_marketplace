class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
    	t.text :review
    	t.integer :item_id
    	t.integer :user_id
      t.timestamps
    end
    add_index :reviews, [:user_id, :item_id]
    add_index :reviews, :item_id
  end
end
