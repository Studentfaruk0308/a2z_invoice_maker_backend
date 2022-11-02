class InvoicesController < ApplicationController

    before_action :welcome

    def index
		@invoices = Invoice.all
        render json: @invoices
	end

    def new
        @invoice = Invoice.new
    end
  
    def create
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
        redirect_to invoice_path(@invoice)
       else
        render :new
       end
    end
  
    def show
        @invoice = Invoice.find(params[:id])
    end
  
     
    def edit
        @invoice = Invoice.find(params[:id])
    end
  
    def update
        @invoice = Invoice.find(params[:id])
        if @invoice.update(invoice_params)
        redirect_to invoice_path(@invoice)
        else
            render :edit
        end
    end

    def destroy
        Invoice.find(params[:id]).destroy
        redirect_to action: "index"
    end
  
    private
  
    def invoice_params
        params.require(:invoice).permit(:id, :inv_number, :client_id, :date_of_issue, :due_date, :job_reference, :description, :quantity, :unit_price, :tax, :amount, :total_amount)
    end

    def client_params
        params.require(:client).permit(:client_id)
    end
   
end
