defmodule TsbankWeb.Router do
  use TsbankWeb, :router

  use Plug.ErrorHandler

  def handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  def handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{errors: message}) |> halt()
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TsbankWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :auth do
    plug TsbankWeb.Auth.Pipeline

    plug TsbankWeb.Auth.SetAccount

  end

  pipeline :ass do
    plug TsbankWeb.Auth.Pipeline
    plug TsbankWeb.Auth.SetCustomer
  end

  scope "/api/v1", TsbankWeb do
    pipe_through :api

    get "/", PageController, :home

    post "/customers/create", UserController, :create
    post "/customers/login", UserController, :sign_in

  end

  # For protected endpoints
  scope "/api/v1", TsbankWeb do
    pipe_through [:api, :auth ]

    post "/accounts", AccountController, :create
    post "/accounts/:account_id/deposit", TransactionController, :create
    post "/accounts/:account_id/withdraw", TransactionController, :remove_money
    get "/customers/:customer_id/accounts", AccountController, :all_accounts
    get "/customers/accounts/all", AccountController, :all_accounts_customer
    get "/accounts/:account_id", AccountController, :view_spec_acc
    post "/admin/create", UserController, :create_admin
    patch "/accounts/:account_id/update", AccountController, :update_status

  end


  if Application.compile_env(:tsbank, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TsbankWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
