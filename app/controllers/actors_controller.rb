class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @the_actor = Actor.find(the_id)

    render({ :template => "actor_templates/show" })
  end

  def new
    @actor = Actor.new
    render({ :template => "actor_templates/new" })
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to("/actors")
    else
      render({ :template => "actor_templates/new" })
    end
  end

  def edit
    @actor = Actor.find(params[:path_id])
    render({ :template => "actor_templates/edit" })
  end

  def update
    @actor = Actor.find(params[:path_id])
    if @actor.update(actor_params)
      redirect_to(actor_path(@actor))
    else
      render({ :template => "actor_templates/edit" })
    end
  end

  def destroy
    @actor = Actor.find(params[:path_id])
    @actor.destroy
    redirect_to("/actors")
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :dob, :bio, :image)
  end
end
