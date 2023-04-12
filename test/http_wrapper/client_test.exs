defmodule HttpWrapper.ClientTest do
  use ExUnit.Case

  alias HttpWrapper.Client

  test "get" do
    assert {:ok, %HttpWrapper.Response{} = response} =
             Client.get("http://localhost:8082/tests?id=1")

    assert response.status_code == 200
    assert response.body == %{"id" => 1, "name" => "Test 1"}
  end

  test "put" do
    assert {:ok, %HttpWrapper.Response{} = response} =
             Client.put("http://localhost:8082/tests", %{"id" => "1", "name" => "Test 1"}, [])

    assert response.status_code == 200
    assert response.body == %{"id" => 1, "name" => "Test 1"}
  end

  test "post" do
    assert {:ok, %HttpWrapper.Response{} = response} =
             Client.post("http://localhost:8082/tests", %{"name" => "Test 1"}, [])

    assert response.status_code == 200
    assert response.body == %{"id" => 1, "name" => "Test 1"}
  end
end
