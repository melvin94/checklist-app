class ChecklistItemsController < ApplicationController
  before_action :set_checklist
  before_action :set_checklist_item, except: [:create]

  def create
    @checklist_item = @checklist.checklist_items.create(checklist_item_params)
    redirect_to @checklist
  end

  def edit
    @checklist_item = @checklist.checklist_items.find(params[:id])
  end

  def update
    @checklist_item = @checklist.checklist_items.find(params[:id])
    if @checklist_item.update(checklist_item_params)
      redirect_to @checklist
    else
      render "edit"
    end
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
    @checklist_item.update_attribute(:completed, !@checklist_item.completed)
    if @checklist_item.completed
      if @checklist_item.result.nil?
        @checklist_item.update_attribute(:completed, !@checklist_item.completed)
      end
    elsif !@checklist_item.completed
      @checklist_item.update_attribute(:result, nil)
    end
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
    if params[:checklist_item]
      params[:checklist_item].permit(:description, :type)
    else
      { description: @checklist_item.description, type: @checklist_item.type, result: params[:result], completed: true }
    end
  end
end
