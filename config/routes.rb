Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # devise_for :customers
  namespace 'api', defaults: {format: :json} do
    namespace 'v1' do
      resources :drinks
      devise_for :customers,
                   # path: '',
                   # path_names: {
                   #   sign_in: 'login',
                   #   sign_out: 'logout',
                   #   registration: 'signup'
                   # },
                   controllers: {
                     sessions: 'api/v1/sessions',
                     registrations: 'api/v1/registrations'
                   }
    end
  end
end

