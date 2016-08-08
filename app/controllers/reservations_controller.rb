class ReservationsController < ApplicationController
	before_action :authenticate_user!

	def preload
		training = Training.find(params[:training_id])
		today = Date.today
		reservations = training.reservations.where("date >= ?", today)

		render json: reservations
	end


	def create
		@reservation = current_user.reservations.create(reservation_params)

		redirect_to @reservation.training, notice: "Je training ligt vast, succes!"
	end

	def your_trips
		@trips = current_user.reservations
	end

	def your_reservations
		@trainings = current_user.trainings
	end


	private
		def reservation_params
			params.require(:reservation).permit(:date, :price, :training_id)
		end
	end
