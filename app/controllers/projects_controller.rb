class ProjectsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.all
    @uploader = Project.new.image
    @uploader.success_action_redirect = new_project_url
  end

  def new
    binding.pry
    @project = Project.new(key: params[:key])
  end

  def create
    @project = Project.new(params[:project])
    binding.pry
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @project = Project.find(params[:id])
    @commentable = @project
    @comments = policy_scope(@commentable.comments)
    @comment = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  def new
    @project = Project.new #(key: params[:key])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    puts "Dest"
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end




end

