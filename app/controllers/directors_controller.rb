class DirectorsController < ApplicationController
  before_action :set_director, only: [:show, :edit, :update, :destroy]
  # Displays all directors
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  # Displays a specific director
  def show
    the_id = params.fetch("id")
    @director = Director.find_by(id: the_id)

    if @director.nil?
      redirect_to("/directors", alert: "Director not found.")
    else
      render({ :template => "director_templates/show" })
    end
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
    render(:template => "director_templates/new")
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      redirect_to directors_path, notice: 'Director was successfully created.'
    else
      render(:template => "director_templates/new")
    end
  end

  def edit
    render(:template => "director_templates/edit")
  end

  def update
    if @director.update(director_params)
      redirect_to director_path(@director)
    else
      render(:template => "director_templates/edit")
    end
  end

  def destroy
    @director = Director.find(params[:id])
    if @director.destroy
      redirect_to directors_path, notice: 'Director was successfully deleted.'
    else
      redirect_to director_path(@director), alert: 'Could not delete director.'
    end
  end

  private

  def set_director
    @director = Director.find_by(id: params[:id])
    if @director.nil?
      redirect_to directors_path, alert: 'Director not found.'
    end
  end

  def director_params
    params.require(:director).permit(:name, :dob, :bio, :image)
  end
end
