# frozen_string_literal: true

# app/controllers/integrations/jobber/v20231115/push_contacts_controller.rb
module Integrations
  module Jobber
    module V20231115
      class PushContactsController < Jobber::IntegrationsController
        # (GET) show push Contacts screen
        # /integrations/jobber/v20231115/push_contacts/edit
        # edit_integrations_jobber_v20231115_push_contacts_path
        # edit_integrations_jobber_v20231115_push_contacts_url
        def edit
          render partial: 'integrations/jobber/v20231115/js/show', locals: { cards: %w[push_contacts_edit] }
        end

        # (PATCH/PUT) update api_key
        # /integrations/jobber/v20231115/push_contacts
        # integrations_jobber_v20231115_push_contacts_path
        # integrations_jobber_v20231115_push_contacts_url
        def update
          @client_api_integration.update(push_contacts_tag_id: params_tag_id.dig(:customer, :tag_id).to_i)

          render partial: 'integrations/jobber/v20231115/js/show', locals: { cards: %w[push_contacts_edit] }
        end

        private

        def params_tag_id
          params.require(:push_leads).permit(customer: [:tag_id])
        end
      end
    end
  end
end