module LatestProductsHelper

  def new_item_badge(created_at, last_visit)
    out = ''
    if created_at >= last_visit
      out << '<span class="label label-warning pull-right">new item</span>'
    else
      out.html_safe
    end
    out.html_safe
  end

end
