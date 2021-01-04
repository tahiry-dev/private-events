class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    # rubocop:disable Style/GuardClause
    unless logged_in?
      flash[:danger] = 'Please log in First'
      redirect_to login_url
    end
    # rubocop:enable Style/GuardClause
  end
end
