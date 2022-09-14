class CardsController < ApplicationController

  def move
    @card = Card.find(params[:id])
    @card.update(card_params)
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end

  private
  def card_params
    params.require(:card).permit(:name, :kanban_small_id, :position)
  end

end
