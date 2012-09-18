require 'spec_helper'

require File.join(File.dirname(__FILE__), '..', '..', 'app', 'models', 'announcement')

describe Announcement do
  it "should return the latest announcement when there are several" do
    old = create_announcement(:body => 'no fun', :created_at => 2.days.ago)
    latest = create_announcement(:body => 'fun', :created_at => 1.day.ago)
    older = create_announcement(:body => 'less fun', :created_at => 3.days.ago)

    Announcement.current.should == latest
  end

  it "should return an existent announcement where there is no announcement" do
    create_announcement(:body => 'body')
    Announcement.current.exists?.should == true
  end

  it "should return a non-existent announcement where there is no announcement" do
    Announcement.current.exists?.should be_false
  end

  it "can always assign straight to the body" do
    Announcement.create!(:body => 'hello').body.should == 'hello'
  end

  it "should return the announcement if not already seen by user" do
    user = User.create!

    announcement = Announcement.create!(:body => 'hello')
    Announcement.current_for_user(user).exists?.should be_true
  end

  it "should not return the announcement if already seen by user" do
    user = User.create!

    announcement = Announcement.create!(:body => 'hello')
    announcement.already_seen_by << user
    announcement.save!

    Announcement.current_for_user(user).should be_nil
  end

  context "if already seen by user and there are more than one announcements unseen" do
    before { @user = User.create! }

    it "should return the latest unseen announcement" do

      a = Announcement.create!(:body => 'hello')

      announcement = Announcement.create!(:body => 'hello')
      announcement.already_seen_by << @user
      announcement.save!

      Announcement.current_for_user(@user).exists?.should be_true
      Announcement.current_for_user(@user).should == a
    end
  end

  def create_announcement(attributes)
    announcement = Announcement.new
    attributes.each do |key, value|
      announcement.send("#{key}=", value)
    end
    announcement.save!
    announcement
  end
end
