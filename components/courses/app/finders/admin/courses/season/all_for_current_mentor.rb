module Admin
  module Courses
    module Season
      class AllForCurrentMentor < ApplicationFinder
        def initialize(current_user)
          @user = current_user
        end

        def call
          ::Courses::Season.joins(:mentors)
                           .where(season_mentors: {user_id: @user.id} )
        end
      end
    end
  end
end