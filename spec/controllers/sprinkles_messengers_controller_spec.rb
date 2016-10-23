describe SprinklesMessengersController do 
  describe "GET show" do
    let(:alice) { Fabricate(:user) }
    let(:bob) { Fabricate(:significant, user: alice) } 
    let(:sprinkles) { Fabricate(:sprinkles_messenger) }
    before do 
      set_current_user(user: alice)
      get :show, user_id: current_user.id, id: sprinkles.id
    end

    it "sets @messenger" do 
      expect(assigns(:messenger)).to eq(SprinklesMessenger.first)
    end

    it "sets @messenge" do 
      expect(assigns(:message)).to be_instance_of(Message)
    end
  end
end