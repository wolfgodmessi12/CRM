# frozen_string_literal: true

# app/presenters/integrations/fieldpulse/v1/import_contacts/presenter.rb
module Integrations
  module Fieldpulse
    module V1
      module ImportContacts
        class Presenter < Integrations::Fieldpulse::V1::Presenter
          attr_accessor :event
          attr_reader :client_api_integration_offices

          # Integrations::Fieldpulse::V1::ImportContacts::Presenter.new(client_api_integration: @client_api_integration)
          #   (req) client_api_integration: (ClientApiIntegration) or (Integer)

          def initialize(args = {})
            super

            @client_api_integration_offices = @client.client_api_integrations.find_by(target: 'fieldpulse', name: 'offices')
            @office_options_for_select      = nil
          end

          def contact_imports_remaining_string(user_id)
            Integration::Fieldpulse::V1::Base.new(@client_api_integration).import_contacts_remaining_string(user_id)
          end

          def offices_for_select
            @office_options_for_select ||= @fr_model.offices&.map { |office| [office[:officeName], office[:officeID]] }&.sort
          end
        end
      end
    end
  end
end