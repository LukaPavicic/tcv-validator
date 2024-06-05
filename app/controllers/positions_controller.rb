class PositionsController < ApplicationController
  def create
    position = Position.new(position_params)
    position.user = current_user

    if position.valid? && position.save
      redirect_to root_path
    else
      redirect_to root_path, alert: 'Nešto je pošlo po krivu. Pokušajte ponovno.'
    end
  end

  private

  def position_params
    params.require(:position).permit(:name)
  end
end