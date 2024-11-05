class DirectorsController < ApplicationController
  # Displays all directors
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  # Displays a specific director
  def show
    the_id = params.fetch("path_id")
    @the_director = Director.find(the_id)

    render({ :template => "director_templates/show" })
  end

  # Displays the youngest director
  def max_dob
    @youngest = Director.where.not(dob: nil).order(dob: :desc).first

    render({ :template => "director_templates/youngest" })
  end

  # Displays the eldest director
  def min_dob
    @eldest = Director.where.not(dob: nil).order(dob: :asc).first

    render({ :template => "director_templates/eldest" })
  end

  # Renders the new director form
  def new
    @director = Director.new
    render({ :template => "director_templates/new" })
  end

  # Creates a new director record
  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to("/directors")
    else
      @list_of_directors = Director.all.order({ :created_at => :desc })
      render({ :template => "director_templates/index" })
    end
  end

  # Updates an existing director record
  def update
    @director = Director.find(params[:path_id])
    if @director.update(director_params)
      redirect_to(director_path(@director))
    else
      render({ :template => "director_templates/edit" })
    end
  end

  # Deletes a specific director record
  def destroy
    @director = Director.find(params[:path_id])
    @director.destroy
    redirect_to("/directors")
  end

  private

  def director_params
    params.require(:director).permit(:name, :dob, :bio, :image)
  end
end
