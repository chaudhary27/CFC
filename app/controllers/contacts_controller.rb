class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end
  
  # POST request to /contacts
  def create
    # Mass assignment of form fields into Contact object
    @contact = Contact.new(contact_params)
    # Save the contact object to database
    if @contact.save
      # store form fields via parameters, into variables
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      # Plug variables into Contact Mailer
      # email method and send email
      ContactMailer.contact_email(name, email, body).deliver
      # Store success message in flash hash
      # redirect to new action
      flash[:success] = "Thank you! We will send you a sign up link on launch. Peace!"
      redirect_to new_contact_path
    else
      # if contact object doesn't save,
      # store error in flash hash,
      # and redirect_to the new action
      flash[:danger] = @contact.errors.full_messages.join(", ")
      redirect_to new_contact_path
    end
  end
  
  private
  # collect data from form we need to use strong
  # parameters and whitelist the form fields
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
  
end