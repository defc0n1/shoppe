module Shoppe
  class LomosController < ApplicationController
    before_filter { @active_nav = :lomos }


  end
end