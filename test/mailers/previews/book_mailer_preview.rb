# Preview all emails at http://localhost:3000/rails/mailers/book_mailer
class BookMailerPreview < ActionMailer::Preview
  def create_book_email
    BookMailer.with(
      user: User.first,
      book_title: 'The title of book'
    ).create_book_email
  end
end
