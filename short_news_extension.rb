class ShortNewsExtension < Spree::Extension
  version "1.0"
  description "Short News"
  url "http://yourwebsite.com/"

  def activate
     Admin::BaseController.class_eval do
      before_filter :add_short_news_tab

      def add_short_news_tab
        @extension_tabs << [ :news_news_items ]
      end
    end
    
    Spree::BaseController.class_eval do
       helper :news_items
    end

  end
end

