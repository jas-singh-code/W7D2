class Bands <ApplicationController

    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(band_params)
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create
        @band = Band.new
        if @band.save
            render :
        else
        end
    end

    def edit
    end

    def update
    end

    def band_params
        params.require(:band).permit(:name)
    end
end