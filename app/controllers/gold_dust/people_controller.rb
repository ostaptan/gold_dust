class GoldDust::PeopleController < GoldDustController

  def index
    @people = User.all
  end

  def show

  end

end