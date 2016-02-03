require 'rails_helper'

RSpec.describe NotesController, :type => :controller do
  let(:sophie) { User.create!(email: "sophie.zhao@ucla.edu", password: "hello_fin") }

  describe "GET #new" do
    context "when logged in" do

      before do
        allow(controller).to receive(:current_user) { sophie }
      end

      it "renders the new notes page" do
        get :new, post: {}
        expect(response).to render_template("new")
      end
    end

    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :new, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "GET #index" do
    context "when logged out" do
      before do
        allow(controller).to receive(:current_user) { nil }
      end

      it "redirects to the login page" do
        get :index, post: {}
        expect(response).to redirect_to(new_session_url)
      end
    end
  end

  describe "POST #create" do
    let(:jack_bruce) { User.create!(email: "jack_bruce", password: "abcdef") }

    before do
      allow(controller).to receive(:current_user) { jack_bruce }
    end

    context "with invalid params" do
      it "validates the presence of title and body" do
        post :create, note: {text: "this is an invalid post"}
        expect(response).to render_template("new")
      end
    end

    context "with valid params" do
      it "redirects to the post show page" do
        post :create, note: {text: "teehee", lat: 36, lng: 36}
        expect(response).to redirect_to(note_url(Note.last))
      end
    end
  end

end
