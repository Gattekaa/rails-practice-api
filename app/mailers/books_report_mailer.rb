require "json"

class BooksReportMailer < ApplicationMailer
  default from: "notificacoes@exemplo.com"

  def report_email
    puts params
    @books = JSON.parse(params[:report].data)
    mail(to: "user@gmail.com", subject: "Books Report")
  end
end
