defmodule CatAlert.FakeAPIConnection do

  def get!(_cat_url) do
    CatAlert.APIHelper.cats_json()
  end
end
