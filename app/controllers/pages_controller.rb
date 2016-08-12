class PagesController < ApplicationController
  def home
  	@trainings = Training.limit(1)
  end

  def search

  	if params[:search].present? && params[:search].strip != ""
  		session[:loc_search] = params[:search]
  	end

  	arrResult = Array.new

  	if session[:loc_search] && session[:loc_search] != ""
  		@trainings_tr_location = Training.where(tr_active: true).near(session[:loc_search], 5, order: 'distance')
  	else
  		@trainings_tr_location = Training.where(tr_active: true).all
  	end

  	@search = @trainings_tr_location.ransack(params[:q])
  	@trainings = @search.result

  	@arrTrainings = @trainings.to_a

  	if (params[:date] && !params[:date].empty?)

  		date = Date.parse(params[:date])

  		@trainings.each do |training|

  			not_available = training.reservations.where("(? = date)", date).limit(1)

  			if not_available.length > 0
  				@arrTrainings.delete(training)
  			end
  		end
  	end
  end
end
