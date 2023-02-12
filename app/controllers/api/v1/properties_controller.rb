module Api
  module V1
    class PropertiesController < SecuredController
      skip_before_action :authorize_request, only: %i[index show]

      def index
        properties = Property.published
        render json: properties, root: 'properties', adapter: :json, each_serializer: Property::BaseSerializer
      end

      def closet
        properties = @current_user.properties.draft
        render json: properties, root: 'properties', adapter: :json, each_serializer: Property::BaseSerializer
      end

      def show
        property = Property.find(params[:id])
        render json: property, serializer: Property::BaseSerializer
      end
    
      def create
        property = @current_user.properties.build(property_params)
    
        if property.save
          render status: 200, json: property, root: 'property', adapter: :json, serializer: Property::BaseSerializer
        else
          render json: property.errors, status: :unprocessable_entity
        end
      end

      def attach_image
        property = Property.find_by!(id: params[:property_id])
        property.update!(status: "published")
        
        if property.images.attach(params[:file])
          render status: 200
        else
          render status: 500
        end
      end
    
      def destroy
        post = Post.find(params[:id])
        post.delete
      end
    
      private
    
      def property_params
        params.permit(
          :name,
          :description,
          :is_purchasable,
          :rental_period,
          :price
          ).merge(
            status: "draft"
          )
      end
    end
  end
end