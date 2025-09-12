# frozen_string_literal: true

class Admin::BadgesController < Admin::BaseController
  before_action :authenticate_user!
  before_action :admin_only

  layout 'admin'

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to admin_badges_path, notice: 'Бэйдж успешно создан.'
    else
      render :new
    end
  end

  def edit
    @badge = Badge.find(params[:id])
  end

  def update
    @badge = Badge.find(params[:id])
    if @badge.update(badge_params)
      redirect_to admin_badges_path, notice: 'Бэйдж успешно обновлён.'
    else
      render :edit
    end
  end

  def destroy
    @badge = Badge.find(params[:id])
    @badge.destroy
    redirect_to admin_badges_path, alert: 'Бэйдж удалён.'
  end

  private

  def badge_params
    params.require(:badge).permit(:name, :image, :rule_type, :value)
  end

  def admin_only
    redirect_to root_path, alert: 'Доступ только для администраторов.' unless current_user.type == 'Admin'
  end
end
