class BlogsController < ApplicationController
  def index
  end

  def new
    @blogs = Blog.all
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
  end
  
  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      flash[:notice]="Book was successfully created."
      redirect_to blog_path(@blog[:id])
    else 
      @blogs = Blog.all
      render :new
    end
    
  end

  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      flash[:notice]="Book was successfully updated."
      redirect_to blog_path(@blog[:id])
    else
      render :edit
    end
  end
  
  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to new_blog_path
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
  
end
