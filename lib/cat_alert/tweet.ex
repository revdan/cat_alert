defmodule CatAlert.Tweet do
  require Logger

  def new_cat(cat) do
    Logger.info("new cat: #{inspect cat}")
    case Mix.env in [:dev, :test] do
      true  -> IO.inspect "no tweet sent in dev"
      false -> alert_new_cat(cat)
    end
  end

  defp alert_new_cat(cat) do
    admin_login()

    message = "CAT ALERT 🐈\n\n#{cat.name}\n\n#{cat.url}"

    case HTTPoison.get(cat.thumb_url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        ExTwitter.update_with_media(message, body)
      _ ->
        ExTwitter.update(message)
    end
  end

  defp admin_login do
    ExTwitter.configure(
      consumer_key: System.get_env("PUSSKIN_TWITTER_CONSUMER_KEY"),
      consumer_secret: System.get_env("PUSSKIN_TWITTER_CONSUMER_SECRET"),
      access_token: System.get_env("PUSSKIN_TWITTER_ACCESS_TOKEN"),
      access_token_secret: System.get_env("PUSSKIN_TWITTER_ACCESS_SECRET")
    )

    user_info = ExTwitter.verify_credentials()
    user_obj = %{
      name: user_info.name,
      screen_name: user_info.screen_name}

    {:ok, user_obj}
  end
end
