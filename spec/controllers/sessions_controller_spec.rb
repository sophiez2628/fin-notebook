require 'rails_helper'
require 'byebug'

RSpec.describe SessionsController, :type => :controller do

  context "with invalid credentials" do
    it "returns to sign in with an non-existent user" do
      post :create, user: {email: "hello", password: "hello"}
      expect(response).to render_template("new")
    end

    it "returns to sign in on bad password" do
      post :create, user: {email: "miriam@makeba.dance", password: "notmypassword"}
      expect(response).to render_template("new")
    end
  end

  context "with valid credentials" do
    it "redirects user to posts index on success" do
      post :create, user: {email: "miriam@makeba.dance", password: "patapata"}
      expect(response).to redirect_to("/users/1")

    end
  end

end
