class KanbanSmallsController < ApplicationController

  def move
    @small = KanbanSmall.find(params[:id])
    @small.update(small_params)
  end

  private
  def small_params
    params.require(:small).permit(:name, :kanban_big_id, :position)
  end

end
