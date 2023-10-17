defmodule TsbankWeb.Auth.Guardian do
    # use this to decode and encode tokens
    use Guardian, otp_app: :tsbank
    #use Guardian, otp_app: :real_deal_api
    # access to auth for user context file where we do those query to database
    alias Tsbank.Users

    alias Tsbank.Accounts

    # passing json with an id
  def subject_for_token(%{id: id}, _claims) do
    # converting id to string
     sub = to_string(id)
     {:ok, sub}
   end

    # same function for having empty json and no claims
  def subject_for_token(_, _) do
    {:error, :no_id_provided}
  end

  def resource_from_claims(%{"sub" => id}) do
    # we going to use account in in our token

    case Users.get_user!(id) do
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

    # for empty staff to give an error
    def resource_from_claims(_claims) do
      {:error, :no_id_provided}
    end

    # use this to login or to get our token
    def authenticate(email, password) do

      case Users.get_user_by_email(email) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        user ->
          case validate_password(password, user.password) do
            true -> create_token(user, :access)
            false -> {:error, :unauthorized}
          end

      end
    end


    def get_id_on (email) do
      case Users.get_user_by_email(email) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        user -> user.id


      end
    end

    def get_me_id(id) do
      case Users.get_full_userhhh(id) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        customer -> customer.id
      end
    end

    def get_me_account_id(id) do
      case Accounts.get_full_account_id(id) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        account -> account.id
      end
    end

    def get_that_account_name(id) do
      case Accounts.get_account_name(id) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        account -> account.accountNumber
      end
    end



    def get_tbalance(accountNumber) do
      case Accounts.get_account_sartuday(accountNumber) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        account -> account.balance
      end
    end

    def get_the_accountid(accountNumber) do
      case Accounts.get_account_sartuday(accountNumber) do
        nil -> {:error, :unauthorized} # this works for the error response plug ehrn using it by other side
        account -> account.id
      end
    end



    def validate_password(password, jpassword) do
      Bcrypt.verify_pass(password, jpassword)
    end

    # function to generate our token
    defp create_token(user, type) do
      IO.inspect(user)
      {:ok, token, _claims} = encode_and_sign(user, %{}, token_options(type) )
      {:ok, user, token}
    end

    # Helper function to help us for token options
    defp token_options(type) do
      case type do
        :access -> [token_type: "access", ttl: {2, :hour}]
        :reset -> [token_type: "reset", ttl: {15, :minute}]
        :admin -> [token_type: "admin", ttl: {90, :day}]
      end
    end

end
