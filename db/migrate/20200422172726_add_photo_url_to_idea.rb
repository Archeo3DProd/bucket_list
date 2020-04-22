class AddPhotoUrlToIdea < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :photo_url, :string
  end
end
