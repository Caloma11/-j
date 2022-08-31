class Link < ApplicationRecord

  validates :og_url, presence: true
  validates :og_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])
  validates :slug, uniqueness: true
  validates_format_of :slug, with: /\A\w+\z/

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
