Rails.application.routes.draw do
  resources :schedules
  post '/schedules/new', to:'schedules#create'
  post '/schedules/:id/edit', to:'schedules#update'
end
