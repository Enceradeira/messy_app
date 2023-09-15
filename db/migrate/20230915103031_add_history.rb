# frozen_string_literal: true

class AddHistory < ActiveRecord::Migration[7.0]
  def change
    create_table :person_attributes do |t|
      t.string :name, null: false
      t.date :valid_from, null: false
      t.timestamps
      t.references :person, null: false, foreign_key: true
    end

    remove_column :people, :name, :string

    create_table :address_attributes do |t|
      t.string :street, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :country, null: false
      t.date :valid_from, null: false
      t.timestamps
      t.references :address, null: false, foreign_key: true
    end

    remove_column :addresses, :street, :string
    remove_column :addresses, :city, :string
    remove_column :addresses, :zip, :string
    remove_column :addresses, :country, :string
  end
end
