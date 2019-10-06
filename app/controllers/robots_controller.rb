class RobotsController < ApplicationController

    before_action :setup_session_robot

    def index
        @robots = session[:robot]
    end

    def create

    end

    def new

    end

    def refresh
        session.delete(:robot)
        setup_session_robot
        redirect_to robots_path()
    end

    def show
        id = params[:id].to_i
        @robot = session[:robot][id]
    end

    def setup_session_robot
        puts "Sono qui dentro..."
        unless session.has_key?(:robot)
            puts "E poi sono anche qui..."
            session[:robot] = []
            8.times do
                session[:robot].push get_new_robot
            end
            session[:robot]
        end
    end

    def get_new_robot
        img_id = ""
        10.times { img_id << rand(0..9).to_s }
        
        # "https://robohash.org/#{Faker::Invoice.reference}?size=200x200&set=set1"

        return {
            "name" => Faker::Name.first_name,
            "rank" => Faker::Military.army_rank,
            "planet" => Faker::Space.planet,
            "power" => rand(1..100),
            "img_id" => img_id
        }

    end

end