class RelationshipsController < ApplicationController
  respond_to? :js # Si vous souhaitez renvoyer toutes les actions de réponse qui existent dans js, vous pouvez le faire.
  def create
    if logged_in?
      @user = User.find(params[:relationship][:followed_id])
      current_user.follow!(@user)
    end  
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
  end
end
