class RobotsController < ApplicationController

    before_action :setup_session_robot

    def index

        session[:robot][3] = nil
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
        unless session.has_key?(:robot)
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

        return {
            "name" => Faker::Name.first_name,
            "rank" => Faker::Military.army_rank,
            "planet" => Faker::Space.planet,
            "power" => rand(1..100),
            "img_id" => img_id
        }

    end

end