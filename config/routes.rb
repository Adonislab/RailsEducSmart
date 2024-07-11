Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :courses, defaults: { format: :json }
  resources :categories, defaults: { format: :json }
  resources :evaluations, defaults: { format: :json }
  resources :course_details, defaults: { format: :json }
  resources :plannings, defaults: { format: :json }
  resources :order_claims, defaults: { format: :json }
end
