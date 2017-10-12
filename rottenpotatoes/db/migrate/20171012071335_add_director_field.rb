class AddDirectorField < ActiveRecord::Migration
  def add_director
    add_column :movies, :director, :string
  end
end
