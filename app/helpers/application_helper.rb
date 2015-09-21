module ApplicationHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def link_to_next_fixture(fixture)
    link_to "מחזור הבא", index_path(:number => fixture.number + 1), :class=>"loader-ajax-link"
  end

  def link_to_prev_fixture(fixture)
    return if fixture.number < 2
    link_to "מחזור הקודם", index_path(:number => fixture.number - 1 ), :class=>"loader-ajax-link"
  end
end
