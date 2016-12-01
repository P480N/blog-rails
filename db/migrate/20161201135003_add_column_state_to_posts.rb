class AddColumnStateToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :state, :string, default: "in_draft"
  end
end
