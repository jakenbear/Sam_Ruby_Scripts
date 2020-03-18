#==============================================================================
# ** Always Sometimes Monsters: Core
#------------------------------------------------------------------------------
#  This is the core module for ASM which contains init code
#  and core functions needed for the game systems.
#==============================================================================

module ASM
  #--------------------------------------------------------------------------#
  # * Utility Functions
  #--------------------------------------------------------------------------#
  def self.check_any_key
    return true if Input.trigger?(Input::A)
    
    return true if Input.trigger?(Input::B)
    return true if Input.trigger?(Input::C)
    return true if Input.trigger?(Input::X)
    return true if Input.trigger?(Input::Y)
    return true if Input.trigger?(Input::Z)
    return true if Input.trigger?(Input::L)
    return true if Input.trigger?(Input::R)
  end
    
  # Fix for fullscreen image scaling
  # Change the fixed floats here to alter the resolution the
  # game assets were designed for (default: 544.0 x 416.0)
  def self.graphics_width_scale(upscale=false)
    base_factor = upscale ? 544.0 : 1280.0
    scale = (Graphics.width / base_factor)
    return scale
  end
  def self.graphics_height_scale(upscale=false)
    base_factor = upscale ? 416.0 : 720.0
    scale = (Graphics.height / base_factor)
    return scale
  end
  
  def self.global_pic_scale
    return false
  end
  
  def self.get_screen
    $game_party.in_battle ? $game_troop.screen : $game_map.screen
  end
    
  # Offloaded the functions from the menu interface elements here
  # that may need to be used by other elements, such as
  # stamina meters, portraits, etc.
  
  # Get location image filename based on current map, etc.
  def self.get_location
    mapdata = $data_mapinfos[$game_map.map_id]
    map_id = $game_map.map_id
    map_id_top = mapdata.parent_id
    data = true
    
    if !mapdata.nil?
      while data
        if mapdata.parent_id != 0
          map_id = map_id_top
          map_id_top = mapdata.parent_id
          mapdata = $data_mapinfos[mapdata.parent_id]
        else
          data = false
        end
      end
    end
    
    # Checks the Map ID of the second-level tree, in this case
    # it will us MAP 214 which is "4. Departure" and then use the Home
    # image
    # You can also check map_id_top to get the top level ID i.e. "__SAM__" etc.
    if !map_id.nil?
      case map_id
      when 214
        return "SAM_MenuLocation_Home"
      when 224
        return "SAM_MenuLocation_Bus"
      when 353
        return "SAM_MenuLocation_Portsmith"
      when 221
        return "SAM_MenuLocation_Sequoia"
      when 424
        return "SAM_MenuLocation_NewCreole"
      when 430
        return "SAM_MenuLocation_GatorBay"
      when 425  
        return "SAM_MenuLocation_SlabTown"
      else
        return "SAM_MenuLocation_Blank"
      end
    else
      return "SAM_MenuLocation_Blank"
    end
  end
  
  # Get store logo image filename based on variable, etc.
  def self.get_store_logo
    store_type = "None"
    case $game_variables[1252]
    when 0
      store_type = "Convenience"
    end
    return "SAM_Shop_Logo"
  end
  
  def self.get_deal_of_day
    deal_id = "000"
    case $game_variables[976]
    when 0
      deal_id = "001"
    end
    return "SAMPIC_Shops_DotD_" + deal_id
  end
  
  def self.get_shop_skin
    skin_tag = ""
    skin_num = $game_variables[1281]
    if skin_num > 0
      skin_tag = "-skin" + skin_num.to_s
    end
    return skin_tag
  end
  
  def self.cash_mode
    return $game_switches[1717]
  end
  
  def self.set_cash_mode(value)
    $game_switches[1717] = value
  end
  
  def self.fail_shop_transaction
    $game_temp.reserve_common_event(452)
  end
  
  def self.can_shoplift
    return $game_switches[1630]
  end
  
  def self.set_shoplifter(value)
    $game_switches[1623] = value
  end
  
  def self.set_goods_in_pocket(value)
    $game_switches[1624] = value
  end
  
  def self.increase_shoplifting_risk(value)
    $game_variables[1253] += value
  end
  
  # Check if player has their cellphone
  def self.has_phone
    return $game_switches[1527]
  end
  
  # Check if player has any notifications on their phone
  def self.has_phone_message
    return ASM::Phone::has_notifications
  end
  
  # Check if player has cell reception on their phone
  def self.has_phone_reception
    return !$game_switches[1597]
  end
  
  # Check if we should show the phone notification HUD
  def self.show_phone_hud
    return !$game_switches[2091]
  end
  
  # Get location image filename based on current phone wallpaper, etc
  def self.get_menu_phone_bg
    return "SAM_MenuPhone_BG" + $game_variables[1059].to_s
  end
  
  # Get location image filename based on current phone case, etc
  def self.get_menu_phone_case
    return "SAM_MenuPhone_Case" + $game_variables[1057].to_s
  end
  
  # Get notification image based on if there are notices on the phone
  def self.get_menu_phone_notification
    if self.has_phone_message
      return "SAM_MenuPhone_Notice_Msg"
    else
      return "SAM_MenuPhone_Notice_NoMsg"
    end
  end
  
  # Get location image filename based on current phone time, etc
  def self.get_menu_phone_time
    return "SAM_MenuPhone_Time_" + self.get_time_sam
  end
  
  # Get location image filename based on current phone day, etc
  def self.get_menu_phone_day
    day = self.get_day_sam
    if day == 0
      return "SAM_MenuPhone_Day_30"
    else
      if day <= 9
        return "SAM_MenuPhone_Day_0" + day.to_s
      else
        return "SAM_MenuPhone_Day_" + day.to_s
      end  
    end
  end
  
  # Get portrait image filenames based on current IDs.
  # Iko is lazy! I'm leaving these as dummies for now.
  # You'll have to query the main character and love interest IDs
  # and construct filenames, it'll then hunt the Pictures assets for them
  # when creating the layers
  def self.get_mc_portrait
    
	if $game_switches[1122] == true
	#=========================================
	#SAM MENU MODE BEGIN =====================
	#=========================================
  
  #============================
  # MENU MODE 0 - SHELLEY INTRO
  #============================
  if ($game_variables[940] == 0) 
    #SHELLY MODE - NO SECONDARY
  end
  
  #============================
  # MENU MODE 1 - PANEL 
  #============================
  if ($game_variables[940] == 1)  
    #PANEL - NO SECONDARY
  end
  
  #============================
  # MENU MODE 2 - HOUSE THEN BUS AND BEYOND
  #============================
  if ($game_variables[940] == 2)  
    #BUS AND BEYOND
    
    if ($game_variables[1099] == 0) #LIVING IN HOUSE - PERMA LOVER 
    #
    
    if ($game_variables[863] == 1)  
    return "SAM_MENU_LOVER_1"
    end
    
    if ($game_variables[863] == 2)  
    return "SAM_MENU_LOVER_2"
    end
    
    if ($game_variables[863] == 3)  
    return "SAM_MENU_LOVER_3"
    end
  
    if ($game_variables[863] == 4)  
    return "SAM_MENU_LOVER_4"
    end
  
    if ($game_variables[863] == 5)  
    return "SAM_MENU_LOVER_5"
    end
  
    if ($game_variables[863] == 6)  
    return "SAM_MENU_LOVER_6"
    end
  
    if ($game_variables[863] == 7)  
    return "SAM_MENU_LOVER_7"
    end
  
    if ($game_variables[863] == 8)  
    return "SAM_MENU_LOVER_8"
    end
  
    if ($game_variables[863] == 9)  
    return "SAM_MENU_LOVER_9"
    end
  
    if ($game_variables[863] == 10)  
    return "SAM_MENU_LOVER_10"
    end
  
    if ($game_variables[863] == 11)  
    return "SAM_MENU_LOVER_11"
    end
  
    if ($game_variables[863] == 12)  
    return "SAM_MENU_LOVER_12"
    end
  
    end # perma lover house mode
  
    if ($game_variables[1099] == 1) #BUS TOUR BEGAN 
    #
    #EMPTY PARTY
    if ($game_variables[1010] == 0)  
    #
    end
  
    #BUS FRIEND 1
    if ($game_variables[1010] == 1)  
    return "SAM_MENU_BF1"
    end
  
    #BUS FRIEND 2
    if ($game_variables[1010] == 2)  
    return "SAM_MENU_BF2"
    end
  
    #BUS FRIEND 3
    if ($game_variables[1010] == 3)  
    return "SAM_MENU_BF3"
    end
  
    #BUS FRIEND 4
    if ($game_variables[1010] == 4)  
    return "SAM_MENU_BF4"
    end
  
    #BUS FRIEND 5
    if ($game_variables[1010] == 5)  
    return "SAM_MENU_BF5"
    end
  
    #BUS FRIEND 6
    if ($game_variables[1010] == 6)  
    return "SAM_MENU_BF6"
    end
  
    #BUS FRIEND 7
    if ($game_variables[1010] == 7)  
    return "SAM_MENU_BF7"
    end
   
    #BUS FRIEND 8
    if ($game_variables[1010] == 8)  
    return "SAM_MENU_BF8"
    end
  
    #BUS FRIEND 9
    if ($game_variables[1010] == 9)  
    return "SAM_MENU_BF9"
    end
   
    #BUS FRIEND 10
    if ($game_variables[1010] == 10)  
    return "SAM_MENU_BF10"
    end
  
    #BUS FRIEND 11 (LOVER)
    if ($game_variables[1010] == 11)  
    #ADD LOVER LOGIC HERE
        if ($game_variables[863] == 1)  
        return "SAM_MENU_LOVER_1"
        end
    
        if ($game_variables[863] == 2)  
        return "SAM_MENU_LOVER_2"
        end
    
        if ($game_variables[863] == 3)  
        return "SAM_MENU_LOVER_3"
        end
  
        if ($game_variables[863] == 4)  
        return "SAM_MENU_LOVER_4"
        end
  
        if ($game_variables[863] == 5)  
        return "SAM_MENU_LOVER_5"
        end
  
        if ($game_variables[863] == 6)  
        return "SAM_MENU_LOVER_6"
        end
  
        if ($game_variables[863] == 7)  
        return "SAM_MENU_LOVER_7"
        end
  
        if ($game_variables[863] == 8)  
        return "SAM_MENU_LOVER_8"
        end
  
        if ($game_variables[863] == 9)  
        return "SAM_MENU_LOVER_9"
        end
  
        if ($game_variables[863] == 10)  
        return "SAM_MENU_LOVER_10"
        end
  
        if ($game_variables[863] == 11)  
        return "SAM_MENU_LOVER_11"
        end
  
        if ($game_variables[863] == 12)  
        return "SAM_MENU_LOVER_12"
        end
    
    end # end lover accompany mode
    #
    end # on the rod mode
    
  end #mode 2
  
	#=========================================
	#SAM MENU MODE END========================
	#=========================================
	
	else
	#ASM MENU MODE BEGIN
	if ($game_variables[774] == 0)  #PLAYER IS NOT SAM
    
    #NORMAL PLAYER - BEGIN
    if ($game_variables[781] == 0)
    
    if ($game_variables[120] == 0)  #M001
    return "M001"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006"
    end 
  
    end  
    #NORMAL PLAYER - END
    
    #WHITE FANCY PLAYER - BEGIN (SUIT)
    if ($game_variables[781] == 1)
    
    if ($game_variables[120] == 0)  #M001
    return "M001_WHITE"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_WHITE"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_WHITE"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_WHITE"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_WHITE"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_WHITE"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_WHITE"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_WHITE"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_WHITE"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_WHITE"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_WHITE"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_WHITE"
    end 
  
    end  
    #WHITE FANCY PLAYER - END
    
    #BLACK FANCY PLAYER - BEGIN
    if ($game_variables[781] == 2)
    
    if ($game_variables[120] == 0)  #M001
    return "M001_BLACK"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_BLACK"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_BLACK"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_BLACK"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_BLACK"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_BLACK"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_BLACK"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_BLACK"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_BLACK"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_BLACK"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_BLACK"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_BLACK"
    end 
  
    end  
    #BLACK FANCY PLAYER - END
    
    #GREY FANCY PLAYER - BEGIN
    if ($game_variables[781] == 3)
    
    if ($game_variables[120] == 0)  #M001
    return "M001_GREY"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_GREY"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_GREY"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_GREY"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_GREY"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_GREY"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_GREY"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_GREY"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_GREY"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_GREY"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_GREY"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_GREY"
    end
  
    end  
    #GREY FANCY PLAYER - END (SUIT)
    
    #WHITE FANCY PLAYER - BEGIN (DRESS)
    if ($game_variables[781] == 4)
    
        if ($game_variables[120] == 0)  #M001
    return "M001_WHITE_X"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_WHITE_X"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_WHITE_X"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_WHITE_X"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_WHITE_X"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_WHITE_X"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_WHITE_X"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_WHITE_X"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_WHITE_X"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_WHITE_X"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_WHITE_X"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_WHITE_X"
    end 
  
    end
    #WHITE FANCY PLAYER - END (DRESS)
    
    #BLACK FANCY PLAYER - BEGIN (DRESS)
    if ($game_variables[781] == 5)
    
    if ($game_variables[120] == 0)  #M001
    return "M001_BLACK_X"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_BLACK_X"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_BLACK_X"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_BLACK_X"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_BLACK_X"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_BLACK_X"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_BLACK_X"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_BLACK_X"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_BLACK_X"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_BLACK_X"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_BLACK_X"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_BLACK_X"
    end 
  
    end
    #BLACK FANCY PLAYER - END (DRESS)
    
    #GREY FANCY PLAYER - BEGIN (DRESS)
    if ($game_variables[781] == 6)
    
    if ($game_variables[120] == 0)  #M001
    return "M001_GREY_X"
    end
  
    if ($game_variables[120] == 1)  #M002
    return "M002_GREY_X"
    end
  
    if ($game_variables[120] == 2)  #M003
    return "M003_GREY_X"     
    end
 
    if ($game_variables[120] == 3)  #M004
    return "M004_GREY_X"
    end
  
    if ($game_variables[120] == 4)  #M005
    return "M005_GREY_X"
    end
  
    if ($game_variables[120] == 5)  #M006
    return "M006_GREY_X"
    end
    
    if ($game_variables[120] == 6)  #M007
    return "F001_GREY_X"
    end
  
    if ($game_variables[120] == 7)  #M008
    return "F002_GREY_X"
    end 
  
    if ($game_variables[120] == 8)  #M009
    return "F003_GREY_X"
    end 
  
    if ($game_variables[120] == 9)  #M010
    return "F004_GREY_X"
    end 
  
    if ($game_variables[120] == 10)  #M011
    return "F005_GREY_X"
    end 
  
    if ($game_variables[120] == 11)  #M012
    return "F006_GREY_X"
    end
  
    end
    #GREY FANCY PLAYER - END (DRESS)
    
    else # PLAYER is SAM
    
    #SAM - NO SUIT  
    if ($game_variables[764] == 0)
    
    if ($game_variables[442] == 1)
    return "SAM_01_MENU"
    end
    
    if ($game_variables[442] == 2)
    return "SAM_02_MENU"
    end
  
    if ($game_variables[442] == 3)
    return "SAM_03_MENU"
    end
  
    if ($game_variables[442] == 4)
    return "SAM_04_MENU"
    end
  
    if ($game_variables[442] == 5)
    return "SAM_05_MENU"
    end
  
    if ($game_variables[442] == 6)
    return "SAM_06_MENU"
    end
    
    if ($game_variables[442] == 7)
    return "SAM_07_MENU"
    end
    
    if ($game_variables[442] == 8)
    return "SAM_08_MENU"
    end
  
    end
    #SAM - NO SUIT - END
    
    #SAM - WHITE SUIT  
    if ($game_variables[764] == 1)
    
    if ($game_variables[442] == 1)
    return "SAM_01_MENU_WHITE"
    end
    
    if ($game_variables[442] == 2)
    return "SAM_02_MENU_WHITE"
    end
  
    if ($game_variables[442] == 3)
    return "SAM_03_MENU_WHITE"
    end
  
    if ($game_variables[442] == 4)
    return "SAM_04_MENU_WHITE"
    end
  
    if ($game_variables[442] == 5)
    return "SAM_05_MENU_WHITE"
    end
  
    if ($game_variables[442] == 6)
    return "SAM_06_MENU_WHITE"
    end
    
    if ($game_variables[442] == 7)
    return "SAM_07_MENU_WHITE"
    end
    
    if ($game_variables[442] == 8)
    return "SAM_08_MENU_WHITE"
    end
  
    end
    #SAM - WHITE SUIT - END
    
    #SAM - BLACK SUIT  
    if ($game_variables[764] == 2)
    
    if ($game_variables[442] == 1)
    return "SAM_01_MENU_BLACK"
    end
    
    if ($game_variables[442] == 2)
    return "SAM_02_MENU_BLACK"
    end
  
    if ($game_variables[442] == 3)
    return "SAM_03_MENU_BLACK"
    end
  
    if ($game_variables[442] == 4)
    return "SAM_04_MENU_BLACK"
    end
  
    if ($game_variables[442] == 5)
    return "SAM_05_MENU_BLACK"
    end
  
    if ($game_variables[442] == 6)
    return "SAM_06_MENU_BLACK"
    end
    
    if ($game_variables[442] == 7)
    return "SAM_07_MENU_BLACK"
    end
    
    if ($game_variables[442] == 8)
    return "SAM_08_MENU_BLACK"
    end
  
    end
    #SAM - BLACK SUIT - END
    
    #SAM - GREY SUIT
    if ($game_variables[764] == 3)
    
    if ($game_variables[442] == 1)
    return "SAM_01_MENU_GREY"
    end
    
    if ($game_variables[442] == 2)
    return "SAM_02_MENU_GREY"
    end
  
    if ($game_variables[442] == 3)
    return "SAM_03_MENU_GREY"
    end
  
    if ($game_variables[442] == 4)
    return "SAM_04_MENU_GREY"
    end
  
    if ($game_variables[442] == 5)
    return "SAM_05_MENU_GREY"
    end
  
    if ($game_variables[442] == 6)
    return "SAM_06_MENU_GREY"
    end
    
    if ($game_variables[442] == 7)
    return "SAM_07_MENU_GREY"
    end
    
    if ($game_variables[442] == 8)
    return "SAM_08_MENU_GREY"
    end
  
    end 
    #SAM - GREY SUIT - END
  
  end # PLAYER SELECTION
	
