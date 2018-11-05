# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Chirp.Repo.insert!(%Chirp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

{:ok, _user} = Chirp.Accounts.create_user(%{
  email: "writer",
  username: "writer",
  password: "qweqweqwe",
  permissions: %{default: [:read_users, :write_users]}
})

{:ok, _user} = Chirp.Accounts.create_user(%{
  email: "reader",
  username: "reader",
  password: "qweqweqwe",
  permissions: %{default: [:read_users]}
})

{:ok, _user} = Chirp.Accounts.create_user(%{
  email: "rubbish",
  username: "rubbish",
  password: "qweqweqwe",
  permissions: %{default: []}
})
