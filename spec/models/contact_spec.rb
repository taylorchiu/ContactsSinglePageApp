require 'spec_helper'


describe Contact do

	before(:each) do
  @contact = Contact.new(name: "name", email: "email@gmail.com", number: "1234567", imgUrl: "http://comps.canstockphoto.com/can-stock-photo_csp15436000.jpg")
	end

  it 'should have a name, email, number, imgUrl' do
  	@contact.should be_valid
  end

  it 'should have a name' do
  	@contact.name.should eq("name")
  end
end
