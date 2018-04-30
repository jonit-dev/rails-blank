class UsersController < ApplicationController


  def new

    @user = User.new

  end

  def create

    @user = User.new(user_params)

    if @user.save

      #if user was created on database

      #lets authenticate him

      if @user.authenticate(params[:password] === false)
        flash.now[:notice] = "User created, but failed to authenticate... What???!?!?"
        flash.now[:style] = "danger"

        render("landing/index")

      else

        session[:user_id] = @user.id #start user session


        flash.now[:notice] = "Your user was created successfully! You're now logged in!"
        flash.now[:style] = "success"



        render("landing/index")

      end


    else
      #errors while trying to create user


      #since we're using a error display helper (error_messages), they will be rendered automatically!
      render("users/new")


    end


  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
