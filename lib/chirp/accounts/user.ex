defmodule Chirp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Chirp.Accounts.User

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :permissions, :map
    field :username, :string

    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:username, :email, :password, :permissions])
    |> validate_required([:username, :email, :password, :permissions])
    |> unique_constraint(:username)
    |> unique_constraint(:email)
    |> put_hashed_password()
  end

  defp put_hashed_password(%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :hashed_password, Comeonin.Bcrypt.hashpwsalt(password))
  end

  defp put_hashed_password(changeset) do
    changeset
  end
end
