class CreateCats < ActiveRecord::Migration
  COLORS = ['grey', 'black', 'white', 'brown', 'orange']

  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false, inclusion: { in: COLORS }
      t.string :name, null: false
      t.string :sex, null: false, limit: 1, inclusion: { in: ['F', 'M'] }
      t.text :description, null: false

      t.timestamp
    end
  end
end
