module Shoppe
  class PromosController < ApplicationController
    before_filter { @active_nav = :promos }

    def index
    @promos = Shoppe::Promo.all.order(:title)
    end


    def safe_params
      params[:promo].permit(:first_name, :last_name, :company, :email, :phone, :mobile)
    end

  end
end