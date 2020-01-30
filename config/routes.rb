# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      # resources :shortenedlink
      put  '/shortyl/*long_url', to: 'shortenedlink#update' # , id: %r{[^/]+}
      get  '/shortyl/:short_url', to: 'shortenedlink#show'
      post '/shortyl/', to: 'shortenedlink#index'
    end
  end
end
