class GoldDust::TicketsController < GoldDustController

  include TicketsExt::StatusChanging

  def index
    type = params[:type]
    @low_tickets = Ticket.find_by_type('low', type, current_user.id) #|| []
    @medium_tickets = Ticket.find_by_type('medium', type, current_user.id) #|| []
    @high_tickets = Ticket.find_by_type('high', type, current_user.id) #|| []
    @highest_tickets = Ticket.find_by_type('highest', type, current_user.id) #|| []
  end

  def show
    get_ticket_data
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def edit
    get_ticket_data
  end

  def create_ticket
    @ticket = Ticket.new
    attr = params[:ticket]
    reporter = current_user ? current_user.name : attr[:reporter]
    if @ticket.create_new(attr, reporter)
      #TODO uncomment when deploying on prod
      # mail sending works only in production
      #User.send_mail(@ticket)
      redirect_to gold_dust_ticket_path(@ticket.id)
    else
      redirect_to_with_notice gold_dust_tickets_path, t(:something_wrong)
    end
  end

  def create_comment
    get_ticket_data
    @comment = Comment.new
    attr = params[:comment]
    author = current_user.id
    if @comment.create_new(attr, @ticket.id, author)
      redirect_to gold_dust_ticket_path(@ticket.id)
    else
      redirect_to_with_notice gold_dust_tickets_path, t(:something_wrong)
    end
  end

end