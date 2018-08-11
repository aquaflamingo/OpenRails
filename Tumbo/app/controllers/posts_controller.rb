class PostsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show,]
    before_action :find_doc, except: [:index, :new,:create]

    def index
        @posts = Post.all.order('created_at DESC')
    end

    def new
        @post  = current_user.posts.build
    end

    def create
        @post  = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else 
            render 'new'
        end
    end

    def show

    end

    def edit
    end

    def update
       

        if @post.update(post_params)
            redirect_to @post
        else
            render 'edit'
        end
    end

    def destroy
        @post.destroy
        redirect_to root_path
    end

    private

        def find_doc
            @post = Post.find(params[:id])
        end
    
        def post_params
            params.require(:post).permit(:title,:body)
        end
end
