class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :favorite_articles, :dependent => :destroy

  validates :title,
            length: { minimum: 3, message: "3文字以上入力してください" }

  validates :content,
            length: { in: 5..20, message: "5文字以上20文字以内で入力してください" }

  validates :youtube_url,
            presence: { message: "youtubeのURLを入れてください" }

  paginates_per 1


  def article_owner?(current_user)
    self.user_id == current_user.id
  end

  def favorite_check?(current_user)
    self.favorite_articles.find_by(article_id: self.id, user_id: current_user.id).nil?
  end

end




