class User < ActiveRecord::Base
    has_secure_password

    has_many :rides
    has_many :attractions, :through => :rides
    validates :nausea, :happiness, :tickets, numericality: { only_integer: true }, allow_nil: true


    def mood
        nausea > happiness ? "sad" : "happy"
    end
end
