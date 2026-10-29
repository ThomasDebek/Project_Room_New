class ProjectsController < ApplicationController
  before_action :set_project, only: :show

  def index
    @categories = Category.order(:id)
    @selected_category = if params[:category].present?
                           Category.find_by!(slug: params[:category])
                         end
    @projects = Project.published
                       .includes(:category, images_attachments: :blob)
                       .recent
    if @selected_category
      @projects = @projects.where(category: @selected_category)
    end
  end

  def show
  end

  private

  def set_project
    @project = Project.published
                      .includes(:category, images_attachments: :blob)
                      .find(params[:id])
  end

end
