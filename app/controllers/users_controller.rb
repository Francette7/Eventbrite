class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]
  before_action :own_profile, only: [:show]
  
  def show
    @user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
		if @user.update(user_params)
      		flash[:success] = " 😇 Félicitation! vous avez mis à jour votre Evénement! 👌"
        	redirect_to user_path
    	else
    		flash[:failed] = "🤔 Attention!!! un des champs n'est pas valide. 🤓 Veuillez réessayer svp!"
        	render '/users/:id'
        end
  
  end

  private
  def own_profile
  	if params[:id].to_i == current_user.id
  	else
  		redirect_to user_path(current_user.id)
  	end
  end

  def user_params
  	params.require(:user).permit(:description, :first_name, :last_name)
  	
  end
end
