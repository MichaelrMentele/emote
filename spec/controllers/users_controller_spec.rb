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
      expect(assigns(:user)).to eq(alice)
    end
  end

  describe "PATCH update" do 
    context "valid inputs" do 
      let(:alice) { Fabricate(:user, email: 'old@test', password: 'old', username: 'hello') }
      before do 
        put :update, { id: alice.id, user: { email: 'new@test', password: 'new', username: 'bye'} }
      end
      it "updates the user" do 
        expect(alice.reload.email).to eq('new@test')
      end

      it "sets a flash success message" do 
        expect(flash[:success]).to be_present
      end

      it "redirects to the edit page" do 
        expect(response).to redirect_to edit_user_path
      end
    end

    context "invalid inputs" do
      let(:alice) { Fabricate(:user, email: 'old@test', password: 'old', username: 'hello') } 
      before do 
        put :update, { id: alice.id, user: { email: '', password: 'new', username: 'bye'} }
      end

      it "sets @user" do 
        expect(assigns(:user)).to eq(alice)
      end

      it "does not update the user" do 
        expect(alice.reload.email).to eq('old@test')
      end

      it "sets a flash danger message" do 
        expect(flash[:danger]).to be_present
      end

      it "renders the :edit view" do 
        expect(response).to render_template :edit
      end
    end
  end

  describe "POST create" do 
    context "valid inputs" do 
      before do 
        post :create, user: { email: 'new@test', password: 'new', username: 'bye' }
      end

      it "creates the user" do 
        expect(User.all.count).to eq(1)
      end

      it "sets a flash success message" do 
        expect(flash[:success]).to be_present
      end

      it "redirects to the login page" do 
        expect(response).to redirect_to login_path
      end
    end

    context "invalid inputs" do
      before do 
        post :create, { user: { email: '', password: 'new', username: 'bye'} }
      end

      it "does not create the user" do 
        expect(User.all.count).to eq(0)
      end

      it "sets a flash danger message" do 
        expect(flash[:danger]).to be_present
      end

      it "renders the :new view" do 
        expect(response).to render_template :new
      end
    end
  end
end
