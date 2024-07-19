Rails.application.routes.draw do
 devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :courses, defaults: { format: :json }
  resources :appreciations, defaults: { format: :json }
  resources :reclamations, defaults: { format: :json }
end