#ASM MENU MODE END
end
end # def - GET PORTRAIT
 
  def self.get_li_portrait
    
   if $game_switches[1122] == true
	#=========================================
	#SAM MENU MODE BEGIN =====================
	#=========================================
	
  #============================
  # MENU MODE 0 - SHELLEY INTRO
  #============================
  if ($game_variables[940] == 0)  
     return "SAM_MENU_SHELLEY"
  end
  
  #============================
  # MENU MODE  - PANEL + HOUSE
  #============================
  if ($game_variables[940] >= 1)  #SAM MENU MODE 1
    # main mode
    if ($game_variables[862] == 1)  #PLAYER 1 (Male 1)
    return "SAM_MENU_P1"
    end 
  
    if ($game_variables[862] == 2)  #PLAYER 2 (Male 2)
    return "SAM_MENU_P2"
    end 
    
    if ($game_variables[862] == 3)  #PLAYER 3 (Male 3)
    return "SAM_MENU_P3"
    end 
  
    if ($game_variables[862] == 4)  #PLAYER 4 (Male 4)
    return "SAM_MENU_P4"
    end 
  
    if ($game_variables[862] == 5)  #PLAYER 5 (Male 5)
    return "SAM_MENU_P5"
    end  
  
    if ($game_variables[862] == 6)  #PLAYER 6 (Male 6)
    return "SAM_MENU_P6"
    end 
  
    if ($game_variables[862] == 7)  #PLAYER 7 (feMale 1)
    return "SAM_MENU_P7"
    end 
  
    if ($game_variables[862] == 8)  #PLAYER 8 (feMale 2)
    return "SAM_MENU_P8"
    end 
  
    if ($game_variables[862] == 9)  #PLAYER 9 (feMale 3)
    return "SAM_MENU_P9"
    end 
  
    if ($game_variables[862] == 10)  #PLAYER 10 (feMale 4)
    return "SAM_MENU_P10"
    end 
  
    if ($game_variables[862] == 11)  #PLAYER 11 (feMale 5)
    return "SAM_MENU_P11"
    end 
  
    if ($game_variables[862] == 12)  #PLAYER 12 (feMale 6)
    return "SAM_MENU_P12"
    end 
  
    if ($game_variables[862] == 13)  #PLAYER 13 (Male sam 1)
    return "SAM_MENU_P13"
    end 
  
    if ($game_variables[862] == 14)  #PLAYER 14 (Male sam 2)
    return "SAM_MENU_P14"
    end 
  
    if ($game_variables[862] == 15)  #PLAYER 15 (Male sam 3)
    return "SAM_MENU_P15"
    end 
  
    if ($game_variables[862] == 16)  #PLAYER 16 (Male sam 4)
    return "SAM_MENU_P16"
    end 
  
    if ($game_variables[862] == 17)  #PLAYER 17 (feMale sam 1)
    return "SAM_MENU_P17"
    end 
  
    if ($game_variables[862] == 18)  #PLAYER 18 (feMale sam 2)
    return "SAM_MENU_P18"
    end 
  
    if ($game_variables[862] == 19)  #PLAYER 19 (feMale sam 3)
    return "SAM_MENU_P19"
    end 
  
    if ($game_variables[862] == 20)  #PLAYER 20 (feMale sam 4)
    return "SAM_MENU_P20"
    end 
    
    # end main mode
  end
  
   
   #=========================================
   #SAM MENU MODE END =====================
   #=========================================
	
	else
    
	#ASM MENU MODE ====
    # LOVER - NORMAL
    if ($game_variables[782] == 0)
      
    if ($game_variables[125] == 0)  #LOVER M007
    return "M007"
    end 
  
    if ($game_variables[125] == 1)  #LOVER M008
    return "M008"
    end 
  
    if ($game_variables[125] == 2)  #LOVER M009
    return "M009"
    end 
  
    if ($game_variables[125] == 3)  #LOVER M010
    return "M010"
    end 
    
    if ($game_variables[125] == 4)  #LOVER M011
    return "M011"
    end 
  
    if ($game_variables[125] == 5)  #LOVER M012
    return "M012"
    end 
  
    if ($game_variables[125] == 6)  #LOVER F007
    return "F007"
    end
  
    if ($game_variables[125] == 7)  #LOVER F008
    return "F008"
    end
  
    if ($game_variables[125] == 8)  #LOVER F009
    return "F009"
    end
  
    if ($game_variables[125] == 9)  #LOVER F010
    return "F010"
    end
  
    if ($game_variables[125] == 10)  #LOVER F011
    return "F011"
    end
  
    if ($game_variables[125] == 11)  #LOVER F012
    return "F012"
    end
  
    end
    # LOVER - NORMAL
    
    # LOVER - WHITE
    if ($game_variables[782] == 1)
      
    if ($game_variables[125] == 0)  #LOVER M007
    return "M007_WHITE"
    end 
  
    if ($game_variables[125] == 1)  #LOVER M008
    return "M008_WHITE"
    end 
  
    if ($game_variables[125] == 2)  #LOVER M009
    return "M009_WHITE"
    end 
  
    if ($game_variables[125] == 3)  #LOVER M010
    return "M010_WHITE"
    end 
    
    if ($game_variables[125] == 4)  #LOVER M011
    return "M011_WHITE"
    end 
  
    if ($game_variables[125] == 5)  #LOVER M012
    return "M012_WHITE"
    end 
  
    if ($game_variables[125] == 6)  #LOVER F007
    return "F007_WHITE"
    end
  
    if ($game_variables[125] == 7)  #LOVER F008
    return "F008_WHITE"
    end
  
    if ($game_variables[125] == 8)  #LOVER F009
    return "F009_WHITE"
    end
  
    if ($game_variables[125] == 9)  #LOVER F010
    return "F010_WHITE"
    end
  
    if ($game_variables[125] == 10)  #LOVER F011
    return "F011_WHITE"
    end
  
    if ($game_variables[125] == 11)  #LOVER F012
    return "F012_WHITE"
    end
  
    end
    # LOVER - WHITE
    
    # LOVER - BLACK
    if ($game_variables[782] == 2)
      
    if ($game_variables[125] == 0)  #LOVER M007
    return "M007_BLACK"
    end 
  
    if ($game_variables[125] == 1)  #LOVER M008
    return "M008_BLACK"
    end 
  
    if ($game_variables[125] == 2)  #LOVER M009
    return "M009_BLACK"
    end 
  
    if ($game_variables[125] == 3)  #LOVER M010
    return "M010_BLACK"
    end 
    
    if ($game_variables[125] == 4)  #LOVER M011
    return "M011_BLACK"
    end 
  
    if ($game_variables[125] == 5)  #LOVER M012
    return "M012_BLACK"
    end 
  
    if ($game_variables[125] == 6)  #LOVER F007
    return "F007_BLACK"
    end
  
    if ($game_variables[125] == 7)  #LOVER F008
    return "F008_BLACK"
    end
  
    if ($game_variables[125] == 8)  #LOVER F009
    return "F009_BLACK"
    end
  
    if ($game_variables[125] == 9)  #LOVER F010
    return "F010_BLACK"
    end
  
    if ($game_variables[125] == 10)  #LOVER F011
    return "F011_BLACK"
    end
  
    if ($game_variables[125] == 11)  #LOVER F012
    return "F012_BLACK"
    end
  
    end
    # LOVER - BLACK
    
    # LOVER - GREY
    if ($game_variables[782] == 3)
    
        if ($game_variables[125] == 0)  #LOVER M007
    return "M007_GREY"
    end 
  
    if ($game_variables[125] == 1)  #LOVER M008
    return "M008_GREY"
    end 
  
    if ($game_variables[125] == 2)  #LOVER M009
    return "M009_GREY"
    end 
  
    if ($game_variables[125] == 3)  #LOVER M010
    return "M010_GREY"
    end 
    
    if ($game_variables[125] == 4)  #LOVER M011
    return "M011_GREY"
    end 
  
    if ($game_variables[125] == 5)  #LOVER M012
    return "M012_GREY"
    end 
  
    if ($game_variables[125] == 6)  #LOVER F007
    return "F007_GREY"
    end
  
    if ($game_variables[125] == 7)  #LOVER F008
    return "F008_GREY"
    end
  
    if ($game_variables[125] == 8)  #LOVER F009
    return "F009_GREY"
    end
  
    if ($game_variables[125] == 9)  #LOVER F010
    return "F010_GREY"
    end
  
    if ($game_variables[125] == 10)  #LOVER F011
    return "F011_GREY"
    end
  
    if ($game_variables[125] == 11)  #LOVER F012
    return "F012_GREY"
    end
  
    end
    # LOVER - GREY
  end #ASM MODE
  end #end LI Function
  
  # Iko is lazy! Currently dummy function, but replace the code below so
  # that it returns the right value for the current number of segments of
  # stamina the player has.
