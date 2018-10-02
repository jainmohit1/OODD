class CreateUsers < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :user_name
      t.string :password
      t.string :email_address
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.integer :phone_number
      t.string :preferred_contact_method
      t.string :role_type

      t.timestamps
    end
  #   User.create  user_name:  'admin',
  #                         password_digest: 'admin',
  #                         email_address: 'admin@ncsu.edu',
  #                         first_name: 'admin',
  #                         last_name: 'ncsu',
  #                         phone_number: 9194568765,
  #                         preferred_contact_method: 'text',
  #                         role_type: 'text'
  # end
  def down
    drop_table :users
  end
end
