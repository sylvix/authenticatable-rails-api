class CreateApiKeys < ActiveRecord::Migration[5.0]
  def change
    create_table :api_keys do |t|
      t.references :user, foreign_key: true
      t.string :access_token
      t.string :scope
      t.datetime :expired_at
      t.datetime :created_at
    end
    add_index :api_keys, :access_token, unique: true
  end
end