def self.get_stamina
    #########################
     #PLAYER STAMINA BAR LOGIC
     if ($game_actors[1].hp <= 0)
     return 0
     end
     if ($game_actors[1].hp == 1)
     return 0
     end
     if (($game_actors[1].hp > 1) and ($game_actors[1].hp <= 10))
     return 1
     end
     if (($game_actors[1].hp > 10) and ($game_actors[1].hp <= 20))
     return 1
     end
     if (($game_actors[1].hp > 20) and ($game_actors[1].hp <= 30))
     return 2
     end
     if (($game_actors[1].hp > 30) and ($game_actors[1].hp <= 40))
     return 2
     end
     if (($game_actors[1].hp > 40) and ($game_actors[1].hp <= 50))
     return 3
     end
     if (($game_actors[1].hp > 50) and ($game_actors[1].hp <= 60))
     return 3
     end
     if (($game_actors[1].hp > 60) and ($game_actors[1].hp <= 70))
     return 4  
     end
     if (($game_actors[1].hp > 70) and ($game_actors[1].hp <= 80))
     return 4
     end
     if (($game_actors[1].hp > 80) and ($game_actors[1].hp <= 90))
     return 5
     end
     if ($game_actors[1].hp > 90)
     return 5
     end
     ###########################
     #END PLAYER STAMINA LOGIC 
     ###########################
  end
  
  # Iko is lazy! Currently dummy function, but replace the code below so it
  # returns the time of day as a string, either "Day" "Evening" or "Night"
  def self.get_time
    
    if $game_switches[25] #Day
    return "Day"
    end
    
    if $game_switches[26] #NIGHT
    return "Evening"
    end
  
    if $game_switches[27] #Twigh
    return "Night"
    end
      
  end
  
  def self.get_time_sam
    case $game_variables[916]
    when 3
      return "Morning"
    when 2
      return "Day"
    when 1
      return "Night"
    else
      return "Night"
    end
  end
  
  # Iko is lazy! Currently dummy function, but replace the code below so it
  # returns the current day as a number
  def self.get_day
    #return $game_variables[12]
    return $game_variables[441]
  end
  
  def self.get_day_sam
    return $game_variables[891] % 30 
  end
  
  def self.display_peeble(autoclose=false)
    if autoclose
      SceneManager.call(Scene_PeebleAuto)
    else
      SceneManager.call(Scene_Peeble)
    end
  end
