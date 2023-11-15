class MenusController < ApplicationController
  before_action :set_menu, only: %i[ show ]

  # GET /menus
  def index
    @menus = Menu.all

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
end
