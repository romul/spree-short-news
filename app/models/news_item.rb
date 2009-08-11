class NewsItem < ActiveRecord::Base
  belongs_to :news_place,:foreign_key=>"identifier"



  def self.show_news(identifier)
    NewsItem.find(:first,:conditions=>["identifier=? and published_start_at<?",identifier,Time.now],:order=>" RAND()")
  end
  
  def self.last_news(identifier, limit = false)
    if limit
      NewsItem.all(:conditions=>
      ["identifier=? AND (published_start_at<? OR published_start_at IS NULL) AND (published_end_at>? OR published_end_at IS NULL)",
      identifier, Time.now, Time.now], :order=>"created_at DESC", :limit => limit)
    else
      NewsItem.all(:conditions=>
      ["identifier=? AND (published_start_at<? OR published_start_at IS NULL) AND (published_end_at>? OR published_end_at IS NULL)",
      identifier, Time.now, Time.now], :order=>"created_at DESC")
    end
  end
  
end
