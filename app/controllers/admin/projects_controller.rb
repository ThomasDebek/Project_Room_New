class Admin::ProjectsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @projects = Project.includes(:category).order(created_at: :desc)
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end
end
