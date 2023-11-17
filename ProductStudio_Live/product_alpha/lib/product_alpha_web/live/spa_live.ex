defmodule ProductAlphaWeb.SpaLive do
  use ProductAlphaWeb, :live_view
  alias Phoenix.LiveView.JS

    import Ecto.Query, warn: false
    import Ecto.Repo, warn: false

    alias ProductAlpha.Productprice.Baseprice
   alias ProductAlpha.Productprice.Wallet
   alias ProductAlpha.Repo
   alias ProductAlpha.Products



def mount(_params, session, socket) do
  ref_schema = schema("GER")
  ref_schema1 = schema1("GER")
  ref_schema2 = schema2("GER")
  ref_schema3 = schema3("GER")
  ref_schema4 = schema4("GER")
  ref_schema5 = schema5("GER")
  ref_schema6 = schema6("GER")
  ref_schema7 = schema7("GER")
  ref_schema8 = schema8("GER")
  ref_schema14 = schema14("GER")


  session_id = session["product_id"]


  hata = Products.get_product!(session_id)
  IO.inspect(hata.name)

    {:ok, assign(socket, tab: "one",ref_schema: ref_schema, ref_schema1: ref_schema1, ref_schema2: ref_schema2,ref_schema3: ref_schema3,ref_schema4: ref_schema4,ref_schema5: ref_schema5,ref_schema6: ref_schema6,ref_schema7: ref_schema7,ref_schema8: ref_schema8,prod_id: session_id, prodname: hata.name)}
end

def handle_event("switch_tab", %{"tab" => tab}, socket) do
    {:noreply, assign(socket, tab: tab)}
end

def tab_one(assigns) do
    ~H"""
    <%!-- <p id="one">tab one displayed</p> --%>
    <div id="one">
    <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Product Price</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">wallet</span>
      </div>
    </li>
  </ol>
</nav>

    <div id="json-schema-form" phx-hook="AdditionalwalletV1" />
    <button
      id="json-schema-form-submit"
      type="submit"
    >
      Save
    </button>
    </div>
    """
  end
def tab_two(assigns) do
    ~H"""
    <div id="two">
    <nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Product Price</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">base price</span>
      </div>
    </li>
  </ol>
</nav>

  <div id="json-schema-form1" phx-hook="BasepriceV2" />
    <button
      id="json-schema-form-submit1"
      type="submit"
    >
      Save
    </button>
    </div>
    <%!-- <p id="two">tab two displayed</p> --%>
    """
  end

  # subcription billing
 def tab_three(assigns) do
     ~H"""
     <%!-- <p id="three">tab three displayed</p> --%>
     <div id="three">
     <!-- Breadcrumb -->
      <nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Product Price</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">subscriptionbill</span>
      </div>
    </li>
  </ol>
</nav>



<div id="json-schema-form2" phx-hook="SubcriptionbillV2" />
    <button
      id="json-schema-form-submit2"
      type="submit"
    >
      Save
    </button>
     </div>
     """
 end

 def tab_four(assigns) do
  ~H"""
  <%!-- <p id="three">tab three displayed</p> --%>
  <div id="four">
  <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Product Price</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">Discounts</span>
      </div>
    </li>
  </ol>
</nav>


<div id="json-schema-form3" phx-hook="DiscountsV2" />
    <button
      id="json-schema-form-submit3"
      type="submit"
    >
      Save
    </button>


  </div>
  """
end

 def tab_five(assigns) do
  ~H"""
  <div id="five">
  <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Product Price</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">consumption</span>
      </div>
    </li>
  </ol>
</nav>



<div id="json-schema-form4" phx-hook="ConsumptionbillV2" />
    <button
      id="json-schema-form-submit4"
      type="submit"
    >
      Save
    </button>

  </div>
  <%!-- <p id="three">tab three displayed</p> --%>
  """
end

 def tab_six(assigns) do
  ~H"""
  <div id="six">
  <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Network Resource</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">specification</span>
      </div>
    </li>
  </ol>
</nav>



<div id="json-schema-form5" phx-hook="SpecificationV2" />
    <button
      id="json-schema-form-submit5"
      type="submit"
    >
      Save
    </button>


  </div>
  <%!-- <p id="three">tab three displayed</p> --%>
  """
end

 def tab_seven(assigns) do
  ~H"""
  <div id="seven">
  <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Network Resource</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">Notification</span>
      </div>
    </li>
  </ol>
</nav>

<div id="json-schema-form6" phx-hook="NotificationV2" />
    <button
      id="json-schema-form-submit6"
      type="submit"
    >
      Save
    </button>

  </div>
  <%!-- <p id="three">tab three displayed</p> --%>
  """
end

 def tab_eight(assigns) do
  ~H"""
  <div id="eight">
  <!-- Breadcrumb -->
<nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>
    <li>
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <a href="#" class="ml-1 text-sm font-medium text-gray-700 hover:text-blue-600 md:ml-2 dark:text-gray-400 dark:hover:text-white">Network Resource</a>
      </div>
    </li>
    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">resource</span>
      </div>
    </li>
  </ol>
</nav>

<div id="json-schema-form7" phx-hook="ResourcesV2" />
    <button
      id="json-schema-form-submit7"
      type="submit"
    >
      Save
    </button>

  </div>
  <%!-- <p id="three">tab three displayed</p> --%>
  """
end

 def tab_nine(assigns) do
  ~H"""
  <div class="nine">
  <nav class="flex mb-2 ml-auto" aria-label="Breadcrumb">
                <ol class="inline-flex items-center space-x-1 text-sm font-medium md:space-x-2">
                  <li class="inline-flex items-center">
                    <.link navigate={~p"/products"} class="inline-flex items-center text-gray-700 hover:text-primary-600 dark:text-gray-300 dark:hover:text-white">
                      <svg class="w-5 h-5 mr-2.5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                      Home
                    </.link>
                  </li>

                  <li>
                    <div class="flex items-center">
                      <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                      <span class="ml-1 text-gray-400 md:ml-2 dark:text-gray-500" aria-current="page">service provider </span>
                    </div>
                  </li>
                </ol>
            </nav>

            <div id="json-schema-form8" phx-hook="ServiceprovV2"  />
  <button
    id="json-schema-form-submit8"
    type="submit"
  >
    Save
  </button>


  </div>
  <%!-- <p id="three">tab three displayed</p> --%>
  """
