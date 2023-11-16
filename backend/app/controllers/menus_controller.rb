class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show ]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ArgumentError, with: :invalid_argument

  # GET /menus
  def index
    validate_params
    @menus = MenuService.new.execute(params: prepare_params(params))

    render json: @menus
  end

  # GET /menus/1
  def show
    render json: @menu
  end

  private
  def set_menu
    @menu = Menu.find(params[:id])
  end

  def prepare_params(params)
    params = params.permit(:id, :search, :order_by, :sort_by)
    params[:search] = params[:search]&.strip
    params[:order_by] = params[:order_by].to_s == :ascending ? :asc : :desc
    params
  end

  def validate_params
    return true unless params[:order_by].present?
    return false if [:ascending, :descending].include?(params[:order_by].to_s)

    raise ArgumentError, "Invalid field for ordering: #{params[:order_by]}"

    false
  end

  def record_not_found(e)
    build_error(e.message)
  end

  def invalid_argument(e)
    build_error(e.message, :unprocessable_entity)
  end

  def build_error(message, status = :not_found)
    render json: { error: message }, status:
  end
end
