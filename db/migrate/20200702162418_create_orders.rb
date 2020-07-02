class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :artifact_id
      t.decimal :total_price
      t.boolean :status

      t.timestamps
    end
  end
end
