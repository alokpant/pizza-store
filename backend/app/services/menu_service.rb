# Menu service to retrieve data
class MenuService
  def initialize; end

  def execute(params)
    menus = Menu.all
    menus = filter_by_name(menus, params[:name])
    menus = sort_by(menus, params[:sort_by], params[:order_by])
  end

  private

  def filter_by_name(menus, name)
    return menus if name.nil?

    menus.search_by_name(name)
  end

  def sort_by(menus, field, order)
    menus.ordered_by(field, order)
  end
end
