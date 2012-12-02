class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :role_id
    end
  end
end
