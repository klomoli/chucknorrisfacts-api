module MailServices
  class SendResults < ApplicationService
    attr_reader :results
    attr_reader :email

    def initialize(search,email)
      @search = search
      @email = email
    end

    def call
      SearchsNotifierMailer.send_search_email(@email,@search).deliver
    end
  end
end
