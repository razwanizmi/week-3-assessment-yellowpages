require_relative '../../config/application'

class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.timestamps
    end
  end
end