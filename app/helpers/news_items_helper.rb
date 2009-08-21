module NewsItemsHelper  
  def print_archive_links(year, first_month, last_month)
    content_tag(:h3, year) <<
    content_tag(:ul) do
      items = ''
      first_month.upto(last_month) do |month|
        items << content_tag(:li, link_to(t("date.standalone_month_names")[month], news_archive_url(year, month)))
      end
      items
    end  
  end
end
