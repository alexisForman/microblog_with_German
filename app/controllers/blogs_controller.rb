class BlogsController < ApplicationController
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
            redirect_to blogs_path
        else
            flash[:notice] = "There was an error when attempting to save this blog."
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @blog = Blog.find(params[:id])
    end

    def update
        @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
            redirect_to blogs_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    #THIS MUST STAY AT THE BOTTOM
    private
    def blog_params
        params.require(:blog).permit(:title, :content, :image_path)
    end
end

