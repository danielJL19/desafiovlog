class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :find_post, only: [:show,:edit, :update, :destroy]
  before_action except: [:index,:show] do 
    authorize_request(["admin"])
  end
  before_action :find_post_user, only:[:destroy,:update,:edit]
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct:true)
  end

  def new
     @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.create(post_params)
    if @post.save
      redirect_to root_path, notice: "Se ha creado con éxito la noticia"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice:'Se ha modificado con éxito'
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: "Se ha eliminado con éxito"
  end

  private 
  def find_post 
    @post =Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name,:description, :photo)

  end

  def find_post_user
    if @post.id ==! current_user.id
      redirect_to root_path, alert: "No tienes autorización"
    end
  end
end
