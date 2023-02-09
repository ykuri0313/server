module Api
  module V1
    class PropertiesController < SecuredController
      # skip_before_action :authorize_request, only: %i[index show]

      def index
        properties = Property.all
        render json: properties, root: 'properties', adapter: :json, each_serializer: Property::BaseSerializer
      end

      def show
        post = Post.find(params[:id])
        render json: post
      end
    
      def create
        post = @current_user.posts.build(post_params)
    
        if post.save
          render json: post
        else
          render json: post.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        post = Post.find(params[:id])
        post.delete
      end
    
      private
    
      def post_params
        params.permit(:title,:content)
      end
    end
  end
end