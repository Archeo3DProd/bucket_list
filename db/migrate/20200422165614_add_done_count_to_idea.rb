class AddDoneCountToIdea < ActiveRecord::Migration[6.0]
  def change
    add_column :ideas, :done_count, :integer
  end
end
