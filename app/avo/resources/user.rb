class Avo::Resources::User < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search = {
    query: -> { query.ransack(id_eq: params[:q], name_cont: params[:q], email_cont: params[:q],  m: "or").result(distinct: false) }
  }

  def fields
    field :id, as: :id
    field :email, as: :gravatar, link_to_record: true, rounded: false, as_avatar: true
    field :name, as: :text
    field :email, as: :text, as_description: true
    field :posts, as: :has_many
  end

end
