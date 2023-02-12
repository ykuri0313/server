class Property::BaseSerializer < ApplicationSerializer
  attributes :id, :name, :description, :rental_period, :price, :is_purchasable, :status, :image_url
end