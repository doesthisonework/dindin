module Api
  class UsersController < ApiController
    def show
      @user = current_user ? current_user : User.new
      render :show
    end

    def update
      if user_signed_in?
        @user = current_user
        @user.update_attributes(user_params)
      end
      render :show
    end

    private

    def user_params
      params[:user][:saved_ingredient_ids] ||= []
      params[:user][:favorite_recipe_ids] ||= []
      params.require(:user).permit(saved_ingredient_ids: [], favorite_recipe_ids: [])
    end
  end
end