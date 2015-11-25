Rails.application.routes.draw do


  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :pages , only: [:index, :create] do
    get :contact_us, on: :collection
    get :contact_alert, on: :collection
    get :for_men, on: :collection
    get :for_women, on: :collection
    get :about_us, on: :collection
  end

	resources :home , only: [:index, :destroy, :update, :create] do
		get :profile, on: :collection
    get :new_leave_application, on: :collection
    get :leave_applictions, on: :collection
    get :feedback, on: :collection
    get :all_feedbacks, on: :collection
	end

  resources :leave_applications , only: [:create, :update, :show, :index] do
    get :new_leave_application, on: :collection
    get :all_leave_applications, on: :collection
    get :history_application, on: :collection
    get :applied_leaves, on: :collection
  end

	resources :orders , only: [:create, :show, :update, :destroy]do
		get :new_order, on: :collection
		get :orders_list, on: :collection
		patch :in_progress, on: :collection
		get :in_progress_orders, on: :collection
		get :completed_orders, on: :collection
		get :delivered_orders, on: :collection
	end

  resources :sessions, only:[:new, :create]do
    get :destroy, on: :collection
  end

  resources :stock, only: [:update, :create, :show, :destroy] do
    get :all_stock, on: :collection
    get :add_new, on: :collection
  end

  resources :invoice, only: [:create, :index, :update, :show] do
    get :new_invoice, on: :collection
    get :all_invoices, on: :collection
    get :invoice_history, on: :collection
  end

  resources :gatepass, only: [:create, :index] do
    get :new_gatepass, on: :collection
  end

  resources :reporting, only: [:index] do
    get :expense, on: :collection
    get :expenses_history, on: :collection
    get :sales, on: :collection
    get :sales_history, on: :collection
    get :payroll, on: :collection
    get :payrol_history, on: :collection
    get :orders, on: :collection
    get :orders_history, on: :collection
    get :invoices, on: :collection
    get :invoice_history, on: :collection
    get :gatepass, on: :collection
    get :gatepass_history, on: :collection
    get :enquire, on: :collection
    get :leave_application, on: :collection
    get :unpaid_orders, on: :collection
    get :paid_orders, on: :collection
  end
  
  resources :attachments

  root 'pages#index'
  # get 'switch_user' => 'switch_user#set_current_user'
  # get '*path' => redirect('/')

end
