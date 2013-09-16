Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :banks, :except => [:show, :destroy] do
      put :toggle_activation, :on => :member
    end
  end
end
