class CreateReview < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.column :text, :string
      t.column :user_id, :integer
      t.column :property_id, :integer

      t.timestamps
    end
  end
end
