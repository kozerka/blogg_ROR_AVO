class PagesController < ApplicationController
  def home
     @faqs = Faq.includes(:posts)
  end

  def about_us
  end

  def contact
  end
end
