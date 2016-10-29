describe SignificantsController do 

  describe "GET new" do 
    it "sets @significant" do 
      alice = Fabricate(:user)

      get :new, user_id: alice.id
      expect(assigns(:significant)).to be_instance_of(Significant)
    end
  end

  describe "POST create" do 
    let!(:alice) { Fabricate(:user) }
    before { set_current_user(user: alice) }

    context "with valid inputs" do 
      before do
        post :create, significant: { name: "Brianna Pizana", phone: "5555555555" }, user_id: 1
      end

      it "sets creates a new significant" do
        expect(alice.significants.count).to eq(1)
      end

      it "redirects to the home page" do 
        expect(response).to redirect_to home_path
      end

      it "sets the flash success message" do
        expect(flash[:success]).to be_present 
      end
    end

    context "with invalid inputs" do 
      before do
        post :create, significant: { name: "Brianna Pizana" }, user_id: 1
      end

      it "does not create a new significant" do 
        expect(Significant.all.count).to eq(0)
      end

      it "renders the new page" do 
        expect(response).to render_template :new
      end

      it "sets the flash danger message" do 
        expect(flash[:danger]).to be_present
      end
    end
  end
end