module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :viewer, Types::UserType, null: true, description: "リクエストしたユーザー自身を返す"
    field :pickup_locations, [Types::PickupLocationType], null: false, description: "全ての受け取り場所を返す"

    def viewer
      context[:current_user]
    end

    def pickup_locations
      PickupLocation.all
    end

  end
end
