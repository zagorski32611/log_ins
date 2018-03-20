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
        if @log_in.save(log_in_params)
          flash[:notice] = "Successfully created post!"
          redirect_to log_in_path(@log_in)
        else
          flash[:alert] = "Error creating new post!"
          render :new
        end
      end
    
    def edit
        @log_ins = LogIn.find()
    end

    def update
        if @log_in.update_attributes(log_in_params)
            flash[:notice] = "Successfully updated post!"
            redirect_to log_in_path(@log_in)
          else
            flash[:alert] = "Error updating post!"
            render :edit
        end
    end

    def show
        @log_ins = LogIn.find(params[:id])
    end


    private

    def log_in_params
        params.require(:log_in).permit(:user_id, :website, :username, :password, :security_question, :security_answer)
    end   

end
