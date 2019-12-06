class WelcomeController < ApplicationController
  def index
    @offers = Offer.visible_for(current_user, Offer)
    @requests = Request.visible_for(current_user, Request)
  end
end
