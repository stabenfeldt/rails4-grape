AllieroForms::Application.routes.draw do

  resources :changes

  resources :departments
  resources :attachments

  devise_for :users, :controllers => {
    #passwords:          'users/passwords'
    #omniauth_callbacks: 'users/omniauth_callbacks',
    #confirmations:      'users/confirmations',
    #registrations:      'users/registrations'
  }

  mount API => '/'
  get "excel/export/:project_id" => 'excel#export', as: :export_excel

  get '/dagsrapport/:project_id/:profession_id/:overtime' => 'excel#dagsrapport', 
    as: :dagsrapport

  get '/projects/:id/hours_registered' => 'projects#hours_registered', as: :hours_registered
  resources :projects do
    resources :tasks, :controller => 'projects/tasks'
  end

  get '/timesheets' => 'excel#timesheets', as: :timesheets
  get '/timesheet/:project_id/:user_id' => 'excel#timesheet', as: :timesheet

  namespace :excel do
  end

  namespace :tasks do
    get :active
    get :report
  end

  get '/customers/search' => 'customers#search', as: :customer_search
  resources :customers do
    resources :projects, :controller => 'customers/projects'
    get :excel_report
  end

  resources :users do 
    get '/tasks/started'     => 'users/tasks#started'
    get '/tasks/not_started' => 'users/tasks#not_started'
    resources :tasks, :controller => 'users/tasks' do
      post :accept_task
      post :finished
      get :send_message
    end
    collection do
      post :add_user
    end
  end

  resources :hours_spents
  resources :hours_spent do
    resources :changes, :controller => 'hours_spent/changes'
  end
  resources :tasks do
    resources :hours_spents, :controller => 'tasks/hours_spent'
  end



  resources :task_types

  # The priority is based upon order of 
  # creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  get '/blog'  => 'static_pages#blog',  as: :blog
  get '/hms'   => 'static_pages#hms',   as: :hms
  get '/video' => 'static_pages#video', as: :video

  # You can have the root of your site routed with "root"
  root 'static_pages#blog'
  get '/manager' => 'static_pages#frontpage_manager', as: :frontpage_manager
  get '/worker'  => 'static_pages#frontpage_user', as: :frontpage_user
  get '/new_assignment' => 'static_pages#new_assignment', as: :new_assignment
  get '/sallery/:user_id/:project_id/'  => 'excel#sallery', as: :sallery_report


  get '/html_export/:user_id/:project_id/' => 'excel#html_export', as: :html_export

  get '/templates/:path' => 'templates#template',
    :constraints => { :path => /.+/  }  


end
