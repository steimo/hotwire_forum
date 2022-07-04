class Post < ApplicationRecord
  belongs_to :discussion, counter_cache: true, touch: true
  belongs_to :user, default: -> { Current.user }
  has_rich_text :body
  validates :body, presence: true
  has_noticed_notifications

  after_create_commit -> { broadcast_append_to discussion, partial: 'discussions/posts/post', locals: { post: self } }
  after_update_commit -> { broadcast_replace_to discussion, partial: 'discussions/posts/post', locals: { post: self } }
  after_destroy_commit -> { broadcast_remove_to discussion }
end
