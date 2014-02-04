# Used for sending email from 'contact me' page
class ContactsController < ApplicationController
  def index
    @message = Contact.new
  end

  def create
    @message = Contact.new(params[:contact])
    if @message.valid?

      ContactMailer.contact_me(@message).deliver
      redirect_to(root_path, notice: 'Message was successfully sent.')
    else
      flash.now.alert = 'Please fill all fields.'
      render :index
    end
  end
end
