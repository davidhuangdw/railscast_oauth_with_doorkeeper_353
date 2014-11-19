module Api
  module V1
    class TasksController < BaseController
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
    end
  end
end