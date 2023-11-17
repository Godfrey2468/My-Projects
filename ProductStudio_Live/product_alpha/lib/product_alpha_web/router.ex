defmodule ProductAlphaWeb.Router do
  use ProductAlphaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {ProductAlphaWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end


  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :authur do
    plug ProductAlphaWeb.Auth.SetProduct
  end


  scope "/", ProductAlphaWeb do
    pipe_through :browser

    # get "/", PageController, :home

    # post "/customers/create", UserController, :create
    # post "/customers/login", UserController, :sign_in


    resources "/products", ProductController


  end


  scope "/j", ProductAlphaWeb do
    pipe_through [:browser, :authur]

    get "/", PageController, :home


    live "/productsss", ProductsLive
    live "/mags", SvelteproLive
    live "/arr", ArrLive
    live "/wallet", WalletLive
    live "/pol", PolicyLive
    live "/sp", ServiceproviderLive
    live "/ns", NetworkresourceLive
    live "/rs", RechargespecLive
    live "/ia", InteraccountLive
    live "/pr", ProductpriceLive

    # Product Price
    live "/add", AdditionalwalletLive
    live "/br", BasepriceLive
    live "/sub", SubscriptionbillLive
    live "/dis", DiscountsLive
    live  "/con", ConsumptionbillLive

    # Recharge specification
    live "/res", DefaultrecLive
    live "/res/sms", SmsmapLive
    live "/res/data", DatamapLive
    live "/res/voice", VoicemapLive
    live "/res/default", DefaultmapLive

    # Policies
    live "/tre", ThresholdLive
    live "/triggers", TriggersLive
    live "/polstate", PolicystateLive
    live "/intservice", IntialserviceLive

    # Network resources
    live "/spec", SpecificationLive
    live "/not", NotificationLive
    live "/resource", ResourcesLive


    live "/tes", TestdashLive

    live "/sing", SingleLive

    live "/sd", SpaLive

    live "/sad", HjLive

  end

  # Other scopes may use custom stacks.
  # scope "/api", ProductAlphaWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:product_alpha, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ProductAlphaWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
