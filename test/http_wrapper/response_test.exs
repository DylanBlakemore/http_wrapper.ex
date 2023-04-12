defmodule HttpWrapper.ResponseTest do
  use ExUnit.Case

  alias HttpWrapper.Response

  test "new!" do
    response = %HTTPoison.Response{body: "{\"test\": \"test\"}", headers: [], status_code: 200}

    assert %Response{body: %{"test" => "test"}, headers: [], status_code: 200} =
             Response.new!(response)
  end
end
