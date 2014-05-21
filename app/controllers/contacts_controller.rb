class ContactsController < ApplicationController

  def main
  end
  
  def index
  	@contacts = Contact.all
  	respond_to do |format|
  		format.json { render :json => @contacts, :except => [:id, :created_at, :updated_at]}
  	end
  end	
end
