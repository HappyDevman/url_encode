class Link < ApplicationRecord
  validates :original_url, presence: true
  validates :original_url, format: URI::regexp(%w[http https])

  after_create :create_short_url

  def create_short_url
    self.short_url = Link.url_encode(id)
    save
  end

  private

  def self.url_encode(i)
    return alphabet[0] if i == 0

    s = ''
    base = alphabet.length
    while i > 0
      s << alphabet[i.modulo(base)]
      i /= base
    end
    s.reverse
  end

  def self.alphabet
    "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".split(//)
  end
end
