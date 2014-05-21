require 'spec_helper'

describe '/contacts' do

  before (:each) do
    @contacts = Contact.create!([{name: "Sir Example", 
                                  email: "example@gmail.com",
                                  number: "9876543",
                                  imgUrl: "http://3.bp.blogspot.com/_HeUY-A2efl4/SpWD8AFH8vI/AAAAAAAADGQ/jW79Fo5XzY0/s400/WarrenZevon_MrBadExample1991%5B1%5D.jpg"
                                  },
                                  {name: "Mrs. Sample", 
                                  email: "sample@gmail.com",
                                  number: "1234985",
                                  imgUrl: "http://hearstcommerce.ca/customcontent/members/premium/sample.jpg"
                                  }])
  end

  describe 'GET with JSON' do
    before (:each) do
      get '/contacts.json'
      @result = JSON.parse(response.body)
    end

    it 'returns all contacts' do
      @result.should_not be_nil
      @result.should have(2).contacts
    end

    it 'should not have updated_at or created_at' do
      @result[0]['updated_at'].should be_nil
      @result[0]['created_at'].should be_nil

      @result[1]['updated_at'].should be_nil
      @result[1]['created_at'].should be_nil
    end

    it 'should have the correct data in the contacts' do
      @result.find do |contact|
        contact["name"] == "Sir Example"
      end.should_not be_nil
    end
  end
end


# How a contact is stored in the contacts []
    # var newContact = { id: count,
    #                    name: name,
    #                    email: email,
    #                    number: number,
    #                    imgUrl: imgUrl };