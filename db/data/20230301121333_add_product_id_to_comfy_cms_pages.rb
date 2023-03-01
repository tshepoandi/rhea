class AddProductIdToComfyCmsPages < ActiveRecord::Migration[5.2]
  def up
    #layout and parent
    layout = Comfy::Cms::Layout.find_by(identifier: "product")
    parent = Comfy::Cms::Page.find_by(slug: "products")
    site = Comfy::Cms::Site.find_by(identifier: "rhea")
    Spree::Product.all.each do |product|
      newCmsEntry = Comfy::Cms::Page.new
      newCmsEntry.product = product
      newCmsEntry.slug = product.slug
      newCmsEntry.label = product.name
      newCmsEntry.layout = layout
      newCmsEntry.parent = parent
      newCmsEntry.site = site
      newCmsEntry.save!
    end
  end

  def down
    parent = Comfy::Cms::Page.find_by(slug: "products")
    parent.children.each(&:destroy!)
  end
end
