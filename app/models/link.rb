class Link < ApplicationRecord

  before_save :check_slug

  def check_slug
    if slug.empty? || slug.nil?
      alphabet = ('a'..'z').to_a
      numbers = (0..1).to_a
      options = alphabet + numbers
      self.slug = [0, 0, 0, 0, 0].map { |_n| options.sample }.join
    end
  end
end
