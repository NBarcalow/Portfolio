require "rails_helper"

RSpec.describe Post, type: :model do
  context "validations tests" do
    it "ensures the title is present" do
      project = Post.new(description: "Content of the description")
      expect(project.valid?).to eq(false)
    end

    it "ensures the description is present" do
      project = Post.new(title: "Title")
      expect(project.valid?).to eq(false)
    end
    
    it "should be able to save project" do
      project = Post.new(title: "Title", description: "Some description content goes here")
      expect(project.save).to eq(true)
    end
  end

  context "scopes tests" do

  end
end

RSpec.describe Post, type: :model do
    # ...
  
    context "scopes tests" do
      let(:params) { { title: "Title", description: "some description" } }
      before(:each) do
        Post.create(params)
        Post.create(params)
        Post.create(params)
      end
  
      it "should return all projects" do
        expect(Post.count).to eq(3)
      end
  
    end
  end

  RSpec.describe PostsController, type: :controller do
    context "GET #index" do
      it "returns a success response" do
        get :index
        # expect(response.success).to eq(true)
        expect(response).to be_success
      end
    end
  
    context "GET #show" do
      let!(:project) { Post.create(title: "Test title", description: "Test description") }
      it "returns a success response" do
        get :show, params: { id: project }
        expect(response).to be_success
      end
    end
  end