Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :banks, except: [:show, :destroy] do
      put :toggle_activation, on: :member
    end
  end
  resources :payments, only: :update
  get '/content/bank_transfer', to: 'content#bank_transfer', as: :bank_transfer_instructions
end
