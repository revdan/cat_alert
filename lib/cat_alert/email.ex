defmodule CatAlert.Email do
  require Logger
  import Bamboo.Email

  def new_cat(cat) do
    new_email(
      to: "cats@drj.xxx",
      bcc: recipients(),
      from: "cats@drj.xxx",
      subject: "NEW FRIEND: #{cat.name}",
      html_body: """
        <div>
          <h1>#{cat.name}</h1>
          <br>
          <a href=\"#{cat.url}\">#{cat.url}</a>
          <br>
          <img src=\"#{cat.thumb_url}\">
        </div>
      """,
      text_body: """
      #{cat.url}
      """
    )
  end

  defp recipients() do
    case Mix.env in [:dev, :test] do
      true  -> [""]
      false -> ["cats@drj.xxx"]
    end
  end
end
