Rails.application.routes.draw do
  resources :users
  resources :questionnaires
  resources :answer_sheets
end
