class IndexController < ApplicationControllerbefore_action :authenticate_user!
  def index; end
end