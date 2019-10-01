class GameSessionsController < ApplicationController
  before_action :init_game, only: [:show, :update, :destroy]
  before_action :find_survey

  def create
    @game = get_game
    redirect_to survey_play_url(@survey)
  end

  def show
    @frame = @game.frame
    @options = @frame.options
  end

  def update
    @game.update choice_params

    redirect_to survey_play_url(@survey)
  end

  def destroy
    @game.destroy
    redirect_to root_url
  end

  private

  def game_params
    params.permit(:survey_id)
  end

  def choice_params
    params.permit([:chosen_option_id, :choice])
  end

  def init_game
    @game = find_game
  end

  def get_game
    GameSession.find_or_create_by! game_params
  end

  def find_game
    GameSession.find_by! survey_id: game_params[:survey_id]
  end

  def find_survey
    @survey = Survey.find game_params[:survey_id]
  end
end
