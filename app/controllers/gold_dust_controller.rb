class GoldDustController < ApplicationController

  before_filter :authorize_access, :except => [:logout]

  def index

  end

  def tickets

  end

  def people

  end

  def authorize_access
    if logged_in?
      redirect_to admin_index_path if current_user.is_admin?
    else
      redirect_to_with_notice login_path, :authorization_required
    end
  end

  def get_ticket_data
    id = params[:id]
    redirect_to gold_dust_tickets_path unless id
    @ticket = Ticket.find_by_id id
  end

end