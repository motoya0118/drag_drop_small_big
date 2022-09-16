class KanbanSmallsController < ApplicationController

  def move
    @small = KanbanSmall.find(params[:id])
    @small.update(small_params)
    # render template: "kanbans/show"
  end

  def destroy
    @small = KanbanSmall.find(params[:id])
    @small.destroy
  end
  def create
    kanban_small_id = KanbanSmall.last.id + 1
    @small= KanbanSmall.new(id:kanban_small_id,
                            kanban_big_id: small_params[:kanban_big_id],
                            name:small_params[:name],
                            position:small_params[:position])
    @small.save
    redirect_to kanban_path(small_params[:kanban_id])
  end
  private
  def small_params
    params.require(:small).permit(:name, :kanban_big_id, :position,:kanban_id)
  end

end
