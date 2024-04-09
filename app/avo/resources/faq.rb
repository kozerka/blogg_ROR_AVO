class Avo::Resources::Faq < Avo::BaseResource
  self.title = :title
  self.includes = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :body, as: :textarea
    field :posts, as: :has_and_belongs_to_many
  end
end
