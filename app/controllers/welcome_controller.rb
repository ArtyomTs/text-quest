class WelcomeController < ApplicationController
  def index
    @surveys = Survey.all
  end
end
