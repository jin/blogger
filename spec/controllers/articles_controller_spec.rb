require 'spec_helper'

describe ArticlesController do
  describe "GET #index" do
    it "responds successfully with a HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index 
      expect(response).to render_template("index")
    end

    it "loads all articles into @articles" do
      article1, article2 = Article.create!, Article.create!
      get :index

      expect(assigns(:articles)).to match_array([article1, article2])
    end
  end
end
