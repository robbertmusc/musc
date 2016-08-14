class PhotosController < ApplicationController
	
	def destroy
		@photo = Photo.find(params[:id])
		training = @photo.training

		@photo.destroy
		@photos = Photo.where(training_id: training.id)

		respond_to :js
	end
		
end