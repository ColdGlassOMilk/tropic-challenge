class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, default: '', index: true
      t.string :last_name, default: '', index: true
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
