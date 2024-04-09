class Avo::Filters::PublishedFilter < Avo::Filters::BooleanFilter
  self.name = "Published filter"
  # self.visible = -> do
  #   true
  # end

  def apply(request, query, values)
    query
  end

  def options
    {}
  end
end
