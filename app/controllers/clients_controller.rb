class ClientsController < ApplicationController

  before_action :logged_in_user

  def index
    @clients = Client.all
  end

end