end

  def tab_fourteen(assigns) do
   ~H"""
   <div id="fourteen">
   <%!-- <p id="three">tab three displayed</p> --%>
   <nav class="flex px-1 py-1 text-gray-700 border border-gray-100 rounded-lg bg-gray-50 dark:bg-gray-800 dark:border-gray-700" aria-label="Breadcrumb">
  <ol class="inline-flex items-center space-x-1 md:space-x-3">
    <li class="inline-flex items-center">
      <.link navigate={~p"/products"}  class="inline-flex items-center text-sm font-medium text-gray-700 hover:text-blue-600 dark:text-gray-400 dark:hover:text-white">
        <svg class="w-3 h-3 mr-2.5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
          <path d="m19.707 9.293-2-2-7-7a1 1 0 0 0-1.414 0l-7 7-2 2a1 1 0 0 0 1.414 1.414L2 10.414V18a2 2 0 0 0 2 2h3a1 1 0 0 0 1-1v-4a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v4a1 1 0 0 0 1 1h3a2 2 0 0 0 2-2v-7.586l.293.293a1 1 0 0 0 1.414-1.414Z"/>
        </svg>
        Home
      </.link>
    </li>

    <li aria-current="page">
      <div class="flex items-center">
        <svg class="w-3 h-3 mx-1 text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 6 10">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 9 4-4-4-4"/>
        </svg>
        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2 dark:text-gray-400">Inter account</span>
      </div>
    </li>
  </ol>
</nav>


<div id="json-schema-form14" phx-hook="InteraccountV2" />
  <button
    id="json-schema-form-submit14"
    type="submit"
  >
    Save
  </button>
   </div>
   """

end

  def tab_twenty(assigns) do
   ~H"""
 <!DOCTYPE html>
<html>
<head>
    <title>JSON Transformer</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }

        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            resize: vertical;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 20px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>JSON Transformer</h1>
        <div>
            <label for="jsonInput">Enter Logical JSON:</label>
            <textarea id="jsonInput" rows="10" cols="40"></textarea>
        </div>






        <div>
            <label for="transformedOutput">Transformed Physical JSON:</label>
            <textarea id="transformedOutput" rows="10" cols="40" readonly></textarea>
        </div>

        <button id="transformButton">Transform JSON</button>
        <%!-- <button id="transformButton">Download</button> --%>
        <button id="downloadButton" disabled>Download JSON</button>

    </div>

    <script>
        // Get references to the input and output elements
        const jsonInput = document.getElementById('jsonInput');
        const transformedOutput = document.getElementById('transformedOutput');
        const transformButton = document.getElementById('transformButton');

        // Add an event listener to the "Transform JSON" button
        transformButton.addEventListener('click', function () {
            try {
                // Parse the JSON from the input
                const inputJson = JSON.parse(jsonInput.value);
                // const inputJson1 = JSON.parse(jsonInput1.value);

                // Perform your transformation here
                const transformedJson = transformJson(inputJson);
                // const transformedJson1 = transformJson1(inputJson1);

                // Display the transformed JSON in the output textarea
                transformedOutput.value = JSON.stringify(transformedJson, null, 2);
                // transformedOutput1.value = JSON.stringify(transformedJson1, null, 2);
            } catch (error) {
                // Handle JSON parsing errors
                transformedOutput.value = 'Invalid JSON: ' + error;
            }
        });



        // Example transformation function
        function transformJson(inputJson) {
          const outputJson = {
          "service": {
          "cc": [inputJson["Network Resource Specification"]["cc"]],
          "ims": inputJson["Network Resource Specification"]["ims"],
          "mcc": [inputJson["Network Resource Specification"]["mcc"]],
          "mnc": [inputJson["Network Resource Specification"]["mnc"]],
          "ndc": [inputJson["Network Resource Specification"]["ndc"]],
          "tpl": inputJson["Network Resource Specification"]["tpl"],
          "vobb": inputJson["Network Resource Specification"]["vobb"],
          "hlrsn": inputJson["Network Resource Specification"]["hlrsn"],
          "sicap": inputJson["Network Resource Specification"]["sicap"],
          "access": inputJson["Network Resource Specification"]["access"],
          "simota": inputJson["Network Resource Specification"]["simota"],
          "srvName": inputJson["Network Resource Specification"]["srvName"],
          "usrState": inputJson["Network Resource Specification"]["usrState"],
          "ims_voice": inputJson["Network Resource Specification"]["ims_voice"],
          "snPatterns": [inputJson["Network Resource Specification"]["snPatterns"]],
          "usrExAttr1": inputJson["Network Resource Specification"]["usrExAttr1"],
          "vobb_realm": inputJson["Network Resource Specification"]["vobb_realm"],
          "ims_srvName": inputJson["Network Resource Specification"]["ims_srvName"],
          "ims_template": inputJson["Network Resource Specification"]["ims_template"],
          "usrIdentifier": inputJson["Network Resource Specification"]["usrIdentifier"],
          "usrSubNetType": inputJson["Network Resource Specification"]["usrSubNetType"],
          "password_prefix": inputJson["Network Resource Specification"]["password_prefix"],
          "password_suffix": inputJson["Network Resource Specification"]["password_suffix"],
          "simota_base_url": inputJson["Network Resource Specification"]["simota_base_url"],
          "ims_pgw_endpoint": inputJson["Network Resource Specification"]["ims_pgw_endpoint"],
          "srvStartDateTime": inputJson["Network Resource Specification"]["srvStartDateTime"],
          "usrBillCycleDate": inputJson["Network Resource Specification"]["usrBillCycleDate"],
          "password_gen_method": inputJson["Network Resource Specification"]["password_gen_method"],
          "ims_pgw_endpoint_pass": inputJson["Network Resource Specification"]["ims_pgw_endpoint_pass"],
          "ims_pgw_endpoint_user": inputJson["Network Resource Specification"]["ims_pgw_endpoint_user"],
          "network_service_names": [inputJson["Network Resource Specification"]["network_service_names"]]
  }
};

            return outputJson;




        }




    </script>
</body>
</html>
   """
 end



