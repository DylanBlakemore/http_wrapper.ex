defmodule HttpWrapper.ErrorTest do
  use ExUnit.Case

  alias HttpWrapper.Error

  test "new!" do
    error = %HTTPoison.Error{reason: "test"}
    assert %Error{reason: "test"} = Error.new!(error)
  end
end
