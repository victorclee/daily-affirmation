class AffirmationsController < ApplicationController
  def index
    @affirmations = Affirmation.all
  end

  def new
    @affirmation = Affirmation.new
  end

  def create
    @affirmation = Affirmation.new(affirmation_params)
    if @affirmation.save
      redirect_to action: "index"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @affirmation = Affirmation.find(params[:id])
  end

  private

  def affirmation_params
    params.expect(affirmation: [ :url, :translation ])
  end
end
