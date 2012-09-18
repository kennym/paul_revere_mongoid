class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body

  has_and_belongs_to_many :already_seen_by, class_name: "User"

  def self.current
    first(sort: [[ :created_at, :desc ]]) || new
  end

  def self.current_for_user(user)
    announcement = where(:already_seen_by_ids.ne => user.id)
    unless announcement.empty?
      announcement = announcement.desc(:created_at)
    end
    announcement.first
  end

  def exists?
    !new_record?
  end
end
