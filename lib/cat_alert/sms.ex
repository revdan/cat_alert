defmodule CatAlert.SMS do
  require Logger
  @base_url "#{System.get_env("BLOWERIO_URL")}messages"

  def new_cat(cat) do
    form = {:form, [to: "", message: "CAT ALERT 🐈\n\n#{cat.name}\n#{cat.url}"]}
    headers = ["Accepts": "application/json", "content-type": "application/x-www-form-urlencoded"]
    options = [ssl: [{:versions, [:'tlsv1.2']}], recv_timeout: 5000]

    case HTTPoison.post(@base_url, form, headers, options) do
      {:ok, response} -> Logger.info("ok: #{inspect response}")
      {:error, _}     -> Logger.error("err: #{inspect form}")
    end
  end
end
