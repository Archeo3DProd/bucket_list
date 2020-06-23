class Idea < ApplicationRecord

  def self.most_recent()
    Idea.all.order(created_at: :desc).limit(3)
  end

  def self.search(search_term)
    Idea.where('title LIKE ?', "%#{search_term}%").or(where('description LIKE ?', "%#{search_term}%"))
  end
end
