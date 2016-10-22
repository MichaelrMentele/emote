def set_current_user(user: nil, clear: false)
  if clear
    session[:user_id] = nil
  else
    session[:user_id] = user || Fabricate(:user).id
  end
end

def current_user
  User.find(session[:user_id])
end