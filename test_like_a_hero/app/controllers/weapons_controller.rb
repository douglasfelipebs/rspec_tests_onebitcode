class WeaponsController < ApplicationController
  before_action :set_weapon, only: [:show, :update, :destroy]

  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to weapons_path
  end

  def destroy
    @weapon.destroy
  end

  def show
    @weapon
  end

  private 
    
    def set_weapon
      @weapon = Weapon.find(params[:id])
    end

    def weapon_params
      params.require(:weapon).permit(:name, :level, :power_base, :power_step)
    end
end
