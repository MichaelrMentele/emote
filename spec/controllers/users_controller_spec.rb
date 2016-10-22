describe UsersController, type: :controller do 
  describe "GET new" do 
    it "sets @user" do 
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "GET edit" do 
    it "retrieves @user" do
      alice = Fabricate(:user)
      get :edit, id: alice.id
      expect(assigns(:user)).to be(alice)
    end
  end

  describe "PATCH update" do 
    context "valid inputs" do 
      it "updates the user"
      it "sets a flash success message"
      it "redirects to the edit page"
    end

    context "invalid inputs" do 
      it "does not update the user"
      it "sets a flash danger message"
      it "renders the :edit view"
    end
  end

  describe "POST create" do 
    
  end
end
