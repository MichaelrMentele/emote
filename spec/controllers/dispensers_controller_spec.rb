describe DispensersController do 
  describe "GET new" do 
    it "sets @dispenser" do 
      alice = Fabricate(:user)
      get :new, user_id: alice.id
      expect(assigns(:dispenser)).to be_instance_of(Dispenser)
    end
  end

  describe "POST create" do 
    context "valid inputs" do 
      let(:alice) { Fabricate(:user) }
      let(:bob) { Fabricate(:significant, user: alice) }
      before do 
        set_current_user(user: alice)
        post :create, { user_id: current_user.id, frequency: "1", period: "1", dispenser: { purpose_statement: "Test", significant_id: bob.id } }
      end

      it "sets the flash success" do 
        expect(flash[:success]).to be_present
      end

      it "redirects to the show messenger path" do 
        expect(response).to redirect_to user_sprinkles_messenger_path(user_id: alice.id, id: SprinklesMessenger.first.id)
      end

      it "creates a sprinkles messenger" do 
        expect(SprinklesMessenger.all.count).to eq(1)
      end

      it "creates a dispenser" do 
        expect(Dispenser.all.count).to eq(1)
      end
    end

    context "invalid inputs" do 
      let(:alice) { Fabricate(:user) }
      let(:bob) { Fabricate(:significant, user: alice) }
      before do 
        set_current_user(user: alice)
        post :create, { user_id: current_user.id, frequency: "1", period: "1", dispenser: { purpose_statement: "", significant_id: bob.id } }
      end

      it "sets the flash danger message" do 
        expect(flash[:danger]).to be_present
      end

      it "renders the :new template" do 
        expect(response).to render_template :new
      end

      it "does not create a messenger" do 
        expect(SprinklesMessenger.all.count).to eq(0)
      end

      it "does not create a dispenser" do 
        expect(Dispenser.all.count).to eq(0)
      end
    end
  end
end