end #ASM CORE

#--------------------------------------------------------------------------#
# * ASM_Time - Adds basic delta time
#--------------------------------------------------------------------------#
class ASM_Time
  attr_reader :time
  attr_reader :delta
  
  def initialize
    @time = @lasttime = Time.now
    @delta = 0
  end
  
  def update
    @time = Time.now
    @delta = @time - @lasttime
    @lasttime = @time
  end
end

#--------------------------------------------------------------------------#
# * ASM_Parallax - Adds support for graphic layers that scroll on the X axis
#--------------------------------------------------------------------------#
class ASM_Parallax
  def initialize(picture, viewport, speed = 1, depth = 0)
    @parallax = Plane.new(viewport)
    @parallax.z = depth
    @parallax.bitmap = Cache.picture(picture)
    @parallax.zoom_x = ASM::graphics_width_scale
    @parallax.zoom_y = ASM::graphics_height_scale
    @parallax_x = 0
    @parallax_speed = speed
  end
  
  def update
    @parallax_x += @parallax_speed / 64.0
    @parallax.ox = @parallax_x * 16
  end
  
  def dispose
    @parallax.bitmap.dispose if !@parallax.bitmap.nil?
    @parallax.dispose
  end
end

#--------------------------------------------------------------------------#
# * ASM_Tween - Adds support for tweening sprites
#--------------------------------------------------------------------------#
#  http://pastebin.com/raw.php?i=kHFzYQcq
#--------------------------------------------------------------------------#
class ASM_Tween  
  attr_reader :finished
  attr_reader :ease
  attr_reader :time
  
  SMOOTH_FACTOR = 1000
  
  def initialize(start, finish, easing, duration)
    @start, @finish = start, finish
    @easing, @duration = easing, duration
    unless @start.is_a? Enumerable
      @start = [@start]
    end
    unless @finish.is_a? Enumerable
      @finish = [@finish]
    end
    @time = 0
    @finished = false
  end
  
  def update
    @time += $time.delta * SMOOTH_FACTOR
    if @time > @duration
      @time = @duration
      @finished = true
    end
  end
  
  def [](key)
    @easing.ease(
      @time,
      @start[key],
      (@finish[key] - @start[key]),
      @duration
    )
  end
  
  def value; self[0]; end
  def x; self[0]; end
  def y; self[1]; end
  def z; self[2]; end
    
  def get_value(key)
    self[key]
  end
  
  module Linear
    def self.ease(time, start, change, duration)
      change * time / duration + start
    end
  end
