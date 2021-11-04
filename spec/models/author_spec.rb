require 'rails_helper'

 describe "Add Author", type: :model do
    it "should create an author from given parameters" do
        author = Author.new(:first_name => "Alan", :last_name => "Turing", :homepage => "http://wikipedia.org/Alan_Turing")
        expect(author.first_name).to eq("Alan")
        expect(author.last_name).to eq("Turing")
        expect(author.homepage).to eq("http://wikipedia.org/Alan_Turing")
    end

    it "should have a method returning the full name" do
        author = Author.new(:first_name => "Alan", :last_name => "Turing", :homepage => "http://wikipedia.org/Alan_Turing")
        expect(author.name).to eq("Alan Turing")
    end
 end