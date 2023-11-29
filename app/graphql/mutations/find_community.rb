class Mutations::FindCommunity < Mutations::BaseMutation
  null true
  argument :zipCode, String, required: true

  # field :find_community, Types::FindCommunityType
  field :messages, String, null: false
  field :errors, [String], null: false

  def resolve(zip)
    communities = CommunitySerializer.new(LocationFacade.new(zip))
  end
  

  # def resolve(zip)
    # post = Post.find(post_id)
    # comment = post.comments.build(body: body, author: context[:current_user])
    # if comment.save
    #   {
    #     comment: comment,
    #     errors: [],
    #   }
    # else
    #   {
    #     comment: nil,
    #     errors: comment.errors.full_messages
    #   }
    # end
  # end
end