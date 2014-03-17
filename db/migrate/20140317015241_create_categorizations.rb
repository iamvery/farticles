class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.belongs_to :article,  null: false
      t.belongs_to :category, null: false
      t.foreign_key :articles,   dependent: :delete
      t.foreign_key :categories, dependent: :delete
    end
  end
end
