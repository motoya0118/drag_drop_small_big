class KanbanBigsController < ApplicationController

  def move
    @kanban = KanbanBig.find(params[:id])
    @kanban.insert_at(kanban_params[:position].to_i)
    # render template: "kanbans/show"
  end
  def destroy
    @kanban = KanbanBig.find(params[:id])
    @kanban.destroy
  end
  def update
    @kanban = KanbanBig.find(params[:id])
    @kanban.update(kanban_params)
  end
  def create
    kanban_id = KanbanBig.last.id + 1
    @kanban = KanbanBig.new(id:kanban_id,
                            kanban_id: kanban_params[:kanban_id],
                            name:kanban_params[:name],
                            position:kanban_params[:position])
    @kanban.save
    redirect_to kanban_path(kanban_params[:kanban_id])
  end

  private
  def kanban_params
    params.require(:kanban).permit(:name, :description, :position,:kanban_id)
  end

end
