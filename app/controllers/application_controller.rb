class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception






  # Если в классе было
  # attr_accessible :name, :email
  # то теперь это заменит приватный метод в контроллере
  #
  # private
  # def user_param
  #   params.require(:user).permit(:name, :email)
  # end
  #
  # И теперь при создании или апдейте user в контроллере вместо
  # @user = User.create(params[:user])
  # используем
  # @user = User.create( user_param )

end
