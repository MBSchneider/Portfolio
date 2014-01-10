class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.order(:priority)#.all
    # @uploader = Project.new.image
  end

  def new
    @project = Project.new(key: params[:key])
  end

  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        Project.order(:priority)[@project.priority-1..-1].each do |pr|
          unless pr == @project || pr.priority == nil
            pr.priority += 1
            pr.save
          end

          puts pr.title
          puts pr.priority
        end

        # where(priority: @project.priority).each do |p|

        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
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
    if @project.update_attributes(params[:project])
      Project.order(:priority)[@project.priority-1..-1].each do |pr|
        unless pr == @project || pr.priority == nil
          pr.priority += 1
          pr.save
        end
      end
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    puts "Dest"
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end




end

