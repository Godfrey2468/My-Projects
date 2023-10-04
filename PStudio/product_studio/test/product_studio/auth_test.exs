defmodule ProductStudio.AuthTest do
  use ProductStudio.DataCase

  alias ProductStudio.Auth

  describe "users" do
    alias ProductStudio.Auth.User

    import ProductStudio.AuthFixtures

    @invalid_attrs %{email: nil, password: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Auth.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Auth.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{email: "some email", password: "some password"}

      assert {:ok, %User{} = user} = Auth.create_user(valid_attrs)
      assert user.email == "some email"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{email: "some updated email", password: "some updated password"}

      assert {:ok, %User{} = user} = Auth.update_user(user, update_attrs)
      assert user.email == "some updated email"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_user(user, @invalid_attrs)
      assert user == Auth.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Auth.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Auth.change_user(user)
    end
  end

  describe "session" do
    alias ProductStudio.Auth.Session

    import ProductStudio.AuthFixtures

    @invalid_attrs %{new: nil}

    test "list_session/0 returns all session" do
      session = session_fixture()
      assert Auth.list_session() == [session]
    end

    test "get_session!/1 returns the session with given id" do
      session = session_fixture()
      assert Auth.get_session!(session.id) == session
    end

    test "create_session/1 with valid data creates a session" do
      valid_attrs = %{new: "some new"}

      assert {:ok, %Session{} = session} = Auth.create_session(valid_attrs)
      assert session.new == "some new"
    end

    test "create_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Auth.create_session(@invalid_attrs)
    end

    test "update_session/2 with valid data updates the session" do
      session = session_fixture()
      update_attrs = %{new: "some updated new"}

      assert {:ok, %Session{} = session} = Auth.update_session(session, update_attrs)
      assert session.new == "some updated new"
    end

    test "update_session/2 with invalid data returns error changeset" do
      session = session_fixture()
      assert {:error, %Ecto.Changeset{}} = Auth.update_session(session, @invalid_attrs)
      assert session == Auth.get_session!(session.id)
    end

    test "delete_session/1 deletes the session" do
      session = session_fixture()
      assert {:ok, %Session{}} = Auth.delete_session(session)
      assert_raise Ecto.NoResultsError, fn -> Auth.get_session!(session.id) end
    end

    test "change_session/1 returns a session changeset" do
      session = session_fixture()
      assert %Ecto.Changeset{} = Auth.change_session(session)
    end
  end
end
