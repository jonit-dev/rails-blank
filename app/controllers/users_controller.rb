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

  def login

  end

  def login_attempt

    #find the user in database
    @user = User.where(:email => params[:email]).first

    if @user.blank?

      #user not found case
      flash.now[:notice] = "Your username or password was incorrect. Try again"
      flash.now[:style] = "danger"

      render("users/login")

    else
      #if user was found, lets authenticate him!

      if @user.authenticate(params[:password]) === false

        #password incorrect
        flash.now[:notice] = "Your username or password was incorrect. Try again"
        flash.now[:style] = "danger"

        render("users/login")

      else
        #login user
        session[:user_id] = @user.id

        #password incorrect
        flash.now[:notice] = "You're logged in! Welcome back #{@user.name}"
        flash.now[:style] = "success"
        render("landing/index")

      end


    end

  end

  def logout

    session[:user_id] = nil

    flash.now[:notice] = "You're now logged out."
    flash.now[:style] = "warning"

    render("landing/index")

  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
