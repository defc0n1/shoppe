module Shoppe
  class PromosController < ApplicationController
    before_filter { @active_nav = :promos }


  end
end