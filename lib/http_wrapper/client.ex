defmodule HttpWrapper.Client do
  @moduledoc """
  A generic HTTP client
  """

  @doc """
  Makes a GET request to the given URL
  """
  @spec get(String.t(), keyword()) ::
          {:ok, HttpWrapper.Response.t()} | {:error, HttpWrapper.Error.t()}
  def get(url, headers \\ []) do
    url
    |> HTTPoison.get([{"Content-type", "application/json"} | headers])
    |> handle_response()
  end

  @doc """
  Makes a PUT request to the given URL
  """
  @spec put(String.t(), map(), keyword()) ::
          {:ok, HttpWrapper.Response.t()} | {:error, HttpWrapper.Error.t()}
  def put(url, body, headers \\ []) do
    url
    |> HTTPoison.put(Jason.encode!(body), [{"Content-type", "application/json"} | headers])
    |> handle_response()
  end

  @doc """
  Makes a POST request to the given URL
  """
  @spec post(String.t(), map(), keyword()) ::
          {:ok, HttpWrapper.Response.t()} | {:error, HttpWrapper.Error.t()}
  def post(url, body, headers \\ []) do
    url
    |> HTTPoison.post(Jason.encode!(body), [{"Content-type", "application/json"} | headers])
    |> handle_response()
  end

  defp handle_response({:ok, response}), do: {:ok, HttpWrapper.Response.new!(response)}
  defp handle_response({:error, error}), do: {:error, HttpWrapper.Error.new!(error)}
end
