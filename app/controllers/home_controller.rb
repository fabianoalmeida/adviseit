class HomeController < ApplicationController
  # GET /home
  # GET /home.xml
  def index
    @quizzes = Quiz.actives
  end

end
