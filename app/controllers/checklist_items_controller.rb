class ChecklistItemsController < ApplicationController
  before_action :set_checklist
  before_action :set_checklist_item, except: [:create]

  def create
    @checklist_item = @checklist.checklist_items.create(checklist_item_params)
    redirect_to @checklist
  end

  def destroy
    @checklist_item = @checklist.checklist_items.find(params[:id])
    if @checklist_item.destroy
      flash[:success] = "Checklist item was deleted."
    else
      flash[:error] = "Checklist item could not be deleted."
    end
    redirect_to @checklist
  end

  def complete
    @checklist_item.update_attribute(:completed_at, Time.now)
    redirect_to @checklist, notice: "Checklist item completed"
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:checklist_id])
  end

  def set_checklist_item
    @checklist_item = @checklist.checklist_items.find(params[:id])
  end

  def checklist_item_params
    params[:checklist_item].permit(:content)
  end
end
