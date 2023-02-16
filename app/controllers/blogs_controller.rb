class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy]

    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end

    def create
        @blog = Blog.new(blog_params)

        if @blog.save
            flash[:notice] = "Blog successfully saved!"
            redirect_to @blog
        else
            flash[:notice] = "There was an error when attempting to save this blog."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
      
    end

    def update
       
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def show
      
    end

    def destroy
        @blog.destroy
        redirect_to blogs_path
    end

    #THIS MUST STAY AT THE BOTTOM
    private
    def blog_params
        params.require(:blog).permit(:title, :content, :image_path, :category_ids)
    end

    def set_blog
        @blog = Blog.find(params[:id])
    end
end

