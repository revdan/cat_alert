defmodule CatAlert.Notifier do
  alias CatAlert.Tweet

  def notify(cat) do
    # Email.new_cat(cat) |> Mailer.deliver_now
    # SMS.new_cat(cat)
    Tweet.new_cat(cat)
  end
end

