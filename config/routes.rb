Rails.application.routes.draw do
  get 'page', to: 'hashpages#index'
  root 'fetchers#new'
  get ':id', to: 'fetchers#index'
  get ':id/about', to: 'fetchers#about'
  get ':id/contact', to: 'fetchers#contact'
  get ':id/:hashtag', to: 'fetchers#show', as: :hashtag # _dw TOM how can I call hashtag_path(h)
  resource :fetchers, except: [:show]
end
