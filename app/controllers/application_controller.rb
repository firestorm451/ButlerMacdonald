class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_user

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "You need to login first."
      redirect_to :login
    end
  end

  def disallow_user
    if current_user
      flash[:warning] = "You're already logged in."
      redirect_to :root
    end
  end

  def redirect_if_job_complete?
    if defined?(@job) && @job.job_status == "complete"
      flash[:warning] = "This job is already complete."
      redirect_to :root
    end
  end
end
