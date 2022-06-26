class AddRateToItemComment < ActiveRecord::Migration[6.1]
  def change
    add_column :item_comments, :star, :float
  end
end
