def set_current_user(user: nil, clear: false)
  if clear
    session[:user_id] = nil
  elsif user
    session[:user_id] = user.id 
  else
    session[:user_id] = Fabricate(:user).id
  end
end

def current_user
  User.find(session[:user_id])
end

def login(user)
  visit login_path
  fill_in "Email Address", with: user.email
  fill_in "Password", with: user.password
  click_button "Login"
  sleep 1
end