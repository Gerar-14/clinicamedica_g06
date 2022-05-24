Rails.application.routes.draw do
  resources :departamentos
  resources :countries
  resources :menu_permisos
  resources :accesos
  resources :permisos
  resources :rol_empleados
  resources :menu_rols
  resources :rols
  resources :menus
  resources :resultados
  resources :muestras
  resources :orden_tipo_examen
  resources :ordens
  resources :laboratorista
  resources :laboratorios
  resources :empleados
  resources :tipo_examen_parametros
  resources :valor_referencia
  resources :parametros
  resources :unidad_medidas
  resources :area_tipo_examen
  resources :tipo_examen
  resources :areas
  resources :pacientes
  resources :tipo_sangres
  resources :municipios
  devise_for :users, :controllers => {:registrations => "registrations"}
  # devise_for :users do
    # get '/users/sign_out' => 'devise/sessions#destroy'
  # end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # root to: "home#index"
  get 'home', to: "home#index", as: :home
  get 'acceso_denegado', to: "acceso_denegado#acceso_denegado", as: :denegado
  root to: "home#index"
  
end
