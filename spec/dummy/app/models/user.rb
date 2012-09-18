class User
  include Mongoid::Document

  has_and_belongs_to_many :announcements, inverse_of: :already_seen_by, class_name: "Announcement"
end
