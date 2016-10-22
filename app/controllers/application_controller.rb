class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def render_403
      render fiel: "public/403.html", status: 403
    end

    def render_404
      render file: "public/404.html", status: 404
    end


    def check_if_admin
      render_403 unless params[:admin]
      # render text: "Access denied", status 403 unless current_user.admin == true
      # render text: "Access denied", status: 403 unless params[:admin]
    end


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
