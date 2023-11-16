class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show ]

  # GET /menus
  def index
    validate_params

    @menus = MenuService.new.execute(params)

    render json: @menus
  end

  # GET /menus/1
  def show
    render json: @menu
  end

  private
  # # Use callbacks to share common setup or constraints between actions.
  def set_menu
    @menu = Menu.find(params[:id])
  end

  def prepare_params
    params.permit(:id, :search, :order_by, :sort_by)
    params[:search] = params[:search].present? ? params[:search].strip : params[:search]
    params[:order_by] = params[:order_by].to_s == :ascending ? :asc : :desc
    params
  end

  def validate_params
    return true unless params[:order_by].present?
    return false if [:ascending, :descending].include?(params[:order_by].to_s)

    format_error('Order params needs to be either ascending or descending')

    false
  end
end
