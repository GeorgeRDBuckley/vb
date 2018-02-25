class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :username) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :name, :bio, :location, :instagram, :facebook, :twitter, :email, :password, :current_password, :profile_img) }
    end

    def authenticate_brewery!
        # Already logged in
        if params[:token]
          @brewery_token = Brewery.find_by(token: params[:token])
          session[:brewery_id] = @brewery_token.id
          session[:token] = params[:token]
          session[:brewery] = @brewery_token.slug
        end
      end

      def render_404
        respond_to do |format|
          format.html { render :file => "#{Rails.root}/public/404", :status => :not_found }
          format.xml  { head :not_found }
          format.any  { head :not_found }
        end
      end

      def not_found
        render_404
      end      
      
end
