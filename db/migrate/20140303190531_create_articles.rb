class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name, null: false
    end
  end
end
