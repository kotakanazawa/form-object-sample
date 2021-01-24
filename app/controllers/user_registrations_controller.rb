class UserRegistrationsController < ApplicationController
  def new
    @user_registration_form = UserRegistrationForm.new
  end

  def create
    @user_registration_form = UserRegistrationForm.new(user_params)

    if @user_registration_form.save
      redirect_to root_path, notice: "登録しました"
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user_registration_form).permit(:email, :password, :password_confirmation, :terms_of_service)
    end
end
