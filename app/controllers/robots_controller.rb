class RobotsController < ApplicationController

    before_action :setup_session_robot

    def index
        @robots = session[:robot]
        @squad_total_points = 0
        @robots.each do |robot|
            @squad_total_points += robot["power"] if robot
        end

    end

    def new
        id = params[:id].to_i
        session[:robot][id] = get_new_robot
        redirect_to robots_path()
    end

    def delete
        id = params[:id].to_i
        session[:robot][id] = nil
        redirect_to robots_path()
    end

    def refresh
        8.times { |idx| session[:robot][idx] = nil}
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