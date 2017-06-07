class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def take_ride
        if user.tickets < attraction.tickets || user.height < attraction.min_height
            messages = 'Sorry.'
            if user.tickets < attraction.tickets
                messages << " You do not have enough tickets to ride the #{attraction.name}."
            end
            if user.height < attraction.min_height
                messages << " You are not tall enough to ride the #{attraction.name}."
            end
            return messages
        else
            user.tickets -= attraction.tickets
            user.nausea += attraction.nausea_rating
            user.happiness += attraction.happiness_rating
            user.update(tickets: user.tickets, nausea: user.nausea, happiness: user.happiness)
            return "Thanks for riding the #{attraction.name}!"
        end
    end
end
