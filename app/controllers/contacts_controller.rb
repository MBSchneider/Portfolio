class ContactsController < ApplicationController
  # GET /contacts/new
  # GET /contacts/new.json
  def index
    @message = Contact.new
  end

  def new
    @message = Contact.new
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @message = Contact.new(params[:contact])

    if @message.valid?
      ContactMailer.contact_me(@message).deliver
      redirect_to(root_path, :notice => "Message was successfully sent.")
    else
      flash.now.alert = "Please fill all fields."
      render :index
    end
  end
end
