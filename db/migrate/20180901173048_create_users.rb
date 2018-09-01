class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.column :email, :string, null: false
      t.column :crypted_password, :string, null: false
      t.column :admin, :boolean, default: false, null: false

      t.timestamps
    end
  end
end
