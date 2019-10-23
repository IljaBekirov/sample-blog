# frozen_string_literal: true

class ContactsController < ApplicationController
  def new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid?
      @contact.save
    else
      render 'new' #new_contacts_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:email, :message)
  end
end
