class WelcomeController < ApplicationController
  def index
    @offers = Offer.visible_for(current_user, Offer).order(updated_at: :desc).includes(:user)
    @requests = Request.visible_for(current_user, Request).order(updated_at: :desc).includes(:user)
  end
end
