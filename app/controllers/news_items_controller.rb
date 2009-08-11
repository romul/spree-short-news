class NewsItemsController < Spree::BaseController
  resource_controller
  actions :show
  helper :products
  
  def archive
    if params[:day]
      @date = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i)
      @news = NewsItem.all(:conditions => 
      ["YEAR(created_at) = ? AND MONTH(created_at) = ? AND DAY(created_at) = ?",
       params[:year], params[:month], params[:day] ])
    else 
      @date = DateTime.new(params[:year].to_i, params[:month].to_i, 1)
      @news = NewsItem.all(:conditions => 
      ["YEAR(created_at) = ? AND MONTH(created_at) = ?",
       params[:year], params[:month] ])
    end
  end
  
  def archive_all
    @first = NewsItem.first(:order => 'created_at').created_at
    @last = NewsItem.first(:order => 'created_at DESC').created_at
  end
end
