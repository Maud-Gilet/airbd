class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    if params[:message]
      flash[:notice] = 'Votre message a bien été envoyé'
    end
  end
end
