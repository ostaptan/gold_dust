module TicketsExt
  module StatusChanging

    def accept_ticket
      get_ticket_data
      if @ticket.accept_ticket!
        redirect_to gold_dust_ticket_path(@ticket.id)
      else
        redirect_to_with_notice gold_dust_ticket_path(@ticket.id), t(:you_have_already_accepted_this_ticket)
      end
    end

    def resolve_ticket
      get_ticket_data
      if @ticket.resolve_ticket!
        redirect_to gold_dust_ticket_path(@ticket.id)
      else
        redirect_to_with_notice gold_dust_ticket_path(@ticket.id), t(:you_have_already_accepted_this_ticket)
      end
    end

    def close_ticket
      get_ticket_data
      if @ticket.close_ticket!
        redirect_to gold_dust_ticket_path(@ticket.id)
      else
        redirect_to_with_notice gold_dust_ticket_path(@ticket.id), t(:you_have_already_accepted_this_ticket)
      end
    end

  end
end