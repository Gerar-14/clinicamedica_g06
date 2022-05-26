Rails.application.routes.draw do
  resources :value_references
  resources :ordens
  resources :laboratory_workers
  resources :muestras
  resources :orden_type_exams
  resources :area_type_exams
  resources :type_exam_parametros
  resources :type_exams
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
  resources :laboratorios
  resources :empleados
  resources :parametros
  resources :unidad_medidas
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
  get 'nav', to: "home#nav", as: :nav
  get 'acceso_denegado', to: "acceso_denegado#acceso_denegado", as: :denegado
  root to: "home#index"
  Rails.application.routes.draw do
    match "/404", to: "errors#not_found", via: :all
    match "/500", to: "errors#internal_server_error", via: :all
  end
    
end