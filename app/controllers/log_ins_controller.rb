class LogInsController < ApplicationController
    before_action :authenticate_user!
    before_action :fetch_log_in, only: [:show, :update, :destroy, :edit]
    before_action :verify_user, only: [:show, :update, :destroy, :edit]
    
    def fetch_log_in
        @log_in = LogIn.find(params[:id])
    end

    def verify_user
        unless @log_in.user_id == current_user.id
            flash[:error] = "I'm sorry, Dave..."
            redirect_to root_path
        end
    end

    def index
        @log_in = LogIn.where(user_id: current_user.id)
    end

    def new
        @log_in = LogIn.new
    end
    
    def create
        @log_in = LogIn.new(log_in_params)
        @log_in.user_id = current_user.id
        if @log_in.save(log_in_params)
            flash[:notice] = "Successfully created post!"
            redirect_to log_in_path(@log_in)
        else
            flash[:alert] = "Error creating new post!"
            render :new
        end
    end
    
    def edit
    end

    def update
        if @log_in.update(log_in_params)
            flash[:notice] = "Successfully updated log in!"
            redirect_to root_path
        else
            flash[:alert] = "Error updating log in!"
            render :edit
        end  
    end

    def show
    end

    def destroy
        if @log_ins.destroy
            flash[:notice] = "Successfully delete log in!"
            redirect_to root_path
        else
            flash[:alert] = "Error deleting log in!"
            render :edit
        end
    end

    private

    def log_in_params
        params.require(:log_in).permit(:website, :username, :password, :security_question, :security_answer)
    end   

end
