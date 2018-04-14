Rails.application.routes.draw do
    resources :notes, :except => :show do
        collection do
            post :confirm
            get :top
        end
    end
 end
