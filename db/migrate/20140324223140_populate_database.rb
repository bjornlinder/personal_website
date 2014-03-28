class PopulateDatabase < ActiveRecord::Migration
  def change
		add_column :posts, :allow_comments, :boolean, default: true
		add_column :posts, :preview_text, :text
  end
end
