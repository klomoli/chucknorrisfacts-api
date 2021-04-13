Rails.application.routes.draw do
  scope :api do 
    get 'searches/:limit/:offset/:filter' => "searches#index"
    get 'searches/:limit/:offset/' => "searches#index"
    get 'facts' => "searches#fetch_facts"
    post 'search/:id/email' => "searches#send_by_email"
  end
end
