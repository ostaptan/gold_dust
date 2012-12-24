class GoldDust::TicketsController < GoldDustController

  include TicketsExt::StatusChanging

  def index
    @low_tickets = Ticket.where :priority => 'low'
    @medium_tickets = Ticket.where :priority => 'medium'
    @high_tickets = Ticket.where :priority => 'high'
    @highest_tickets = Ticket.where :priority => 'highest'
  end

  def show
    get_ticket_data
  end

  def new
    @ticket = Ticket.new
  end

  def edit

  end

  def create_ticket
    @ticket = Ticket.new
    attr = params[:ticket]
    reporter = current_user ? current_user.name : attr[:reporter]
        if @ticket.create_new(attr, reporter)
      redirect_to gold_dust_ticket_path(@ticket.id)
    else
      redirect_to_with_notice gold_dust_tickets_path, t(:something_wrong)
    end
  end

end