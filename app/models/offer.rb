class Offer < ActiveRecord::Base
  belongs_to :widget

  before_create :apply_email_template

  def apply_email_template
    self.email_subject = widget.email_template.subject
    self.email_body = widget.email_template.body

    self.email_subject.gsub! "{name}", name
    self.email_subject.gsub! "{company_name}", widget.company_name

    self.email_body.gsub! "{name}", name
    self.email_body.gsub! "{company_name}", widget.company_name
    self.email_body.gsub! "{site_link}", "<a href = 'http://#{widget.site_url}'>#{widget.site_url}</a>"
    self.email_body.gsub! "{url}", "<a href = 'http://getreview.ru/#{widget.board_url}'>getreview.ru/#{widget.board_url}</a>"
    self.email_body.gsub! "{button}", 
      "<table><tr><td class = 'padding'>
        <p><a class = 'btn-primary' href = 'http://getreview.ru/#{widget.board_url}'>Оставить отзыв</a></p>
      </td></tr></table>"
  end
end
