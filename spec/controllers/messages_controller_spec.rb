describe MessagesController do 
  describe "POST create" do 
    context "valid input" do
      before do 
        set_current_user
        request.env["HTTP_REFERER"] = home_path
        post :create, user_id: current_user.id, message: { emoji: 'joy', message: 'Hello!' }
      end

      it "creates a message" do 
        expect(Message.all.count).to eq(1)
      end

      it "sets success flash message" do 
        expect(flash[:success]).to be_present
      end

      it "redirects back to the home path" do 
        expect(response).to redirect_to home_path
      end
    end

    context "invalid input" do 
      before do 
        set_current_user
        post :create, user_id: current_user.id, message: { emoji: 'joy', message: '' }
      end

      it "does not create a message" do 
        expect(Message.all.count).to eq(0)
      end

      it "sets @message" do 
        expect(assigns(:message)).to be_instance_of(Message)
      end

      it "sets a flash danger message" do 
        expect(flash[:danger]).to be_present
      end

      it "renders the home page" do 
        expect(response).to render_template 'users/home'
      end
    end
  end
end