defmodule CatAlert.APIConnection do
  use HTTPoison.Base

  @base_url "https://www.battersea.org.uk"

  def process_url(url) do
    @base_url <> url
  end

  def process_request_options(options \\ []) do
    options ++ [ssl: [{:versions, [:'tlsv1.2']}]]
  end

  def process_response_body(body) do
    Poison.decode!(body)
  end
end
