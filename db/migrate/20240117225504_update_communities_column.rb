class UpdateCommunitiesColumn < ActiveRecord::Migration[7.0]
  def change
    change_column :communities, :zip_code, :string
  end
end
