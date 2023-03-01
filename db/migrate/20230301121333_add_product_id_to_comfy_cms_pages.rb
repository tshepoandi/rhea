class AddProductIdToComfyCmsPages < ActiveRecord::Migration[6.0]
  def change
    add_column :comfy_cms_pages, :product_id, :integer
    add_index :comfy_cms_pages, :product_id
  end
end
