defmodule TsbankWeb.StaffJSON do
  alias Tsbank.Staffs.Staff

  @doc """
  Renders a list of staffs.
  """
  def index(%{staffs: staffs}) do
    %{data: for(staff <- staffs, do: data(staff))}
  end

  @doc """
  Renders a single staff.
  """
  def show(%{staff: staff}) do
    %{data: data(staff)}
  end

  defp data(%Staff{} = staff) do
    %{
      id: staff.id,
      moreinfo: staff.moreinfo
    }
  end
end
