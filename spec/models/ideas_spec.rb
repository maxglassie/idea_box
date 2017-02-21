require 'rails_helper'

xdescribe Idea do
  describe "validations" do
    context "valid attributes" do
    it "is valid with name, description, and image" do
        idea = Idea.new(name: "religious jokes", description: "JMJ walk into a bar", image: "link", category_id: 1)
        expect(idea).to be_valid
    end 

    it "is valid without an image" do
      idea = Idea.new(name: "religious jokes", description: "JMJ walk into a bar", category_id: 1)
      expect(idea).to be_valid
    end
  end

    context "invalid attributes" do
      it "is invalid without a name" do
        idea = Idea.new(description: "JMJ walk into a bar", image: "link", category_id: 1)
        expect(idea).to be_invalid
      end

      it "is invalid without a description" do
        idea = Idea.new(description: "JMJ walk into a bar", image: "link", category_id: 1)
        expect(idea).to be_invalid
      end
    end
  end
end