end

#--------------------------------------------------------------------------#
# * ASM_Layer - Adds support for graphic layers such as interface images
#--------------------------------------------------------------------------#
class ASM_Layer < Sprite
	attr_reader	:image
  attr_reader :move_tween
  attr_reader :fade_tween
  
  #--------------------------------------------------------------------------#
  # * Initialise Layer
  #--------------------------------------------------------------------------#
  def initialize(viewport = nil)
    super(viewport)
    @image = ""
    @origin = 0
    @rotate_speed = 0
    @base_angle = 0
    @image_change = false
    @origin_change = false
    @base_width = -1
    @base_height = -1
  end
  
  #--------------------------------------------------------------------------#
  # * Dispose Layer and Stop Tweens
  #--------------------------------------------------------------------------#
  def dispose
    stop_tween
    super
  end
  
  def set_angle(amount)
    @base_angle = amount
    self.update
  end
  
  def set_base_width(amount)
    @base_width = amount
    self.update
  end
  
  def set_base_height(amount)
    @base_height = amount
    self.update
  end
  
  #--------------------------------------------------------------------------#
  # * Set Image
  #--------------------------------------------------------------------------#
  def set_image(filename)
    @image = filename
    bitmap.dispose if !bitmap.nil?
    @image_change = true
    self.update
  end
  
  #--------------------------------------------------------------------------#
  # * Set Origin
  #--------------------------------------------------------------------------#
  #  0 = Top Left
  #  1 = Top Right
  #  2 = Bottom Right
  #  3 = Bottom Left
  #  4+ = Centre
  #--------------------------------------------------------------------------#
  def set_origin(origin)
    @origin = origin
    @origin_change = true
    self.update
  end
	
	def set_opacity(opacity)
		self.opacity = opacity
		self.update
	end
  
  #--------------------------------------------------------------------------#
  # * Move Layer
  #--------------------------------------------------------------------------#
  def move(new_x, new_y, duration=1, style=ASM_Tween::Linear)
    @move_tween = ASM_Tween.new([self.x.to_f, self.y.to_f], [new_x, new_y], style, duration)
  end
  
  #--------------------------------------------------------------------------#
  # * Fade Layer
  #--------------------------------------------------------------------------#
  def fade(new_opacity, duration=1, style=ASM_Tween::Linear)
    @fade_tween = ASM_Tween.new([self.opacity.to_f], [new_opacity.to_f], style, duration)
  end
  
  #--------------------------------------------------------------------------#
  # * Rotate Layer
  #--------------------------------------------------------------------------#
  def rotate(speed)
    @rotate_speed = speed
  end
  
  #--------------------------------------------------------------------------#
  # * Stop Layer Tweens
  #--------------------------------------------------------------------------#
  def stop_tween
    @move_tween = nil
    @fade_tween = nil
  end
  
  #--------------------------------------------------------------------------#
  # * Update Functions
  #--------------------------------------------------------------------------#
  def update
    super
    update_image if @image_change
    update_base_width
    update_base_height
    update_origin if @origin_change
    update_tween
    update_angle
    update_rotate
  end
  
  def update_image
    if @image.nil?
      self.bitmap = nil
    else
      self.bitmap = Cache.picture(@image)
    end
  end
  
  def update_origin
    if bitmap.nil?
      self.ox = 0
      self.oy = 0
    else
      case @origin
      when 0
        self.ox = 0
        self.oy = 0
      when 1
        self.ox = bitmap.width
        self.oy = 0
      when 2
        self.ox = bitmap.width
        self.oy = bitmap.height
      when 3
        self.ox = 0
        self.oy = bitmap.height
      else
        self.ox = bitmap.width / 2
        self.oy = bitmap.height / 2
      end
    end
  end
  
  def update_tween
    if !@move_tween.nil?
      @move_tween.update
      self.x, self.y = @move_tween.x, @move_tween.y
      @move_tween = nil if @move_tween.finished
    end
    if !@fade_tween.nil?
      @fade_tween.update
      self.opacity = @fade_tween.value
      @fade_tween = nil if @fade_tween.finished
    end
  end
  
  def update_base_width
    if (@base_width >= 0)
      rect = self.src_rect
      rect.width = @base_width
      self.src_rect.set(rect)
    end
  end
  
  def update_base_height
    if (@base_height >= 0)
      rect = self.src_rect
      rect.height = @base_height
      self.src_rect.set(rect)
    end
  end
  
  def update_angle
    if @rotate_speed == 0
      self.angle = @base_angle
      self.angle %= 360
    end
  end
  
  def update_rotate
    return if @rotate_speed == 0
    self.angle += @rotate_speed * $time.delta
    self.angle += 360 while self.angle < 0
    self.angle %= 360
  end
end

class Game_Picture
  alias sam_game_picture_show show
  def show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)    
    if ASM::global_pic_scale
      width_scale = ASM::graphics_width_scale
      height_scale = ASM::graphics_height_scale
      
      if origin == 0
        new_x = x * width_scale
        new_y = y * height_scale
      else
        new_x = x
        new_y = y
      end
      
      new_zoom_x = zoom_x * width_scale
      new_zoom_y = zoom_y * height_scale
      
      sam_game_picture_show(name, origin, new_x, new_y, new_zoom_x, new_zoom_y, opacity, blend_type)
    else
      sam_game_picture_show(name, origin, x, y, zoom_x, zoom_y, opacity, blend_type)
    end
  end
end