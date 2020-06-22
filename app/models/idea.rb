class Idea < ApplicationRecord
  def self.search(search_term)
    Idea.where('title LIKE ?', "%#{search_term}%")
  end
end
