class PagesController < ApplicationController
  def home
  	@trainings = Training.limit(3)
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

    if (params[:startdate] && params[:enddate] && !params[:startdate].empty? & !params[:enddate].empty?)

      startdate = Date.parse(params[:startdate])
      enddate = Date.parse(params[:enddate])

  		@trainings.each do |training|

#     num_thrills = training.thrills.where("(? = thrilldate)" , date).length
#  		num_thrills = training.thrills.where("(? = thrilldate) AND (? != thrills.reservations.length)", date, training.tr_max_attendants).length
#     num_full_thrills = training.thrills.where("? = thrill.reservations.length", training.tr_max_attendants).length
      num_thrills = training.thrills.where("(? <= thrilldate AND ? >= thrilldate)", startdate, enddate).length

#      training.thrills.joins(:reservations).includes(:reservations).group("thrills.id").select("thrills.*, thrilldate, count(reservations.id) as rescount")
#      training.thrills.joins(:reservations).select("thrills.*, thrilldate, COUNT(*) AS rescount").group("thrills.id")


  			if (num_thrills == 0) 
  				@arrTrainings.delete(training)

  			end
  		end
  	end
  end
end

# Welke zaken moeten gelden voor de datum:
# min 1 thrill binnen de gestelde datums
# thrill.reservations.length == thrill.training.tr_max_attendants

# knikker een training eruit indien training.thrills(where thrilldate = date).length = 0
# ook indien training.thrills.where (thrilldate = date ) = training.tr_max_attendan
