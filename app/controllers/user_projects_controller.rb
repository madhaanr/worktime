class UserProjectsController < ApplicationController
  before_action :set_user_project, only: [:show, :edit, :update, :destroy]
  before_action :set_projects_and_users, only:[:new,:edit]
  before_action :ensure_that_signed_in, except:[:index,:show]
  before_action :verify_is_admin, only:[:new,:destroy,:edit]
  # GET /user_projects
  # GET /user_projects.json
  def index
    @user_projects = UserProject.all
  end

  # GET /user_projects/1
  # GET /user_projects/1.json
  def show
  end

  # GET /user_projects/new
  def new
    @user_project = UserProject.new
  end

  # GET /user_projects/1/edit
  def edit
  end

  # POST /user_projects
  # POST /user_projects.json
  def create
    @user_project = UserProject.new(user_project_params)

    respond_to do |format|
      if @user_project.save
        format.html { redirect_to @user_project, notice: 'User project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_project }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_projects/1
  # PATCH/PUT /user_projects/1.json
  def update
    respond_to do |format|
      if @user_project.update(user_project_params)
        format.html { redirect_to @user_project, notice: 'User project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_projects/1
  # DELETE /user_projects/1.json
  def destroy
    @user_project.destroy
    respond_to do |format|
      format.html { redirect_to user_projects_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_project
      @user_project = UserProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_project_params
      params.require(:user_project).permit(:user_id, :project_id)
    end

    def set_projects_and_users
      # @tasks=Task.select{ |t| t.project.users.include?(current_user)}
      @users = User.all
      @projects = Project.all
    end
end
