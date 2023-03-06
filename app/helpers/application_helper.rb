module ApplicationHelper
  def category_taxons
    Spree::Taxon.joins(:taxonomy).where(spree_taxonomies: { name: 'Categories' })
  end

  def brand_taxons
    Spree::Taxon.joins(:taxonomy).where(spree_taxonomies: { name: 'Brands' })
  end
end
