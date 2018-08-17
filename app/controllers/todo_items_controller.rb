class TodoItemsController < ApplicationController
  before_action :set_related_todo_project, except: [:update]

  before_action :set_todo_item, except: [:create]

  # GET /todo_items
  # GET /todo_items.json
  def index
    @todo_items = TodoItem.all
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItem.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # POST /todo_items
  # POST /todo_items.json
  def create

    @todo_item = @todo_related_project.todo_items.create(todo_item_params)

    uploaded_io = params[:todo_item][:todo_file]
    if !uploaded_io.nil?
      @todo_item.todo_file = uploaded_io.original_filename #put normal name
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
    end


    respond_to do |format|
      if @todo_item.save
        # format.html { redirect_to @todo_item, notice: 'Todo item was successfully created.' }
        format.html { redirect_to @todo_related_project, notice: 'New todo item was successfully added.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    @todo_related_project = TodoProject.find(@todo_item.todo_project_id)
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_related_project, notice: 'Todo item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy

    @todo_item = @todo_related_project.todo_items.find(params[:id])
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to @todo_related_project, notice: 'Todo item was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def complete
    if (!@todo_item.is_done.nil? && @todo_item.is_done == true)
      @todo_item.update_attribute(:is_done, false)
    elsif (!@todo_item.is_done.nil? && @todo_item.is_done == false)
      @todo_item.update_attribute(:is_done, true)
    else
      @todo_item.update_attribute(:is_done, true)
    end
    if @todo_item.is_done
      respond_to do |format|
        format.html { redirect_to @todo_related_project, notice: 'Todo item was marked as done' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to @todo_related_project, notice: 'Todo item was set as undone' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item

      @todo_item = @todo_related_project.todo_items.find(params[:id]) if !@todo_related_project.nil?
      if @todo_related_project.nil?
        @todo_item = TodoItem.find(params[:id])
      end
    end

    def set_related_todo_project
     @todo_related_project = TodoProject.find(params[:todo_project_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      
      params[:todo_item].permit(:title, :task_content, :implement_before, :order_type, :todo_file)
    end
end
