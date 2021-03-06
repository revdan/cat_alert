defmodule CatAlert.APIHelper do

  def cats_json() do
    %HTTPoison.Response{body:
      %{"animals" =>
         %{"0" => %{"field_animal_age" => "2012-02-15",
                    "field_animal_breed" => "himalayan",
                    "field_animal_cat_suitability" => "B - Not To Live With",
                    "field_animal_centre" => "battersea",
                    "field_animal_child_suitability" => "C - Can live with 13-16",
                    "field_animal_date_published" => "2018-04-10",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "", "field_animal_reserved" => "",
                    "field_animal_sex" => "Female", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001Ich7fUAB.jpeg",
                    "flagged" => 0, "nid" => 395090, "path" => "/cats/miss-lily",
                    "title" => "Miss Lily"},
           "1" => %{"field_animal_age" => "2014-07-04",
                    "field_animal_breed" => "domestic short-hair",
                    "field_animal_cat_suitability" => "A - Possibly Live With",
                    "field_animal_centre" => "battersea",
                    "field_animal_child_suitability" => "B - Can live with age 8-12",
                    "field_animal_date_published" => "2018-04-07",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "", "field_animal_reserved" => "Reserved",
                    "field_animal_sex" => "Male", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001KDmmfUAD.jpeg",
                    "flagged" => 0, "nid" => 400188, "path" => "/cats/hugo",
                    "title" => "Hugo"},
           "2" => %{"field_animal_age" => "2010-06-01",
                    "field_animal_breed" => "domestic short-hair",
                    "field_animal_cat_suitability" => "B - Not To Live With",
                    "field_animal_centre" => "battersea",
                    "field_animal_child_suitability" => "A - Can live with any age",
                    "field_animal_date_published" => "2018-04-06",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "", "field_animal_reserved" => "Reserved",
                    "field_animal_sex" => "Male", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001KDfTYUA1.jpeg",
                    "flagged" => 0, "nid" => 400090, "path" => "/cats/jasper",
                    "title" => "Jasper"},
           "3" => %{"field_animal_age" => "2014-02-06",
                    "field_animal_breed" => "domestic short-hair",
                    "field_animal_cat_suitability" => "B - Not To Live With",
                    "field_animal_centre" => "battersea",
                    "field_animal_child_suitability" => "B - Can live with age 8-12",
                    "field_animal_date_published" => "2018-04-03",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "", "field_animal_reserved" => "Reserved",
                    "field_animal_sex" => "Male", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001KDmyrUAD.jpeg",
                    "flagged" => 0, "nid" => 400145, "path" => "/cats/aro",
                    "title" => "Aro"},
           "4" => %{"field_animal_age" => "2012-05-07",
                    "field_animal_breed" => "domestic long-hair",
                    "field_animal_cat_suitability" => "B - Not To Live With",
                    "field_animal_centre" => "battersea",
                    "field_animal_child_suitability" => "C - Can live with 13-16",
                    "field_animal_date_published" => "2018-04-03",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "", "field_animal_reserved" => "",
                    "field_animal_sex" => "Male", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001KCwg9UAD.jpeg",
                    "flagged" => 0, "nid" => 399540, "path" => "/cats/gigsy",
                    "title" => "Gigsy"},
           "5" => %{"field_animal_age" => "2015-04-02",
                    "field_animal_breed" => "domestic long-hair",
                    "field_animal_cat_suitability" => "A - Possibly Live With",
                    "field_animal_centre" => "brands hatch",
                    "field_animal_child_suitability" => "B - Can live with age 8-12",
                    "field_animal_date_published" => "2018-04-02",
                    "field_animal_dog_suitability" => "B - Prefer To Live Alone",
                    "field_animal_rehomed" => "Rehomed", "field_animal_reserved" => "",
                    "field_animal_sex" => "Male", "field_animal_size" => "medium",
                    "field_animal_thumbnail" => "https://www.battersea.org.uk/sites/default/files/animal_images/00P0X00001KBDF5UAP.jpeg",
                    "flagged" => 0, "nid" => 399475, "path" => "/cats/norris",
                    "title" => "Norris"}}}}
  end
end
