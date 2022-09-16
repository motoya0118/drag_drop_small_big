class CardsController < ApplicationController

  def move
    @card = Card.find(params[:id])
    @card.update(card_params)
    # render template: "kanbans/show"
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
  end
  def create
    card_id = Card.last.id + 1
    @card= Card.new(id:card_id,
                            kanban_small_id: card_params[:kanban_small_id],
                            content:card_params[:content],
                            position:card_params[:position])
    @card.save
    redirect_to kanban_path(card_params[:kanban_id])
  end

  private
  def card_params
    params.require(:card).permit(:content, :kanban_small_id, :position, :kanban_id)
  end

end
