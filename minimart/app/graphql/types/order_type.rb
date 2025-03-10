module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType, null: false
    field :pickup_location, Types::PickupLocationType, null: false
    field :items, [Types::OrderItemType], null: false, method: :order_items
    field :total_amount, Integer, null: false
    field :ordered_at, GraphQL::Types::ISO8601DateTime, null: true
    field :delivery_date, GraphQL::Types::ISO8601DateTime, null: true
  end
end