#  def tab_three(assigns) do
#   ~H"""
#   <p id="three">tab three displayed</p>
#   """
# end











  def handle_event("load-schema", %{"code" => code}, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ko = Jason.encode!(schema(code))
    ll = get_wallet_id(ref_prodid)
    IO.inspect(ll.datab)
     #,additional: startwallet()
    {:reply, %{schema: schema(code)}, socket}
  end


  def handle_event("submit", params, socket) do
    ref_prodid = IO.inspect(socket.assigns.prod_id)
    ref_schema = socket.assigns.ref_schema
    IO.inspect(params)

    case ExJsonSchema.Validator.validate(ref_schema, params) do
      :ok ->

        {:ok, _updated_policy} = update_wallet(ref_prodid, params)
        {:noreply, put_flash(socket, :info, "Success!")}

      {:error, _errors} ->
        {:noreply, put_flash(socket, :error, "Errors!")}
    end
  end

  def update_wallet(product_id, updated_data) do
    service = get_wallet_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
    IO.inspect(service)
    |> Ecto.Changeset.change(datab: updated_data)
    |> Repo.update()
  end

  def get_service(product_id) do
    Repo.get(ProductAlpha.Providers.Provider,product_id)
    # hata.data
  end

  def get_wallet_id(product_id) do
    ProductAlpha.Productprice.Wallet # our scema file
    |> where(product_id: ^product_id)
    # basically is for returning user data wtogether with account
    |> preload([:product]) # this bcs of the relationship between the two
    |> Repo.one()
  end




  def startwallet() do
    %{

        "Inter-account transfer specification" => %{
          "allowed_services" => ["data", "voice", "sms", "primary"],
          "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
          "destination" => true,
          "enabled" => true,
          "policy_name" => "MASTER_POLICY",
          "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
          "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
          "source" => true,
          "valid_dst_policy_statuses" => ["High Speed"],
          "valid_dst_service_statuses" => [0],
          "valid_src_policy_statuses" => ["High Speed"],
          "valid_src_service_statuses" => [0],
          "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

      }



    }
  end
  defp schema("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
  # "options": {
    # "collapsed": true
    # },
    %{
      "type" => "object",
      "title" => "Wallet Config",
      "options" => %{
        "disable_collapse" => true,
        "disable_properties" => true
      },
      "properties" => %{
          "additional wallet configuration" => %{
            "items" => %{
             "title" => "wallet",
              "properties" => %{
                "data0" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "meta" => %{
                      "properties" => %{"expiry" => %{"type" => "null"}},
                      "required" => ["expiry"],
                      "type" => "object"
                    },
                    "rules" => %{"items" => false, "type" => "array"},
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["meta", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 2
                },
                "data_sub" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "meta" => %{
                      "properties" => %{
                        "amount_at_last_topup" => %{"type" => "integer"},
                        "expiry" => %{"type" => "null"},
                        "trn" => %{
                          "items" => %{
                            "properties" => %{
                              "amount" => %{"type" => "integer"},
                              "inserted_at" => %{"format" => "date-time", "type" => "string"},
                              "name" => %{"type" => "string"},
                              "status" => %{"type" => "string"}
                            },
                            "required" => ["name", "amount", "status", "inserted_at"],
                            "type" => "object"
                          },
                          "type" => "array"
                        }
                      },
                      "required" => ["trn", "expiry", "amount_at_last_topup"],
                      "type" => "object"

                    },
                    "rules" => %{
                      "items" => %{
                        "properties" => %{
                          "auto_refill" => %{
                            "properties" => %{
                              "available" => %{"type" => "integer"},
                              "expiry" => %{"type" => "string"},
                              "mode" => %{"type" => "string"}
                            },
                            "required" => ["mode", "expiry", "available"],
                            "type" => "object"
                          }
                        },
                        "required" => ["auto_refill"],
                        "type" => "object"
                      },
                      "type" => "array"
                    },
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["meta", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 3
                },
                "free_data" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "meta" => %{
                      "properties" => %{"expiry" => %{"type" => "null"}},
                      "required" => ["expiry"],
                      "type" => "object"
                    },
                    "rules" => %{"items" => false, "type" => "array"},
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["meta", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 6
                },
                "sms0" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "expiry" => %{"type" => "null"},
                    "rules" => %{"items" => false, "type" => "array"},
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["expiry", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 0
                },
                "sms_sub" => %{
                  "items" => %{
                    "properties" => %{
                      "amount_at_last_topup" => %{"type" => "integer"},
                      "available" => %{"type" => "integer"},
                      "expiry" => %{"type" => "null"},
                      "rules" => %{
                        "properties" => %{
                          "auto_refill" => %{
                            "properties" => %{
                              "available" => %{"type" => "integer"},
                              "expiry" => %{"type" => "string"},
                              "mode" => %{"type" => "string"}
                            },
                            "required" => ["mode", "expiry", "available"],
                            "type" => "object"
                          }
                        },
                        "required" => ["auto_refill"],
                        "type" => "object"
                      },
                      "trn" => %{
                        "items" => %{
                          "properties" => %{
                            "amount" => %{"type" => "integer"},
                            "inserted_at" => %{"format" => "date-time", "type" => "string"},
                            "name" => %{"type" => "string"},
                            "status" => %{"type" => "string"}
                          },
                          "required" => ["name", "amount", "status", "inserted_at"],
                          "type" => "object"
                        },
                        "type" => "array"
                      },
                      "type" => %{"type" => "string"}
                    },
                    "required" => ["trn", "expiry", "amount_at_last_topup", "type", "available", "rules"],
                    "type" => "object"
                  },
                  "type" => "array",
                  "propertyOrder" => 1
                },
                "voice0" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "meta" => %{
                      "properties" => %{"expiry" => %{"type" => "null"}},
                      "required" => ["expiry"],
                      "type" => "object"
                    },
                    "rules" => %{"items" => false, "type" => "array"},
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["meta", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 4
                },
                "voice_sub" => %{
                  "properties" => %{
                    "available" => %{"type" => "integer"},
                    "meta" => %{
                      "properties" => %{
                        "amount_at_last_topup" => %{"type" => "integer"},
                        "expiry" => %{"type" => "null"},
                        "trn" => %{
                          "items" => %{
                            "properties" => %{
                              "amount" => %{"type" => "integer"},
                              "inserted_at" => %{"format" => "date-time", "type" => "string"},
                              "name" => %{"type" => "string"},
                              "status" => %{"type" => "string"}
                            },
                            "required" => ["name", "amount", "status", "inserted_at"],
                            "type" => "object"
                          },
                          "type" => "array"
                        }
                      },
                      "required" => ["trn", "expiry", "amount_at_last_topup"],
                      "type" => "object"
                    },
                    "rules" => %{
                      "items" => %{
                        "properties" => %{
                          "auto_refill" => %{
                            "properties" => %{
                              "available" => %{"type" => "integer"},
                              "expiry" => %{"type" => "string"},
                              "mode" => %{"type" => "string"}
                            },
                            "required" => ["mode", "expiry", "available"],
                            "type" => "object"
                          }
                        },
                        "required" => ["auto_refill"],
                        "type" => "object"
                      },
                      "type" => "array"
                    },
                    "type" => %{"type" => "string"}
                  },
                  "required" => ["meta", "type", "rules", "available"],
                  "type" => "object",
                  "propertyOrder" => 5
                }
              },
              "type" => "object"
            },
            "type" => "array"
          }


        }

}



end

def handle_event("load-schema1", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema1(code))
  ll = get_baseprice_id(ref_prodid)
  IO.inspect(ll.datab)
   #,additional: startwallet()
  {:reply, %{schema1: schema1(code)}, socket}
end


def handle_event("submit1", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema1 = socket.assigns.ref_schema1
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema1, params) do
    :ok ->

      {:ok, _updated_policy} = update_baseprice(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end

def update_baseprice(product_id, updated_data) do
  service = get_baseprice_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_baseprice_id(product_id) do
  ProductAlpha.Productprice.Baseprice # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end



def startbase() do
  %{

      "Inter-account transfer specification" => %{
        "allowed_services" => ["data", "voice", "sms", "primary"],
        "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
        "destination" => true,
        "enabled" => true,
        "policy_name" => "MASTER_POLICY",
        "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
        "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
        "source" => true,
        "valid_dst_policy_statuses" => ["High Speed"],
        "valid_dst_service_statuses" => [0],
        "valid_src_policy_statuses" => ["High Speed"],
        "valid_src_service_statuses" => [0],
        "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

    }



  }
end
defp schema1("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Base Price Set",
    "properties" => %{
        "Base price" => %{
          "properties" => %{
            "billing_code" => %{"type" => "string", "propertyOrder" => 2},
            "default_spend_limit" => %{"type" => "integer", "propertyOrder" => 6},
            "default_text" => %{"type" => "string","propertyOrder" => 3},
            "free_units" => %{"type" => "integer","propertyOrder" => 1},
            "gl_code" => %{"type" => "string", "propertyOrder" => 0},
            "invoicing_mode" => %{"type" => "string","propertyOrder" => 4},
            "post_surcharge" => %{"type" => "integer","propertyOrder" => 5}
          },
          "required" => ["gl_code", "free_units", "billing_code", "default_text", "invoicing_mode",
           "post_surcharge", "default_spend_limit"],
          "type" => "object"
        }
      }
}



end

# Subscription bill

def handle_event("load-schema2", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema2(code))
  ll = get_subscription_id(ref_prodid)
  IO.inspect(ll.datab)
   #,additional: startwallet()
  {:reply, %{schema2: schema2(code)}, socket}
end


def handle_event("submit2", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema2 = socket.assigns.ref_schema2
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema2, params) do
    :ok ->

      {:ok, _updated_policy} = update_subscription(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end

def update_subscription(product_id, updated_data) do
  service = get_subscription_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_subscription_id(product_id) do
  ProductAlpha.Productprice.Subscription # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end


def startsubcri() do
  %{

      "Inter-account transfer specification" => %{
        "allowed_services" => ["data", "voice", "sms", "primary"],
        "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
        "destination" => true,
        "enabled" => true,
        "policy_name" => "MASTER_POLICY",
        "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
        "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
        "source" => true,
        "valid_dst_policy_statuses" => ["High Speed"],
        "valid_dst_service_statuses" => [0],
        "valid_src_policy_statuses" => ["High Speed"],
        "valid_src_service_statuses" => [0],
        "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

    }



  }
end
defp schema2("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Subscription Set",
    "properties" => %{
        "Subscription billing" => %{
          "items" => %{
            "properties" => %{
              "amount" => %{"format" => "time", "type" => "string"},
              "fee" => %{"format" => "time", "type" => "string"},
              "status" => %{"type" => "string"}
            },
            "required" => ["fee", "amount", "status"],
            "type" => "object"
          },
          "type" => "array"
        }
      }
}



end

# Discounts

def handle_event("load-schema3", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema3(code))
  ll = get_discount_id(ref_prodid)
  IO.inspect(ll.datab)
   #,additional: startwallet()
  {:reply, %{schema3: schema3(code)}, socket}
end


def handle_event("submit3", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema3 = socket.assigns.ref_schema3
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema3, params) do
    :ok ->

      {:ok, _updated_policy} = update_discount(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end


def update_discount(product_id, updated_data) do
  service = get_discount_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_discount_id(product_id) do
  ProductAlpha.Productprice.Discount # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end




def startdiscounts() do
  %{

      "Inter-account transfer specification" => %{
        "allowed_services" => ["data", "voice", "sms", "primary"],
        "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
        "destination" => true,
        "enabled" => true,
        "policy_name" => "MASTER_POLICY",
        "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
        "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
        "source" => true,
        "valid_dst_policy_statuses" => ["High Speed"],
        "valid_dst_service_statuses" => [0],
        "valid_src_policy_statuses" => ["High Speed"],
        "valid_src_service_statuses" => [0],
        "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

    }



  }
end
defp schema3("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Discounts Set",
    "properties" => %{
        "Discounts" => %{
          "items" => %{
            "properties" => %{
              "description" => %{"type" => "string","propertyOrder" => 1},
              "name" => %{"type" => "string", "propertyOrder" => 0},
              "percentage" => %{"type" => "string", "propertyOrder" => 2}
            },
            "required" => ["name", "description", "percentage"],
            "type" => "object"
          },
          "type" => "array"
      }

      }
}



end

#consumption bill

def handle_event("load-schema4", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema4(code))
  ll = get_consumption_id(ref_prodid)
  IO.inspect(ll.datab)
   #,additional: startwallet()
  {:reply, %{schema4: schema4(code)}, socket}
end


def handle_event("submit", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema4 = socket.assigns.ref_schema4
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema4, params) do
    :ok ->

      {:ok, _updated_policy} = update_consumption(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end


def update_consumption(product_id, updated_data) do
  service = get_consumption_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_consumption_id(product_id) do
  ProductAlpha.Productprice.Consumption # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end




def startconsumption() do
  %{

      "Inter-account transfer specification" => %{
        "allowed_services" => ["data", "voice", "sms", "primary"],
        "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
        "destination" => true,
        "enabled" => true,
        "policy_name" => "MASTER_POLICY",
        "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
        "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
        "source" => true,
        "valid_dst_policy_statuses" => ["High Speed"],
        "valid_dst_service_statuses" => [0],
        "valid_src_policy_statuses" => ["High Speed"],
        "valid_src_service_statuses" => [0],
        "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}

    }



  }
end

defp schema4("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Consumption Set",
    "properties" => %{
        "Consumption billing" => %{
          "properties" => %{
            "consumption period" => %{"type" => "string", "propertyOrder" => 0},
            "effective date" => %{"format" => "date", "type" => "string", "propertyOrder" => 1},
            "event charging" => %{
              "properties" => %{
                "applies_to" => %{
                  "properties" => %{
                    "balances" => %{"items" => %{"type" => "string"}, "type" => "array"},
                    "service_type" => %{"type" => "string"}
                  },
                  "required" => ["balances", "service_type"],
                  "type" => "object",
                  "propertyOrder" => 3
                },
                "model" => %{"type" => "string", "propertyOrder" => 0},
                "quota_calc" => %{"type" => "string", "propertyOrder" => 1},
                "type" => %{
                  "properties" => %{
                    "simple" => %{"type" => "boolean"},
                    "time_band" => %{"type" => "boolean"}
                  },
                  "required" => ["simple", "time_band"],
                  "type" => "object",
                  "propertyOrder" => 2
                }
              },
              "required" => ["model", "quota_calc", "type", "applies_to"],
              "type" => "object",
              "propertyOrder" => 3
            },
            "real-time charging specification" => %{
              "properties" => %{
                "billing_code" => %{"type" => "string"},
                "default_spend_limit" => %{"type" => "integer"},
                "default_text" => %{"type" => "string"},
                "free_units" => %{"type" => "integer"},
                "gl_code" => %{"type" => "string"},
                "invoicing_mode" => %{"type" => "string"},
                "post_surcharge" => %{"type" => "integer"}
              },
              "required" => ["gl_code", "free_units", "billing_code", "default_text", "invoicing_mode",
               "post_surcharge", "default_spend_limit"],
              "type" => "object",
              "propertyOrder" => 4
            },
            "value" => %{"type" => "string", "propertyOrder" => 2}
          },
          "required" => ["consumption period", "effective date", "value", "event charging",
           "real-time charging specification"],
          "type" => "object"

      }


      }
}



end


# specification

def handle_event("load-schema5", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema5(code))
  ll = get_specification_id(ref_prodid)
  IO.inspect(ll.datab)
  # #IO.inspect(get_policy(3))
  # ll = get_policy(3)
  # ll.data
  {:reply, %{schema5: schema5(code), networkrespec: startnetworkspec()}, socket}
end


def handle_event("submit5", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema5 = socket.assigns.ref_schema5
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema5, params) do
    :ok ->

      {:ok, _updated_policy} = update_specification(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end




def update_specification(product_id, updated_data) do
  service = get_specification_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_specification_id(product_id) do
  ProductAlpha.Network.Specification # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end


def startnetworkspec() do
  %{
    "Specification" => %{
      "cc" => "27",
      "ims" => "8000",
      "mcc" => "655",
      "mnc" => "74",
      "ndc" => "696",
      "tpl" => "12",
      "vobb" => true,
      "hlrsn" => "1",
      "sicap" => true,
      "access" => "4G",
      "simota" => "4001",
      "srvName" => "4G_STAFF_MOBILE",
      "usrState" => "1",
      "ims_voice" => false,
      "snPatterns" => "99",
      "usrExAttr1" => "0",
      "vobb_realm" => "rainmobile.co.za",
      "ims_srvName" => "VOLTE_RAIN_PREMIUM",
      "ims_template" => "ADD_VOLTE_MSR_SUP",
      "usrIdentifier" => "usrMSISDN",
      "usrSubNetType" => "0",
      "password_prefix" => "",
      "password_suffix" => "@raIn",
      "simota_base_url" => "https://api.devops.rain.co.za",
      "ims_pgw_endpoint" => "10.192.21.146:8080/spg",
      "srvStartDateTime" => "CURRENT_DATETIME (GMT+2)",
      "usrBillCycleDate" => "1",
      "password_gen_method" => "Method1",
      "ims_pgw_endpoint_pass" => "cnp200@HW",
      "ims_pgw_endpoint_user" => "BSS_User",
      "network_service_names" => "4G mobile standard staff",
      "vqt_percentage" => 0.5
    }
  }
end
defp schema5("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Network Resource",
    "properties" => %{
    "Specification" => %{
        "type" => "object",
        "properties" => %{
          "cc" => %{
            "type" => "string",
            "propertyOrder" => 0
          },
          "ims" => %{
            "type" => "string",
            "format" => "time",
            "propertyOrder" => 1
          },
          "mcc" => %{
            "type" => "string",
            "propertyOrder" => 2
          },
          "mnc" => %{
            "type" => "string",
            "propertyOrder" => 3
          },
          "ndc" => %{
            "type" => "string",
            "propertyOrder" => 4
          },
          "tpl" => %{
            "type" => "string",
            "propertyOrder" => 5
          },
          "vobb" => %{
            "type" => "boolean",
            "propertyOrder" => 6
          },
          "hlrsn" => %{
            "type" => "string",
            "propertyOrder" => 7
          },
          "sicap" => %{
            "type" => "boolean",
            "propertyOrder" => 8
          },
          "access" => %{
            "type" => "string",
            "propertyOrder" => 9
          },
          "simota" => %{
            "type" => "string",
            "format" => "time",
            "propertyOrder" => 10
          },
          "srvName" => %{
            "type" => "string",
            "propertyOrder" => 11
          },
          "usrState" => %{
            "type" => "string",
            "propertyOrder" => 12

          },
          "ims_voice" => %{
            "type" => "boolean",
            "propertyOrder" => 13
          },
          "snPatterns" => %{
            "type" => "string",
            "propertyOrder" => 14
          },
          "usrExAttr1" => %{
            "type" => "string",
            "propertyOrder" => 15
          },
          "vobb_realm" => %{
            "type" => "string",
            "propertyOrder" => 16
          },
          "ims_srvName" => %{
            "type" => "string",
            "propertyOrder" => 17
          },
          "ims_template" => %{
            "type" => "string",
            "propertyOrder" => 18
          },
          "usrIdentifier" => %{
            "type" => "string",
            "propertyOrder" => 19
          },
          "usrSubNetType" => %{
            "type" => "string",
            "propertyOrder" => 20
          },
          "password_prefix" => %{
            "type" => "string",
            "propertyOrder" => 21
          },
          "password_suffix" => %{
            "type" => "string",
            "propertyOrder" => 22
          },
          "simota_base_url" => %{
            "type" => "string",
            "format" => "uri",
            "propertyOrder" => 23
          },
          "ims_pgw_endpoint" => %{
            "type" => "string",
            "propertyOrder" => 24
          },
          "srvStartDateTime" => %{
            "type" => "string",
            "propertyOrder" => 25
          },
          "usrBillCycleDate" => %{
            "type" => "string",
            "propertyOrder" => 26
          },
          "password_gen_method" => %{
            "type" =>  "string",
            "propertyOrder" => 27
          },
          "ims_pgw_endpoint_pass" => %{
            "type" => "string",
            "propertyOrder" => 28
          },
          "ims_pgw_endpoint_user" => %{
            "type" => "string",
            "propertyOrder" => 29
          },
          "network_service_names" => %{
            "type" => "string",
            "propertyOrder" => 30
          },
          "vqt_percentage" => %{
            "type" => "number",
            "propertyOrder" => 31

          }
        },
        "required" => [
          "cc",
          "ims",
          "mcc",
          "mnc",
          "ndc",
          "tpl",
          "vobb",
          "hlrsn",
          "sicap",
          "access",
          "simota",
          "srvName",
          "usrState",
          "ims_voice",
          "snPatterns",
          "usrExAttr1",
          "vobb_realm",
          "ims_srvName",
          "ims_template",
          "usrIdentifier",
          "usrSubNetType",
          "password_prefix",
          "password_suffix",
          "simota_base_url",
          "ims_pgw_endpoint",
          "srvStartDateTime",
          "usrBillCycleDate",
          "password_gen_method",
          "ims_pgw_endpoint_pass",
          "ims_pgw_endpoint_user",
          "network_service_names",
          "vqt_percentage",

        ]
      }
}
}



end

# Notification

def handle_event("load-schema6", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema6(code))
  ll = get_notification_id(ref_prodid)
  IO.inspect(ll.datab)
  # #IO.inspect(get_policy(3))
  # ll = get_policy(3)
  # ll.data
  {:reply, %{schema6: schema6(code), networknotification: startnotification()}, socket}
end


def handle_event("submit6", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema6 = socket.assigns.ref_schema6
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema6, params) do
    :ok ->

      {:ok, _updated_policy} = update_notification(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end


def update_notification(product_id, updated_data) do
  service = get_notification_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_notification_id(product_id) do
  ProductAlpha.Network.Notification  # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end




def startnotification() do
  %{
    "Notification" => %{
      "default_quota" => %{
        "name" => "totalVolume",
        "quota" => 268_435_456
      },
      "xxxfinal_unit" => %{
        "finalUnitIndication" => %{
          "finalUnitAction" => "TERMINATE"
        }
      },
      "threshold_notifications" => [
        %{
          "p" => 99.999,
          "name" => "4g_basic_100p",
          "type" => "SMS"
        },
        %{
          "p" => 80,
          "name" => "4g_basic_80p",
          "type" => "SMS"
        },
        %{
          "p" => 50,
          "name" => "4g_basic_50p",
          "type" => "SMS"
        }
      ]

    }
  }
end
defp schema6("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Network Resource",
    "properties" => %{
    "Notification" => %{
        "type" => "object",
        "properties" => %{
          "default_quota" => %{
            "type" => "object",
            "propertyOrder" => 0,
            "properties" => %{
              "name" => %{
                "type" => "string"
              },
              "quota" => %{
                "type" => "integer"
              }
            },
            "required" => [
              "name",
              "quota"
            ]
          },
          "xxxfinal_unit" => %{
            "type" => "object",
            "propertyOrder" => 1,
            "properties" => %{
              "finalUnitIndication" => %{
                "type" => "object",
                "properties" => %{
                  "finalUnitAction" => %{
                    "type" => "string"
                  }
                },
                "required" => [
                  "finalUnitAction"
                ]
              }
            },
            "required" => [
              "finalUnitIndication"
            ]
          },
          "threshold_notifications" => %{
            "type" => "array",
            "propertyOrder" => 2,
            "items" => %{
              "type" => "object",
              "properties" => %{
                "p" => %{
                  "type" => "number"
                },
                "name" => %{
                  "type" => "string"
                },
                "type" => %{
                  "type" => "string"
                }
              },
              "required" => [
                "p",
                "name",
                "type"
              ]
            }
          }
        },
        "required" => [
          "default_quota",
          "xxxfinal_unit",
          "threshold_notifications"
        ]
      }
}
}



end

# Resources Dev


def handle_event("load-schema7", %{"code" => code}, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ko = Jason.encode!(schema7(code))
  ll = get_resource_id(ref_prodid)
  IO.inspect(ll.datab)
  # #IO.inspect(get_policy(3))
  # ll = get_policy(3)
  # ll.data
  {:reply, %{schema7: schema7(code), resdev: startresourcesdev()}, socket}
end


def handle_event("submit7", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema7 = socket.assigns.ref_schema7
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema7, params) do
    :ok ->

      {:ok, _updated_policy} = update_resource(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end



def update_resource(product_id, updated_data) do
  service = get_resource_id(product_id) # Use get_policy!/1 to raise an error if the policy is not found
  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

def get_service(product_id) do
  Repo.get(ProductAlpha.Providers.Provider,product_id)
  # hata.data
end

def get_resource_id(product_id) do
  ProductAlpha.Network.Resource # our scema file
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  |> preload([:product]) # this bcs of the relationship between the two
  |> Repo.one()
end



def startresourcesdev() do
  %{
    "Resources" => %{
      "Logical Resource" => [
        %{
          "isOperational" => "true",
          "irStatus" => "initializing",
          "serviceState" => "In service"
        }
      ],
      "Physical Resource" => [
        %{
          "ManufactureDate" => "2012-07-29",
          "otherIdentifier" => "10927476745",
          "PowerState" => "Full power applied",
          "serial number" => "98348937859355",
          "version number" => "version 17.5"
        }
      ],
      "Device" => [
        %{
          "type" => "mobile",
          "manufacturer" => "rain",
          "model" => "smartphone"
        }
      ]
    }
  }
end
defp schema7("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Resources & Device",
    "properties" => %{
    "Resources" => %{
        "type" => "object",
        "properties" => %{
          "Logical Resource" => %{
            "type" => "array",
            "propertyOrder" => 0,
            "items" => %{
              "type" => "object",
              "properties" => %{
                "isOperational" => %{
                  "type" => "string",
                  "propertyOrder" => 0
                },
                "irStatus" => %{
                  "type" => "string",
                  "propertyOrder" => 1
                },
                "serviceState" => %{
                  "type" => "string",
                  "propertyOrder" => 2
                }
              },
              "required" => [
                "isOperational",
                "irStatus",
                "serviceState"
              ]
            }
          },
          "Physical Resource" => %{
            "type"  => "array",
            "propertyOrder" => 1,
            "items" => %{
              "type" => "object",
              "properties" => %{
                "ManufactureDate" => %{
                  "type" => "string",
                  "format" => "date",
                  "propertyOrder" => 0
                },
                "otherIdentifier" => %{
                  "type" => "string",
                  "propertyOrder" => 2
                },
                "PowerState" => %{
                  "type" => "string",
                  "propertyOrder" => 1
                },
                "serial number" => %{
                  "type"  => "string",
                  "propertyOrder" => 3
                },
                "version number" => %{
                  "type" => "string",
                  "propertyOrder" => 4
                }
              },
              "required" => [
                "ManufactureDate",
                "otherIdentifier",
                "PowerState",
                "serial number",
                "version number"
              ]
            }
          },
          "Device" => %{
            "type" => "array",
            "propertyOrder" => 2,
            "items" => %{
              "type" => "object",
              "properties" => %{
                "type" => %{
                  "type" => "string",
                  "propertyOrder" => 2
                },
                "manufacturer" => %{
                  "type" =>  "string",
                  "propertyOrder" => 0
                },
                "model" => %{
                  "type" => "string",
                  "propertyOrder" => 1
                }
              },
              "required" => [
                "type",
                "manufacturer",
                "model"
              ]
            }
          }
        },
        "required" => [
          "Logical Resource",
          "Physical Resource",
          "Device"
        ]
      }
}
}



end

# Service Provider

def handle_event("load-schema8", %{"code" => code}, socket) do
  # ko = Jason.encode!(darastart())
  # #IO.inspect(get_policy(3))
   ref_prodid = IO.inspect(socket.assigns.prod_id)
   ll = get_account_by_number(ref_prodid)
   IO.inspect(ll.datab)
  #socket.assigns.prod_id
  # startprovider() for default values
  {:reply, %{schema8: schema8(code), spdefault: ll.datab}, socket}
end


def handle_event("submit8", params, socket) do\
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema8 = socket.assigns.ref_schema8
  IO.inspect(params)
  IO.inspect(ref_prodid)
  case ExJsonSchema.Validator.validate(ref_schema8, params) do
    :ok ->
      {:ok, _updated_policy} = update_service(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}
      {:noreply, redirect(socket, to: "/j/sd")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end





def update_service(product_id, updated_data) do
service = get_account_by_number(product_id) # Use get_policy!/1 to raise an error if the policy is not found
IO.inspect(service)
|> Ecto.Changeset.change(datab: updated_data)
|> Repo.update()
end




def get_service(product_id) do
Repo.get(ProductAlpha.Providers.Provider,product_id)
# hata.data
end


def get_account_by_number(product_id) do
ProductAlpha.Providers.Provider # our scema file
|> where(product_id: ^product_id)
# basically is for returning user data wtogether with account
|> preload([:product]) # this bcs of the relationship between the two
|> Repo.one()
end




defp darastart() do
  %{
         "Policies" => %{
         "triggers" => [
           %{
             "triggerType" => "QUOTA_THRESHOLD",
             "triggerCategory" => "IMMEDIATE_REPORT"
           },
           %{
             "triggerType" => "QUOTA_EXHAUSTED",
             "triggerCategory" => "IMMEDIATE_REPORT"
           },
           %{
             "triggerType" => "QHT",
             "triggerCategory" => "IMMEDIATE_REPORT"
           },
           %{
             "triggerType" => "VALIDITY_TIME",
             "triggerCategory" => "IMMEDIATE_REPORT"
           }
         ],
         "validityTime" => 900,
         "quotaHoldingTime" => 0,
         "timeQuotaThreshold" => 70,
         "unitQuotaThreshold" => 80,
         "policy_states" => [
           "High Speed",
           "RICA",
           "Device",
           "PP_OOB"
         ],
         "initial_service_policy" => %{
           "MASTER_POLICY" => %{
             "currentStatus" => "High Speed"
           }
         }
        }
       }

end

def startprovider() do
  %{
    "Service Provider" => [
        %{
          "name" => "rain",
          "address" => "Block D, The Main Straight, 392 Main Rd, Bryanston, Johannesburg, 2191",
          "contact details" => "0816101000"
        }
      ]

  }
end
defp schema8("GER") do
# You'd probably load the schema from either your database
# or a JSON file, but we'll simply hard-code it for now:
  %{
    "type" => "object",
    "title" => "Service Provider",
    "properties" => %{
    "Service Provider" => %{
      "type" => "array",


      "items" => %{
        "type" => "object",
        "title" => "Provider",
        "properties" => %{
          "name" => %{
            "type" => "string",
            "propertyOrder" => 0
          },
          "address" => %{
            "type" => "string",
            "propertyOrder" => 1
          },
          "contact details" => %{
            "type" => "string",
            "propertyOrder" => 2
          }
        },
        "required" => [
          "name",
          "address",
          "contact details"
        ]
      }

}
}
}



end

#####################Inter_Account############################

def handle_event("load-schema14", %{"code" => code}, socket) do
  ko = Jason.encode!(schema14(code))
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ll = get_interaccount_byprod(ref_prodid)
  IO.inspect(ll.datab)
  #  IO.inspect(ko)
  # #IO.inspect(get_policy(3))
  # ll = get_policy(3)
  # ll.data
  #  IO.inspect(schema(code))
  {:reply, %{schema14: schema14(code), interacc: ll.datab}, socket}
end

def handle_event("submit14", params, socket) do
  ref_prodid = IO.inspect(socket.assigns.prod_id)
  ref_schema14 = socket.assigns.ref_schema14
  IO.inspect(params)

  case ExJsonSchema.Validator.validate(ref_schema14, params) do
    :ok ->
      {:ok, _updated_policy} = update_interaccount(ref_prodid, params)
      {:noreply, put_flash(socket, :info, "Success!")}

    {:error, _errors} ->
      {:noreply, put_flash(socket, :error, "Errors!")}
  end
end

def update_interaccount(product_id, updated_data) do
  # Use get_policy!/1 to raise an error if the policy is not found
  service = get_interaccount_byprod(product_id)

  IO.inspect(service)
  |> Ecto.Changeset.change(datab: updated_data)
  |> Repo.update()
end

# defp insert_policy12(data) do
#   %ProductAlpha.Policies.Policy{} # Change to match your schema module
#   |> Ecto.Changeset.change(data: data)
#   |> Repo.insert()
# end

def get_service(product_id) do
  Repo.get(ProductAlpha.Interaccounts.Interaccount, product_id)
  # hata.data
end

def get_interaccount_byprod(product_id) do
  # our scema file
  ProductAlpha.Interaccounts.Interaccount
  |> where(product_id: ^product_id)
  # basically is for returning user data wtogether with account
  # this bcs of the relationship between the two
  |> preload([:product])
  |> Repo.one()
end

def startinteracc() do
  %{
    "Inter-account transfer specification" => %{
      "allowed_services" => ["data", "voice", "sms", "primary"],
      "data" => %{"default_wallet" => "data0", "enabled_wallets" => ["data0"]},
      "destination" => true,
      "enabled" => true,
      "policy_name" => "MASTER_POLICY",
      "primary" => %{"default_wallet" => "primary", "enabled_wallets" => ["primary"]},
      "sms" => %{"default_wallet" => "sms0", "enabled_wallets" => ["sms0"]},
      "source" => true,
      "valid_dst_policy_statuses" => ["High Speed"],
      "valid_dst_service_statuses" => [0],
      "valid_src_policy_statuses" => ["High Speed"],
      "valid_src_service_statuses" => [0],
      "voice" => %{"default_wallet" => "voice0", "enabled_wallets" => ["voice0"]}
    }
  }
end

defp schema14("GER") do
  # You'd probably load the schema from either your database
  # or a JSON file, but we'll simply hard-code it for now:
  #
  %{
    "type" => "object",
    "title" => "Inter-account ",
    "properties" => %{
      "Inter-account transfer specification" => %{
        "type" => "object",
        "properties" => %{
          "allowed_services" => %{
            "items" => %{
              "title" => "Service",
              "type" => "string"
            },
            "type" => "array",
              "options" => %{
                "collapsed" => true },
               "propertyOrder" => 8
          },
          "data" => %{
            "properties" => %{
              "default_wallet" => %{"type" => "string"},
              "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
            },
            "required" => ["default_wallet", "enabled_wallets"],
            "type" => "object",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 5
          },
          "destination" => %{"type" => "boolean", "propertyOrder" => 2},
          "enabled" => %{"type" => "boolean", "propertyOrder" => 1},
          "policy_name" => %{"type" => "string", "propertyOrder" => 3},
          "primary" => %{
            "properties" => %{
              "default_wallet" => %{"type" => "string"},
              "enabled_wallets" => %{
                "items" => %{"type" => "string"},
                "type" => "array",
                "options" => %{
                  "collapsed" => true
                }
              }
            },
            "required" => ["default_wallet", "enabled_wallets"],
            "type" => "object",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 7
          },
          "sms" => %{
            "properties" => %{
              "default_wallet" => %{"type" => "string"},
              "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
            },
            "required" => ["default_wallet", "enabled_wallets"],
            "type" => "object",
            "propertyOrder" => 4,
            "options" => %{
              "collapsed" => true
            }
          },
          "source" => %{"type" => "boolean", "propertyOrder" => 0},
          "valid_dst_policy_statuses" => %{
            "items" => %{"type" => "string"},
            "type" => "array",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 9
          },
          "valid_dst_service_statuses" => %{
            "items" => %{"type" => "integer"},
            "type" => "array",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 11
          },
          "valid_src_policy_statuses" => %{
            "items" => %{"type" => "string"},
            "type" => "array",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 10
          },
          "valid_src_service_statuses" => %{
            "items" => %{"type" => "integer"},
            "type" => "array",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 12
          },
          "voice" => %{
            "properties" => %{
              "default_wallet" => %{"type" => "string"},
              "enabled_wallets" => %{"items" => %{"type" => "string"}, "type" => "array"}
            },
            "required" => ["default_wallet", "enabled_wallets"],
            "type" => "object",
            "options" => %{
              "collapsed" => true },
            "propertyOrder" => 6
          }
        },
        "required" => [
          "sms",
          "data",
          "voice",
          "source",
          "enabled",
          "primary",
          "destination",
          "policy_name",
          "allowed_services",
          "valid_dst_policy_statuses",
          "valid_src_policy_statuses",
          "valid_dst_service_statuses",
          "valid_src_service_statuses"
        ]
      }
    }
  }
end


end
