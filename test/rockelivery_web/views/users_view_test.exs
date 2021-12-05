defmodule RockeliveryWeb.UsersViewTest do
  use RockeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Rockelivery.Factory

  alias RockeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
             message: "User created!",
             user: %Rockelivery.User{
               address: "Rua das bananeiras, 15",
               age: 27,
               cep: "12345678",
               cpf: "12345678901",
               email: "daniel@banana.com",
               id: "5a99cd33-a5cc-44ca-91aa-1c1a43d00276",
               inserted_at: nil,
               name: "Daniel",
               password: "12345678",
               password_hash: nil,
               updated_at: nil
             }
           } = response
  end
end
