class UsersController < ApplicationController
  def acount
    @user = User.find_by(id: params[:id])
  end

  def plofile
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = current_user
    @user.icon = params[:icon]
    @user.name = params[:name]
    @user.introduction = params[:introduction]

    if @user.save
        flash[:notice] = "変更が完了しました"
        redirect_to("/")
    else
        flash[:alert] = "変更に失敗しました"
        render "user/acount"
    end
  end

end
