class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.timestamp :deleted_at
      t.timestamp :updated_at
    end
  end
end
