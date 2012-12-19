module VisitorExtensions
  module Register

    def self.included(c)
      c.before_filter :register_user, :only => [:register, :process_register]
    end

    def register
      @user = User.new
    end

    def process_register
      attr = params[:user]
      redirect_t :register if attr[:password_digest] != attr[:confirm_password]
      if @user.register(attr)
        redirect_to :controller => :gold_dust, :action => :index
      else
        render :register
      end

    end

    protected

    def register_user
      @user = User.new
    end
  end
end