defmodule CatAlertWeb.PageControllerTest do
  use CatAlertWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "cat alert"
  end
end
