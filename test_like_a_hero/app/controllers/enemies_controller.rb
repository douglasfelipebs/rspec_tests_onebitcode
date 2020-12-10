class EnemiesController < ApplicationController
  before_action :set_enemy, only: [:show, :update, :destroy]

  def index
    @enemies = Enemy.all
  end

  def create
    @enemy = Enemy.create(enemy_params)
    redirect_to enemies_path
  end

  def show
    @enemy
  end

  def update
    if @enemy.update(enemy_params)
      render json: @enemy, status: :ok
    else
      render json: { errors: @enemy.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    @enemy.destroy
    head 204
  end

  private 
    def enemy_params
      params.permit(:name, :level, :power_base, :power_step, :kind)
    end

    def set_enemy
      @enemy = Enemy.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e 
      render json: { message: e.message }, status: :not_found
    end
end
