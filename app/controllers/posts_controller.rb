class PostsController < ApplicationController

  # GET /posts
  # GET /posts.json
  def index

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new

    @post = Post.new

  end


  # POST /posts
  # POST /posts.json
  def create

    @post = Post.new(post_params)
    @post.user_id = 1 #fake user id, while we dont insert user authentication
    @post.active = true

    if @post.save

      flash.now[:notice] = "Your post was saved successfully!"
      flash.now[:style] = "success"

      render("landing/index")


      #send post saved successfully message

    else
      #send error message

      flash.now[:notice] = "Error while trying to create your post!"
      flash.now[:style] = "danger"

    end



    end


  end

  # GET /posts/1/edit
  def edit
  end


  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update

  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy

  end

private

def post_params
  params.require(:post).permit(:title, :body)

end
