class GenerateBooksReportJob < ApplicationJob
  queue_as :default

  def perform(current_user)
    books = current_user.books.take(10)

    # puts "Sleeping for 10 seconds"
    # sleep 10
    # puts "Woke up from sleep"

    books_report = Booksreport.create!(user: current_user, data: books.to_json)


    if books_report.persisted?
      puts "Books report generated successfully"
      BooksReportMailer.with(report: books_report).report_email.deliver_now
    else
      puts books_report.errors.full_messages
    end
  end
end
