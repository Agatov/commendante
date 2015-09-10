class EmailTemplate < ActiveRecord::Base
  belongs_to :widget

  def default_values
    self.subject = "{name}, оставьте отзыв о нашей компании!"
    self.body = ActionView::Base.new(Rails.configuration.paths['app/views']).render(
      partial: "account/email_templates/body_default",
      formats: [:html],
      handlers: [:erb]
    )
  end
end
