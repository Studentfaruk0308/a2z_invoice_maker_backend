class ProfilesController < ApplicationController

    before_action :welcome

    def index
		@profiles = Profile.all
	end

    def new
        @profile = Profile.new
    end
  
    def create
        @profile = Profile.new(profile_params)
        if @profile.save
        redirect_to profile_path(@profile)
       else
        render :new
       end
    end
  
    def show
        @profile = Profile.find(params[:id])
    end
  
     
    def edit
        @profile = Profile.find(params[:id])
    end
  
    def update
        @profile = Profile.find(params[:id])
        if @profile.update(profile_params)
        redirect_to profile_path(@profile)
        else
            render :edit
        end
    end

    def destroy
        Profile.find(params[:id]).destroy
        redirect_to action: "index"
    end
  
    private
  
    def profile_params
        params.require(:profile).permit(:id, :profile_name, :company_name, :address, :abn, :email, :contact_number, :bank_details)
    end

end