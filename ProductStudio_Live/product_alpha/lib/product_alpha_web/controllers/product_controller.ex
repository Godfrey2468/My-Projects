defmodule ProductAlphaWeb.ProductController do
  use ProductAlphaWeb, :controller

  import Plug.Conn

  alias ProductAlpha.Interaccounts.Interaccount
  alias ProductAlpha.Interaccounts

  alias ProductAlpha.Products
  alias ProductAlpha.Products.Product

  alias ProductAlpha.Providers
  alias ProductAlpha.Providers.Provider

  alias ProductAlpha.Policies.Threshold
  alias ProductAlpha.Policies



  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false

  alias ProductAlpha.Repo



  def index(conn, _params) do
    products = Products.list_products()
    render(conn, :index, products: products)
  end

  def new(conn, _params) do
    changeset = Products.change_product(%Product{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"product" => product_params}) do
    #provider_params = []
    # {:ok, %Interaccount{} = interaccount}  <- IO.inspect(Interaccounts.create_interaccount(product, %{"Inter-account transfer specification" => %{}})),
   # {:ok, %Threshold{} = threshold}  <- IO.inspect(Policies.create_threshold(product, %{"threshold" => %{}})) do
     provider_params = %{"Service Provider" => []}
    # %{"Service Provider" => []}
    with {:ok, %Product{} = product} <-  Products.create_product(product_params),
   # {:ok, %Provider{} = provider}  <- IO.inspect(Providers.create_provider(product,provider_params )),
    {:ok, _}  <- IO.inspect(create_serviceprovider(product, product.id)),
    {:ok, _}  <- IO.inspect(create_interacctount(product, product.id)),
    {:ok, _}  <- IO.inspect(create_thresholdPolicy(product, product.id)),
    {:ok, _}  <- IO.inspect(create_triggerPolicy(product, product.id)),
    {:ok, _}  <- IO.inspect(create_policystatePolicy(product, product.id)),
    {:ok, _}  <- IO.inspect(create_intialservicePolicy(product, product.id)),
    {:ok, _}  <- IO.inspect(create_addwallet(product, product.id)),
    {:ok, _}  <- IO.inspect(create_baseprice(product, product.id)),
    {:ok, _}  <- IO.inspect(create_subcriptionbill(product, product.id)),
    {:ok, _}  <- IO.inspect(create_discounts(product, product.id)),
    {:ok, _}  <- IO.inspect(create_consumptions(product, product.id)),
    {:ok, _}  <- IO.inspect(create_specification(product, product.id)),
    {:ok, _}  <- IO.inspect(create_notificaions(product, product.id)),
    {:ok, _}  <- IO.inspect(create_resources(product, product.id)),
    {:ok, _}  <- IO.inspect(create_defaultrec(product, product.id)),
    {:ok, _}  <- IO.inspect(create_smsmap(product, product.id)),
    {:ok, _}  <- IO.inspect(create_datamap(product, product.id)),
    {:ok, _}  <- IO.inspect(create_voicemap(product, product.id)),
    {:ok, _}  <- IO.inspect(create_defaultmap(product, product.id)) do
  #  case Products.create_product(product_params) do
    #  {:ok, product} ->
        conn
        |> put_flash(:info, "Product created successfully.")
        |> redirect(to: ~p"/products")

      # {:error, %Ecto.Changeset{} = changeset} ->
      #   render(conn, :new, changeset: changeset)
    end
  end

  defp create_serviceprovider(product, id) do
    datab = %{"Service Provider" => []}

    Ecto.build_assoc(product, :provider)
    %ProductAlpha.Providers.Provider{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()

  end

  defp create_interacctount(product, id) do
    datab = %{"Inter-account transfer specification" => %{}}

    Ecto.build_assoc(product, :interaccount)
    %ProductAlpha.Interaccounts.Interaccount{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()

  end

  defp create_thresholdPolicy(product, id) do
    datab = %{"threshold" => %{}}

    Ecto.build_assoc(product, :threshold)
    %ProductAlpha.Policies.Threshold{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_triggerPolicy(product, id) do
    datab = %{"triggers" => []}

    Ecto.build_assoc(product, :trigger)
    %ProductAlpha.Policies.Trigger{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_policystatePolicy(product, id) do
    datab = %{"policy_states" => []}

    Ecto.build_assoc(product, :policystate)
    %ProductAlpha.Policies.Policystate{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_intialservicePolicy(product, id) do
    datab = %{"initial_service_policy" => %{}}

    Ecto.build_assoc(product, :intialservice)
    %ProductAlpha.Policies.Intialservice{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end



  defp create_addwallet(product, id) do
    datab = %{"additional wallet configuration" => []}

    Ecto.build_assoc(product, :wallet)
    %ProductAlpha.Productprice.Wallet{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  # has_many :subscription, ProductAlpha.Productprice.Subscription
  # has_many :baseprice,ProductAlpha.Productprice.Baseprice
  # has_many :consumption,ProductAlpha.Productprice.Consumption
  # has_many :discount, ProductAlpha.Productprice.Discount
  # has_many :wallet, ProductAlpha.Productprice.Wallet

  defp create_baseprice(product, id) do
    datab = %{"Base price" => %{}}

    Ecto.build_assoc(product, :baseprice)
    %ProductAlpha.Productprice.Baseprice{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_subcriptionbill(product, id) do
    datab = %{"Subscription billing" => []}

    Ecto.build_assoc(product, :subscription)
    %ProductAlpha.Productprice.Subscription{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_discounts(product, id) do
    datab = %{"Discounts" => []}

    Ecto.build_assoc(product, :discount)
    %ProductAlpha.Productprice.Discount{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_consumptions(product, id) do
    datab = %{"Consumption billing" => %{}}

    Ecto.build_assoc(product, :consumption)
    %ProductAlpha.Productprice.Consumption{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_specification(product, id) do
    datab = %{"Specification" => %{}}

    Ecto.build_assoc(product, :specification)
    %ProductAlpha.Network.Specification{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_notificaions(product, id) do
    datab = %{"Notification" => %{}}

    Ecto.build_assoc(product, :notification)
    %ProductAlpha.Network.Notification{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_resources(product, id) do
    datab = %{"Resources" => %{}}

    Ecto.build_assoc(product, :resource)
    %ProductAlpha.Network.Resource{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_defaultrec(product, id) do
    datab = %{"Default" => %{}}

    Ecto.build_assoc(product, :defaultrec)
    %ProductAlpha.Recharge.Defaultrec{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_smsmap(product, id) do
    datab = %{"sms_mappings" => %{}}

    Ecto.build_assoc(product, :smsmap)
    %ProductAlpha.Recharge.Smsmap{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_datamap(product, id) do
    datab = %{"data_mappings" => %{}}

    Ecto.build_assoc(product, :datamap)
    %ProductAlpha.Recharge.Datamap{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end

  defp create_voicemap(product, id) do
    datab = %{"voice_mappings" => %{}}

    Ecto.build_assoc(product, :voicemap)
    %ProductAlpha.Recharge.Voicemap{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end


  defp create_defaultmap(product, id) do
    datab = %{"default_mappings" => %{}}

    Ecto.build_assoc(product, :defaultmap)
    %ProductAlpha.Recharge.Defaultmap{}
    |> Ecto.Changeset.change(product_id: id,datab: datab)
    |> Repo.insert()
  end



  def show(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    IO.inspect(product.id)
    conn
    |> put_session(:product_id, IO.inspect(id))
    |> redirect(to: ~p"/j/sp")
   # |> render(:show, product: product)
  end

  def edit(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    changeset = Products.change_product(product)
    render(conn, :edit, product: product, changeset: changeset)
  end

  def update(conn, %{"id" => id, "product" => product_params}) do
    product = Products.get_product!(id)

    case Products.update_product(product, product_params) do
      {:ok, product} ->
        conn
        |> put_flash(:info, "Product updated successfully.")
        |> redirect(to: ~p"/products/#{product}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, product: product, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    product = Products.get_product!(id)
    {:ok, _product} = Products.delete_product(product)

    conn
    |> put_flash(:info, "Product deleted successfully.")
    |> redirect(to: ~p"/products")
  end
end
