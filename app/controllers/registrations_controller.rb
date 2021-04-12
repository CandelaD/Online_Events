class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params

    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation)

  end

  def account_update_params

    params.require(:user).permit(:name, :last_name, :email, :password, :password_confirmation, :current_password)

  end

  def welcome
    UserMailer.new_user.deliver_now
  end
  

end