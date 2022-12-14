class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.belongs_to :user_type, foreign_key: true

      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :password_digest

      t.timestamps
    end
  end
end

