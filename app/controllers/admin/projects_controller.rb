class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = Project.includes(:category).order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)

    if @project.save
      redirect_to admin_projects_path,
                  notice: "Realizacja została pomyślnie dodana."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to admin_projects_path,
                  notice: "Realizacja została zaktualizowana."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project.destroy!

    redirect_to admin_projects_path,
                notice: "Realizacja została usunięta.",
                status: :see_other
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :category_id,
      :published,
      images: []
    )
  end
end