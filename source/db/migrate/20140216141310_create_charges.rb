class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.boolean :paid
      t.decimal :amount
      t.string :currency
      t.boolean :refunded
      t.belongs_to :customer

      t.timestamps
    end
  end
end
