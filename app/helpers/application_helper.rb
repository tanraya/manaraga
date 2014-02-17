module ApplicationHelper
  def manaraga_user
    current_user || User.new
  end
end
