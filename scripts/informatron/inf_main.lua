remote.add_interface("inf_248k", {
    informatron_menu = function(data)
      return inf_248k_menu(data.player_index)
    end,
    informatron_page_content = function(data)
      return inf_248k_page_content(data.page_name, data.player_index, data.element)
    end
  })
  
  function inf_248k_menu(player_index)
    return {
      ki1core=1,
      burner=1,
      diesel=1,
      fusion=1,
      starengine=1,
      exoticscience=1,
      blackhole=1
    }
  end
  
  function inf_248k_page_content(page_name, player_index, element)
    -- main page
    if page_name == "inf_248k" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_about"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_about_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_1"}

        element.add{type="label", name="text_3", caption={"gui.bk_248k_first_steps"}, style="heading_1_label"}
        element.add{type="label", name="text_4", caption={"gui.bk_248k_first_steps_text"}}
    end

    if page_name == "burner" then
      element.add{type="label", name="text_1", caption={"gui.inf_burner"}, style="heading_1_label"}
      element.add{type="label", name="text_2", caption={"gui.inf_burner_text"}}
      element.add{type="button", name="image_1", style="inf_248k_image_11"}
  end
    
    if page_name == "ki1core" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_ki1_core"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_ki1_core_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_3"}

        element.add{type="label", name="text_4", caption={"gui.bk_248k_ki2_core"}, style="heading_1_label"}
        element.add{type="label", name="text_3", caption={"gui.bk_248k_ki2_core_text"}}
        element.add{type="button", name="image_2", style="inf_248k_image_7"}
    end

    if page_name == "diesel" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_diesel_train"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_diesel_train_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_8"}
    end

    if page_name == "fusion" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_fusion"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_fusion_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_4"}

        element.add{type="label", name="text_3", caption={"gui.bk_248k_fusion_1_text"}}
        element.add{type="button", name="image_2", style="inf_248k_image_5"}

        element.add{type="label", name="text_4", caption={"gui.bk_248k_fusion_2_text"}}
    end

    if page_name == "starengine" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_star_engine"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_star_engine_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_6"}

        element.add{type="label", name="text_3", caption={"gui.bk_248k_star_engine_1_text"}}
        element.add{type="button", name="image_2", style="inf_248k_image_9"}
    end

    if page_name == "exoticscience" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_exotic_science"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_exotic_science_text"}}
    end

    if page_name == "blackhole" then
        element.add{type="label", name="text_1", caption={"gui.bk_248k_black_hole"}, style="heading_1_label"}
        element.add{type="label", name="text_2", caption={"gui.bk_248k_black_hole_text"}}
        element.add{type="button", name="image_1", style="inf_248k_image_10"}
    end

  
  end
  