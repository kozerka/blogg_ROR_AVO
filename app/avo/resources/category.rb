class Avo::Resources::Category < Avo::BaseResource
  self.title = :title
  self.includes = []
  self.search = {
    query: -> {
      q_param = params[:q]
      if q_param.present?
        query.ransack(id_eq: q_param, title_cont: q_param, description_cont: q_param, m: "or").result(distinct: false)
      else
        query
      end
    }
  }

  def fields
    field :id, as: :id
    field :title, as: :text
    field :description, as: :textarea
    field :posts_count, as: :number

    field :posts, as: :has_many, attach_scope: -> { query.where.not(category_id: parent.id).or(query.where(category_id: nil)) }
  end
end
