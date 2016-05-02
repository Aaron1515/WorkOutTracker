module UsersHelper
  def current_user
    binding.pry
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
