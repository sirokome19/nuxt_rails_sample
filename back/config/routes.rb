Rails.application.routes.draw do
  post "/upload/", to: "util#upload"
  resources :users
  resources :questionnaires
  resources :answer_sheets
end
