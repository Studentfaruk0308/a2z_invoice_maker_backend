class ClientsController < ApplicationController

    before_action :welcome

    def index
		@clients = Client.all
	end

    def new
        @client = Client.new
    end
  
    def create
        @client = Client.new(client_params)
        if @client.save
        redirect_to client_path(@client)
       else
        render :new
       end
    end
  
    def show
        @client = Client.find(params[:id])
    end
  
     
    def edit
        @teacher = Teacher.find(params[:id])
    end
  
    def update
        @client = Client.find(params[:id])
        if @client.update(client_params)
        redirect_to client_path(@client)
        else
            render :edit
        end
    end

    def destroy
        Client.find(params[:id]).destroy
        redirect_to action: "index"
    end
  
    private
  
    def client_params
        params.require(:client).permit(:id, :company_name, :contact_person_name, :email, :alternate_email, :mobile_number, :phone_number, :postal_address)
    end

end
