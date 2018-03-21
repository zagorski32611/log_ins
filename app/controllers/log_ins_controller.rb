class LogInsController < ApplicationController
    before_action :authenticate_user!
    

    def index
        @log_in = LogIn.all
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
        @log_in = LogIn.find(params[:id])
    end

    def update
        @log_in = LogIn.find(params[:id])
        if @log_in.update(log_in_params)
            flash[:notice] = "Successfully updated log in!"
            redirect_to root_path
        else
            flash[:alert] = "Error updating log in!"
            render :edit
        end  
    end

    def show
        @log_ins = LogIn.find(params[:id])
        #@log_ins = @log_ins.current_user.find([:id])
    end

    def destroy
        @log_ins = LogIn.find(params[:id])
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
