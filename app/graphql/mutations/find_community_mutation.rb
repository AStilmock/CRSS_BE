class Mutations::FindCommunityMutation < Mutations::BaseMutation
  null true
  argument :zip_code, String

  field :find_community, Types::FindCommunityType
  field :errors, [String], null: false

  def resolve(body:, post_id:)
    post = Post.find(post_id)
    comment = post.comments.build(body: body, author: context[:current_user])
    if comment.save
      {
        comment: comment,
        errors: [],
      }
    else
      {
        comment: nil,
        errors: comment.errors.full_messages
      }
    end
  end
end