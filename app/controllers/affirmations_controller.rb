class AffirmationsController < ApplicationController
  def index
    @affirmations = Affirmation.all
  end

  def new
    @affirmation = Affirmation.new
  end
end
