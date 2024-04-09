class Post < ApplicationRecord
  belongs_to :category, counter_cache: true, optional: true
  belongs_to :user
  has_and_belongs_to_many :faqs
  has_one_attached :image
  def excerpt
    ActionView::Base.full_sanitizer.sanitize(body).truncate(30)
  end
  def self.ransackable_associations(auth_object = nil)
    @ransackable_associations ||= reflect_on_all_associations.map { |a| a.name.to_s }
  end

  def self.ransackable_attributes(auth_object = nil)
    @ransackable_attributes ||= column_names + _ransackers.keys + _ransack_aliases.keys + attribute_aliases.keys
  end
end
