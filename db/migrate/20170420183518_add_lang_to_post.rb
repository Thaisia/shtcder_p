class AddLangToPost < ActiveRecord::Migration
  def change
    add_column :posts, :lang, :string
  end
end
