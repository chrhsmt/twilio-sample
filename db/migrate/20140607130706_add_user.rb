class AddUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :ip
      t.string :tel
      t.timestamps
    end
  end
end
