defmodule CatAlert.CatAPITest do
  use CatAlert.DataCase
  use ExUnit.Case

  alias CatAlert.{Cat, CatAPI}

  describe "get/1" do
    test ":find_new_cats" do
      body = CatAPI.get(:find_new_cats)

      assert length(body) == 6
      assert {:ok, %Cat{name: "Miss Lily"}} = hd(body)
    end

    test ":find_new_cats doesn't overwrite" do
      CatAPI.get(:find_new_cats)
      body = CatAPI.get(:find_new_cats)

      assert length(body) == 6
      assert {:error, %Ecto.Changeset{changes: %{name: "Miss Lily"}}} = hd(body)
    end
  end
end
