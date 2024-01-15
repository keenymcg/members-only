class PostsController < ApplicationController
    # create a before action to restrict access to the new and create actions to only users who are signed in
    before_action :authenticate_user!, only: [:new, :create]
    
    # For your Posts Controller, prepare your #index action. This action should assign all Post objects to an instance variable @posts.
    def index
        @posts = Post.all
    end
    
    # For your Posts Controller, prepare your #new action. This action should create a new instance of a Post object and assign it to an instance variable @post.
    def new
        @post = Post.new
    end

    # Make your corresponding #create action build a post where the foreign key for the author (e.g. user_id) is automatically populated based on whichever user is signed in. Redirect to the Index view if successful.
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            # might need to redirect to index
            redirect_to root_path
        else
            render :new
        end
    end

##   RLMoser's create method
#   def create
#     @post = Post.new(post_params)
#     @post.user = current_user

#     if @post.save
#       redirect_to root_path
#     else
#       render :new
#     end
#   end


    private

    # Use strong params to ensure that the params hash coming from the form is properly formatted.
    def post_params
        params.require(:post).permit(:title, :content)
    end

end
