class KanbanBigsController < ApplicationController

  def move
    @kanban = KanbanBig.find(params[:id])
    @kanban.insert_at(kanban_params[:position].to_i)
    render template: "kanbans/show"
  end
  def destroy
    @kanban = KanbanBig.find(params[:id])
    @kanban.destroy
  end

  private
  def kanban_params
    params.require(:kanban).permit(:name, :description, :position)
  end

end
