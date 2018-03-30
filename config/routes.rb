Rails.application.routes.draw do

get '/questionnaire', to: 'questions#index', as: 'questionnaire'

post '/answer/index', to: 'answer#index'

get '/questions', to: 'answers#show', as: 'answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
