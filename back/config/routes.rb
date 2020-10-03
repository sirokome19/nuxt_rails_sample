Rails.application.routes.draw do
  resources :users
  resources :make_questions
  resources :answer_questions
end
