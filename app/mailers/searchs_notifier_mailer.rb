class SearchsNotifierMailer < ApplicationMailer
  default :from => 'chucknorrisfacts@example.com'

  def send_search_email(email,search_decorator)
    @email = email
    @search_decorator = search_decorator
    mail(:to => @email, :subject => I18n.t('subject_email'))
  end
end
