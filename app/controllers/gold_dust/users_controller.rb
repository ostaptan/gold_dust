class GoldDust::UsersController < GoldDustController

  def index

  end

  def edit

  end

  def show
    @user = User.find_by_id params[:id]
    render :no_user unless @user
  end

end