# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      #resources :shortenedlink
      put  '/shortyl/:id', to: 'shortenedlink#update', id: %r{[^/]+}
      get  '/shortyl/:id', to: 'shortenedlink#show', id: %r{[^/]+}
      post '/shortyl/', to: 'shortenedlink#index'
    end
  end
end
