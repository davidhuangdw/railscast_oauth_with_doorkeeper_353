module Api
  module V1
    class TasksController < ApplicationController
      doorkeeper_for :index

      respond_to :json
      def index
        respond_with current_user.tasks
      end

      def create
        respond_with current_user.tasks.create(task_params)
      end

      private
      def task_params
        params.require(:task).permit(:name,:user_id)
      end
      def current_user
        @current_user ||= User.find(doorkeeper_token.resource_owner_id)
      end
    end
  end
end