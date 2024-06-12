class LikesController < ApplicationController

    def create
        like = current_user.likes.create(motivation_id: params[:motivation_id]) #user_idとmotivation_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(motivation_id: params[:motivation_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
    def create
    like = current_user.likes.create(blog_id: params[:blog_id]) #user_idとmotivation_idの二つを代入
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(blog_id: params[:blog_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end
  
  end
