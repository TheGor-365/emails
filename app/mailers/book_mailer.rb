class BookMailer < ApplicationMailer
  def create_book_email
    @user = params[:user]
    @book_title = params[:book_title]

    mail(
      subject: "A book has been successfully created",
      to: email_address_with_name(@user.email, @user.name),
      # template_path: %w(books books_mailer books_email),
      # template_name: 'welcome_book_email'
    )
  end
end
