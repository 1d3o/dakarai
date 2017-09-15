Rails.application.routes.draw do
  post 'api/authentication/confirm_email', to: 'api/authentication#confirm_email', as: 'api_authentication_confirm_email'
  post 'api/authentication/signup', to: 'api/authentication#signup', as: 'api_authentication_signup'
  post 'api/authentication/login', to: 'api/authentication#login', as: 'api_authentication_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
