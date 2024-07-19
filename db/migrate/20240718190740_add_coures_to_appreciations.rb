class AddCouresToAppreciations < ActiveRecord::Migration[7.2]
  def change
    add_column :appreciations, :cours, :string
  end
end
