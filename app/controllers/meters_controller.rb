class MetersController < ApplicationController
	def index
        @meters = Meter.all
    end
    def show
        @meter = Meter.find(params[:id])
    end
    def new
        @meter = Meter.new
    end
    def edit
        @meter = Meter.find(params[:id])
    end
    def create
        @meter = Meter.new(meter_params)
        if @meter.save
            redirect_to meters_path
        else
            render 'new'
        end
    end
    def update
        @meter = Meter.find(params[:id])

        if @meter.update(meter_params)
        redirect_to meters_path
        else
        render 'edit'
        end
    end
    def destroy
      @meter = Meter.find(params[:id])
      @meter.destroy

        redirect_to meters_path
    end
    private
    def meter_params
        params.require(:meter).permit(:unity,:type_unity)
    end
end
