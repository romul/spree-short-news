class ShortNewsExtension < Spree::Extension
  version "1.0"
  description "Short News"
  url "http://yourwebsite.com/"

  def activate
    Spree::BaseController.class_eval do
       helper :news_items
    end

  end
end

