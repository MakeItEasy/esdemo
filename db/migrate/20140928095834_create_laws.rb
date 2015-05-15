class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
