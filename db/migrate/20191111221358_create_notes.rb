class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :note
      t.text :body

      t.timestamps
    end
  end
end
