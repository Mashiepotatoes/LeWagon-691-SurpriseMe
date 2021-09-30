class BirthdaysController < ApplicationController
  def index
    @question = Question.first
    @response_sets = ResponseSet.where(user: current_user)
    @friend_list = Friendship.where(user: current_user,status: true)
    @upcomingbirthday = []
    @friend_list.each do |friendship|
      if (friendship.friend.birthday.yday - Date.today.yday).between?(0,7)
        @upcomingbirthday << friendship
      end
    end
  end
end
