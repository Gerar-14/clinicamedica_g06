class HomeController < ApplicationController
    before_action :authenticate_user!
    # before_filter :authenticate_user!
    def index
    end
end
