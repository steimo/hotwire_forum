class MainController < ApplicationController
  def index
  flash.now[:notice] = "hello"
  end
end
