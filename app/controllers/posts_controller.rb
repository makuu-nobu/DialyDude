class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new   
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            count_build(@post)
            redirect_to root_path           
        else
            render :new, status: :unprocessable_entity      
        end        
    end

    def show
        @post = Post.find(params[:id])
        update_view_count(@post)

    end

    private
    def post_params
        params.require(:post).permit(:title, :subtitle, :content, :image, :category_id, :month_id).merge(user_id: current_user.id)
    end

    def update_view_count(post)
        count = post.count || post.build_count
        count.increment!(:count)
        #integer型の保有制限は256なので、のちに超過分を別カラムに記録する処理を考える
    end

    def count_build(post)
        @count = Count.new(post_id: post.id)
        @count.save
    end
end
