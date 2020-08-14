class PinsController < ApplicationController
    before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote]

    def index
        @pins = Pin.all.order("created_at DESC")
    end

    def show
    end
    
   
    def new
        @pin = current_user.pins.build
    end
    
    def create
        @pin = current_user.pins.build(pin_params)
        if @pin.save
        #   flash[:success] = "Pin successfully created"
          redirect_to @pin, notice: "Successfully created new Pin"
        else
        #   flash[:error] = "Something went wrong"
          render 'new'
        end
    end
    
    def edit
    end
    
    def update
        if @pin.update_attributes(pin_params)
        #   flash[:success] = "Pin was successfully updated"
          redirect_to @pin, notice: "pin was Successfully updated!"
        else
        #   flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    
    def destroy
        if @pin.destroy
            # flash[:success] = 'Pin was successfully deleted.'
            redirect_to root_path, notice: "pin was Successfully deleted."
        else
            # flash[:error] = 'Something went wrong'
            redirect_to pins_url
        end
    end
    
    def upvote
        @pin.upvote_by current_user
        redirect_back fallback_location: root_path
    end
    

    private
    def pin_params
        params.require(:pin).permit(:title, :description, :image)
    end
    
    def find_pin
        @pin = Pin.find(params[:id])
    end
    
end
