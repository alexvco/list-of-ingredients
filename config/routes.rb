Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace 'api', defaults: {format: :json} do
    namespace 'v1' do
      resources :drinks
    end
  end
end
