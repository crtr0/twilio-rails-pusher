module Webhookable
	extend ActiveSupport::Concern

	def render_twiml(response)
      render text: response.text, content_type: 'text/xml'
	end

end