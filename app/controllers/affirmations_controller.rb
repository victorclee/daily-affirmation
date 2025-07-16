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

  def update
    @affirmation = Affirmation.find(params[:id])

    if @affirmation.update(affirmation_params)
      redirect_to action: "index"
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @affirmation = Affirmation.find(params[:id])
    @affirmation.destroy

    redirect_to root_path, status: :see_other
  rescue ActiveRecord::RecordNotFound
    redirect_to action: "index", alert: "Affirmation not found."
  rescue StandardError => e
    redirect_to action: "index", alert: "Error deleting affirmation: #{e.message}"
  end

  private

  def affirmation_params
    params.expect(affirmation: [ :url, :translation ])
  end
end
