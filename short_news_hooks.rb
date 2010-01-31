class ShortNewsHooks < Spree::ThemeSupport::HookListener
  insert_after :admin_tabs do
    %(<%=  tab(:news_news_items)  %>)
  end
end