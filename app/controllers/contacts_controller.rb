class ContactsController < ApplicationController
	def index
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		respond_to do |format|
		  if @contact.save
		    ContactMailer.contact_email(@contact).deliver
		    flash[:success] = 'Message was successfully sent.'
		    format.html { redirect_to new_contact_path }
		    format.json { render :new, status: :created, location: Contact.new }
		  else
		    flash[:danger] = 'There was a problem sending the Message.'
		    format.html { render :new }
		    format.json { render json: @contact.errors, status: :unprocessable_entity }
		  end
		end
	end

	private

	def contact_params
		params.require(:contact).permit(:name, :email, :message)
	end
end