class Announcement
  include Mongoid::Document
  include Mongoid::Timestamps

  field :body

  def self.current
    desc(:created_at).first || new
  end

  def exists?
    !new_record?
  end
end
