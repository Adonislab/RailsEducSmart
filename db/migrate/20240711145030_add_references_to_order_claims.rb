class AddReferencesToOrderClaims < ActiveRecord::Migration[7.2]
  def change
    add_reference :order_claims, :users, null: false, foreign_key: true
  end
end
