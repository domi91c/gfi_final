class OffersController < ApplicationController
	before_action :set_offer, only: [:show, :edit, :update, :destroy]


	# GET /offers
	# GET /offers.json
	def index
		@offers = Offer.all
		@locations = Location.all.order(:id)

		if params[:search]
			@offers = Offer.search(params[:search], params[:category], params[:city]).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
		elsif params[:city]
			@offers = Offer.all.where(params[:city]).paginate(:page => params[:page], :per_page => 5)
		elsif params[:category]
			@offers = Offer.all.where(params[:category]).where(params[:city]).paginate(:page => params[:page], :per_page => 5)
		else
			@offers = Offer.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 5)
		end
	end

	# GET /offers/1
	# GET /offers/1.json
	def show
		@offers = @offer
		@json = @offers.to_gmaps4rails
		respond_to do |format|
			format.html # index.html.erb
			format.json { render json: @json }
		end
	end

	# GET /offers/new
	def new
		@offer = Offer.new
		@locations = Location.all.order(:id)


	end

	# GET /offers/1/edit
	def edit
	end

	# POST /offers
	# POST /offers.json
	def create
		@offer = Offer.new(offer_params)

		respond_to do |format|
			if @offer.save
				format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
				format.json { render :show, status: :created, location: @offer }
			else
				format.html { render :new }
				format.json { render json: @offer.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /offers/1
	# PATCH/PUT /offers/1.json
	def update
		@locations = Location.all.order(:id)

		respond_to do |format|

			if @offer.update(offer_params)
				format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
				format.json { render :show, status: :ok, location: @offer }
			else
				format.html { render :edit }
				format.json { render json: @offer.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /offers/1
	# DELETE /offers/1.json
	def destroy

		@offer.destroy
		respond_to do |format|
			format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_offer
		@offer = Offer.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def offer_params
		params.require(:offer).permit(:title, :description, :username, :address, :latitude, :longitude, :category, :city, :state, :give).merge(user_id: current_user.id)

	end
end


