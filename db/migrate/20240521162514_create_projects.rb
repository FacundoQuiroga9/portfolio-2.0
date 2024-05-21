class CreateProjects < ActiveRecord::Migration[7.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :content
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
