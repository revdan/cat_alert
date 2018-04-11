defmodule CatAlert.Application do
  use Application
  alias CatAlert.Time

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(CatAlert.Repo, []),
      supervisor(CatAlertWeb.Endpoint, []),
      worker(CatAlert.Periodically, [:find_new_cats, Time.minutes(10)], id: :find_new_cats),
      worker(CatAlert.Periodically, [:update_cats, Time.minutes(60)], id: :update_cats)
    ]

    opts = [strategy: :one_for_one, name: CatAlert.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    CatAlertWeb.Endpoint.config_change(changed, removed)

    :ok
  end
end
