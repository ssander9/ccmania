class UsersController < ApplicationController
   
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to user_path(@user.id)
      else
        render 'new'
      end
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find_by(email: edit_user_params[:email])

      if @user.update(edit_user_params)
        redirect_to user_path(@user.id)
      else
        redirect_to edit_user_path(@user.id)
      end 
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def edit_user_params
      params.require(:user).permit(:name, :email, :gas, :transit, :rideshare, :entertainment, :streaming, :dining, :grocery, :drugstore, :department_store, :clothing, :travel, :hotel, :other, :main_image)
    end
end
