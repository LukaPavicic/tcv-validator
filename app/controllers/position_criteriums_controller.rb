class PositionCriteriumsController < ApplicationController
  def new
    @position = Position.find(params[:position_id])
  end

  def create
    @position = Position.find(params[:position_id])
    @position_criterium = @position.position_criteriums.new(criterium_params)

    if @position_criterium.valid? && @position_criterium.save
      redirect_to new_position_position_criterium_path(@position)
    else
      redirect_to new_position_position_criterium_path(@position), alert: 'Nešto je pošlo po krivu. Probajte ponovno.'
    end
  end

  def destroy
    @position = Position.find(params[:position_id])
    @position_criterium = @position.position_criteriums.find(params[:id])

    if @position_criterium.destroy
      redirect_to new_position_position_criterium_path(@position)
    else
      redirect_to new_position_position_criterium_path(@position), alert: 'Nešto je pošlo po krivu. Probajte ponovno.'
    end
  end

  private

  def criterium_params
    params.permit(:criteria_value, :required)
  end
end