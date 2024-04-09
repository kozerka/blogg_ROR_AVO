class Avo::Resources::Post < Avo::BaseResource
  self.title = :title
  self.includes = [:category]
  self.search = {
    query: -> { query.ransack(id_eq: params[:q], title_cont: params[:q], m: "or").result(distinct: false) }
  }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :excerpt, as: :text, only_on: :index
    field :body, as: :trix
    field :category, as: :belongs_to
    field :user, name: :author, as: :belongs_to
    field :faqs, as: :has_and_belongs_to_many
    field :image, as: :file

  end
end
