class GoldDustController < ApplicationController

  before_filter :authorize_access, :except => [:logout]

  def index
    redirect_to(gold_dust_user_path(current_user.id))
  end

  def authorize_access
    if logged_in?
      redirect_to admin_index_path if current_user.is_admin?
    else
      redirect_to_with_notice login_path, :authorization_required
    end
  end

end