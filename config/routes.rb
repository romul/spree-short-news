map.namespace :admin do |admin|
  admin.namespace :news do |news|
   news.resources :news_items
   news.resources :news_places
  end
end

map.resources :news_items, :only => 'show'
map.daily_news_archive 'news/archive/:year/:month/:day', :controller => 'news_items', :action => 'archive'
map.news_archive 'news/archive/:year/:month', :controller => 'news_items', :action => 'archive'
map.full_archive 'news/archive/all', :controller => 'news_items', :action => 'archive_all' 
