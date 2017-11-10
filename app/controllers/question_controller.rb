class QuestionController < ApplicationController
  def index
    @asks = Ask.all
    @users = User.all
  end

   def create
        @name = params[:user_name]
        @content = params[:content]
        option = params[:option]
  
        if option == "noname"
        @name = "익명"
        end
        
        Ask.create(
            name: @name,
            content: @content
            )
    
        redirect_to '/'
    end

  def show
  @name = params[:user_name]
  @content = params[:content]
  option = params[:option]
  
  if option == "noname"
    @name = "익명"
  end
end

  def destroy
        @id = params[:id]
        ask = Ask.find(@id)
        ask.destroy
        redirect_to '/'
end

  def modify
      @id = params[:id]
      ask = Ask.find(@id)
      @name = params[:user_name]
      @content = params[:content]
      option = params[:option]
      if option == "noname"
      @name = "익명"
      end
  
      ask.update(
        
      @name = params[:user_name],
      @content = params[:content],
      @option = params[:option]
        )
        
      redirect_to '/'
  end
  
  def sign_up
    @email = params[:email]
    @name = params[:name]
    @password = params[:password]
    
    User.create(
      email: @email,
      name: @name,
      password: @password
      )
  end
  
  def sign_up_process
    @email = params[:email]
    @name = params[:name]
    @password = params[:password]
       
       User.create(
      email: @email,
      name: @name,
      password: @password
      )
  end
  
  def login
    
  end
  
  def login_process
    @email = params[:email]
    @password = params[:password]
    
    #유저 인증
    user = User.find_by(email: @email)
    # 해당하는 email를 가진 user가 있다면,
    # => {email: asdfasdf, name: asdfasdf, password:asdfasdf)
    
    if user
      #만약에 user가있다면
      if user.password == @password 
        session[:user_email] = user.email
        redirect_to '/'
      else
       @message = "비밀번호가 틀렸어요"
    end
  else
    @message = "야 너 가입 안했거나, 이메일 틀렸어"
    end
  end
  
  def logout
    session.clear
    redirect_to '/'
  end
  
end
