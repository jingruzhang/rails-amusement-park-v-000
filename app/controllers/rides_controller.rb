class RidesController < ApplicationController
    def new
        @ride = Ride.new
    end

    def create
        @ride = Ride.new(ride_params)
        flash[:notice] = @ride.take_ride
        redirect_to @ride.user
    end

    private
    def ride_params
        params.permit(:user_id, :attraction_id)
    end
end
