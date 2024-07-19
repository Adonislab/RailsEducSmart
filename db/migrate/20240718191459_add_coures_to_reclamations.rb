class AddCouresToReclamations < ActiveRecord::Migration[7.2]
  def change
    add_column :reclamations, :cours, :string
  end
end
