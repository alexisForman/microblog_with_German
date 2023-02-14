class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :content
      t.string :image_path, default: "https://upload.wikimedia.org/wikipedia/commons/7/74/A-Cat.jpg"

      t.timestamps
    end
  end
end
