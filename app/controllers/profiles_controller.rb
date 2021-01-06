class ProfilesController < ApplicationController
  def show
    render :show
  end

  def edit
  end

  def update
    user = current_user
    user.update(user_params)
  end

  # マスアサインメントでハッシュ形式のデータを一括で設定する際にパラメータに予期せぬデータを入力されるのを防ぐ
  private
  
  def user_params
    if current_user.admin?
      params.require(:user).permit(:name, :email, :admin)
    else
      params.require(:user).permit(:name, :email)
    end
  end
end
