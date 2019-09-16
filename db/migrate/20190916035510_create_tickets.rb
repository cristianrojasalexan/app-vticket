class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :priority
      t.integer :status, default: 1
      t.integer :user_id

      t.timestamps
    end
  end
end
