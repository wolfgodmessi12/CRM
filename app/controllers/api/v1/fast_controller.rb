# frozen_string_literal: true

# app/controllers/api/v1/fast_controller.rb
module Api
  module V1
    class FastController < ActionController::Metal
      include AbstractController::Callbacks
      include ActionController::Head
      include Doorkeeper::Rails::Helpers

      before_action :doorkeeper_authorize!

      def index
        self.response_body = { ok: true }.to_json
      end
    end
  end
end
