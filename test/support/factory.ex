defmodule Rockelivery.Factory do
  use ExMachina.Ecto, repo: Rockelivery.Repo

  alias Rockelivery.User

  def user_params_factory do
    %{
      address: "Rua das bananeiras, 15",
      age: 27,
      cep: "12345678",
      cpf: "12345678901",
      email: "daniel@banana.com",
      password: "12345678",
      name: "Daniel"
    }
  end

  def user_factory do
    %User{
      id: "5a99cd33-a5cc-44ca-91aa-1c1a43d00276",
      address: "Rua das bananeiras, 15",
      age: 27,
      cep: "12345678",
      cpf: "12345678901",
      email: "daniel@banana.com",
      password: "12345678",
      name: "Daniel"
    }
  end
end
