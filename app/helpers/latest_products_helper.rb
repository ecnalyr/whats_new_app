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

  def new_item?(created_at, last_visit)
    out = ''
    if created_at >= last_visit
      out <<"'product_summary row-fluid new'"
    else
      out <<"'product_summary row-fluid'"
    end
    out.html_safe
  end
end
