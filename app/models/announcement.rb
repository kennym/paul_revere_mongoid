class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body

  has_and_belongs_to_many :already_seen_by, inverse_of: :announcements, class_name: "User"

  def self.current
    first(sort: [[ :created_at, :desc ]]) || new
  end

  def exists?
    !new_record?
  end
end
