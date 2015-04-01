module SpreeRefineryAuthentication
  class Engine < Rails::Engine
    engine_name "spree_refinery_authentication"

    config.to_prepare do
      WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :per, :per_page
      WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :num_pages, :total_pages
      WillPaginate::ActiveRecord::RelationMethods.send :alias_method, :prev_page, :previous_page
    end
  end
end
