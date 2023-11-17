defmodule TsbankWeb.StaffController do
  use TsbankWeb, :controller

  alias Tsbank.Staffs
  alias Tsbank.Staffs.Staff

  alias TSBank.Users

  action_fallback TsbankWeb.FallbackController

  def index(conn, _params) do
    staffs = Staffs.list_staffs()
    render(conn, :index, staffs: staffs)
  end

  def create(conn, %{"staff" => staff_params}) do

    user_id = conn.assigns.user.id
    admin_id = get_admin_id(user_id)
    struct = Users.get_admin(admin_id)

    with {:ok, %Staff{} = staff} <- Staffs.create_staff(struct, staff_params) do
      conn
      |> put_status(:created)
      #|> put_resp_header("location", ~p"/api/staffs/#{staff}")
      |> render(:show, staff: staff)
    end
  end

  #################################################################################

  defp get_admin_id(id) do
    case Users.get_full_Admin(id) do
      nil -> {:error, :unauthorized}
      admin -> admin.id
    end
   end

  def show(conn, %{"id" => id}) do
    staff = Staffs.get_staff!(id)
    render(conn, :show, staff: staff)
  end

  def update(conn, %{"id" => id, "staff" => staff_params}) do
    staff = Staffs.get_staff!(id)

    with {:ok, %Staff{} = staff} <- Staffs.update_staff(staff, staff_params) do
      render(conn, :show, staff: staff)
    end
  end

  def delete(conn, %{"id" => id}) do
    staff = Staffs.get_staff!(id)

    with {:ok, %Staff{}} <- Staffs.delete_staff(staff) do
      send_resp(conn, :no_content, "")
    end
  end
end
