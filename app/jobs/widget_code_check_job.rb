class WidgetCodeCheckJob < ActiveJob::Base
  queue_as :active_jobs_default

  def perform(widget_id)
    widget = Widget.find params[:id]
    code_to_check = "getreview.ru/widget/widget.js?gr_widget_code=#{widget.uid}"

    if widget.site_url
      check_success = Net::HTTP.get(URI.parse(widget.site_url)).include? code_to_check
      widget.code_set = true
      widget.save
    end
  end
end