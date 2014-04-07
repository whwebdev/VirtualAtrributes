class WelcomeController < ApplicationController
  def index
    redirect_to new_question_path
  end
end
