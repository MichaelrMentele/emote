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

