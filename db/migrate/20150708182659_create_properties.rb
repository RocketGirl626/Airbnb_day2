class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :available, :boolean, :default => true
      t.column :user_id, :integer

      t.timestamps
    end
  end
end
