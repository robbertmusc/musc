class ThrillsController < ApplicationController

before_action :set_training!, only: [:new, :create, :index]
before_action :set_thrill!, only: [:show, :edit, :update, :destroy]


	def new
      if current_user.id == @training.user.id
# => voor het formulier	    
#	    @thrill = @training.thrills.new
# => aparte sytax hier gebruikt zodat je niet een extra datum in de lijst ziet
		@thrill = Thrill.new training_id: @training.id
	    @training = @thrill.training

# => voor de lijst
	    @thrills = @training.thrills
	  else
        redirect_to root_path, notice: "Geen toegang"
      end
	end

	def create
		@thrill = @training.thrills.new(thrill_params)
		
		if @thrill.save
			redirect_to new_training_thrill_path(@training), notice: "De thrill is toegevoegd"
		else
			render :new
		end

	end

	def index
		@thrills = @training.thrills
	end

	def show
	end

	def edit
	end

	def update
		if @thrill.update(thrill_params)
			redirect_to @thrill
		else
			render :edit
		end
	end

	def destroy
		@thrill = Thrill.find(params[:id])
		@training = @thrill.training
		@thrill.destroy

		redirect_to new_training_thrill_path(@training), notice: "De thrill is verwijderd"
	end

	private

	def set_training!
		@training = Training.find(params[:training_id])
	end

	def set_thrill!
		@thrill = Thrill.joins(:training).find(params[:id])
		@training = @thrill.training
	end

	def thrill_params
		params.require(:thrill).permit(:thrilldate, :thrillhr, :thrillmin, :training_id)
	end
	
end

