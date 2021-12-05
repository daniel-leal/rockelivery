defmodule RockeliveryWeb.UsersControllerTest do
  use RockeliveryWeb.ConnCase, async: true

  import Rockelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = %{
        "address" => "Rua das bananeiras, 15",
        "age" => 27,
        "cep" => "12345678",
        "cpf" => "12345678901",
        "email" => "daniel@banana.com",
        "password" => "12345678",
        "name" => "Daniel"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "message" => "User created!",
               "user" => %{
                 "address" => "Rua das bananeiras, 15",
                 "age" => 27,
                 "cpf" => "12345678901",
                 "email" => "daniel@banana.com",
                 "id" => _id
               }
             } = response
    end

    test "when there are some errors, returns the errors", %{conn: conn} do
      params = %{
        "password" => "12345678",
        "name" => "Daniel"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response = expected_response
    end
  end

  describe "delete/2" do
    test "when there is a user with the given id, deletes the user", %{conn: conn} do
      id = "5a99cd33-a5cc-44ca-91aa-1c1a43d00276"
      insert(:user)

      response =
        conn
        |> delete(Routes.users_path(conn, :delete, id))
        |> response(:no_content)

      assert response == ""
    end
  end
end
