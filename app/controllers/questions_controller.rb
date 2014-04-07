class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def new
  end

  def create
    question = Question.create!(text: params[:question][:question])
    question.all_tags=(params[:question][:tags])
    redirect_to questions_path
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.text = params[:question][:text]
    question.save
    question.all_tags=(params[:question][:all_tags])
    redirect_to questions_path
  end

end
