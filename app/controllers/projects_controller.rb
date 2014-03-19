# Controls Projects
class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.order(:priority)
  end

  # def new
  #   @project = Project.new(key: params[:key])
  # end

  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        re_prioritize(@project, Project.all.length + 1)
        format.html do
          redirect_to @project,
                      notice: 'Project was successfully created.'
        end
        format.json do
          render json: @project,
                 status: :created,
                 location: @project
        end
      else
        format.html { render action: 'new' }
        format.json do
          render json: @project.errors,
                 status: :unprocessable_entity
        end
      end
    end
  end

  def show
    @project = ProjectDecorator.find(params[:id])
    @commentable = @project
    @comments = policy_scope(@commentable.comments)
    @comment = Comment.new

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @project = Project.new
    @max_priority = Project.all.length + 1
  end

  def edit
    @project = Project.find(params[:id])
    @max_priority = Project.all.length
  end

  def update
    @project = Project.find(params[:id])
    old_priority = @project.priority
    if @project.update_attributes(params[:project])
      re_prioritize(@project, old_priority)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  def re_prioritize(project, old_priority)
    if old_priority > project.priority
      Project.order(:priority)[project.priority - 1..old_priority - 1].each do |pr|
        unless pr == project || pr.priority.nil?
          pr.priority += 1
          pr.save
        end
      end
    elsif old_priority < project.priority
      Project.order(:priority)[old_priority - 1..project.priority - 1].each do |pr|
        unless pr == project || pr.priority.nil?
          pr.priority -= 1
          pr.save
        end
      end
    end
  end
end
