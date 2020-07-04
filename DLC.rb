class Game_Event < Game_Character

 #--------------------------------------------------------------------------
  # * Set Up Event Page Settings
  #--------------------------------------------------------------------------
  def setup_page_settings
    @tile_id          = @page.graphic.tile_id
    @character_name   = @page.graphic.character_name
    
    #DOGGY DLC ----- BEGIN
    # TYSON HAT
    if $game_variables[2401] > 0  
      if @character_name == "!$ANNIMAL_TYSON"
        @character_name = "!$ANNIMAL_TYSON_" + $game_variables[2401].to_s
      end
      
      if @character_name == "!$ANIMAL_TYSON_PANT%(6)"
        @character_name = "!$ANIMAL_TYSON_PANT_" + 
                           $game_variables[2401].to_s + "%(6)"
      end
    end
    
    #LADYBIRD HAT
    if $game_variables[2402] > 0  
      if @character_name == "!$ANNIMAL_LADYBIRD"
        @character_name = "!$ANNIMAL_LADYBIRD_" + $game_variables[2402].to_s
      end
      
      if @character_name == "!$ANIMAL_LADYBIRD_PANT%(6)"
        @character_name = "!$ANIMAL_LADYBIRD_PANT_" + 
                           $game_variables[2402].to_s + "%(6)"
      end
    end
    #DOGGY DLC ----- END
    
    #BUS FRIENDS DLC ----- BEGIN
    
    #BF_01 #####
    if $game_variables[2411] > 0  
      
      foo = $game_variables[2411].to_s  
      
      if @character_name == "!$SAMCHAR_BF01_Sit"
        @character_name = "!$SAMCHAR_BF01_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF01_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF01_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF01"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF01_" + foo
      end
      if @character_name == "!$SAMCHAR_sitIdle_BF01"
        @character_name = "!$SAMCHAR_sitIdle_BF01_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF01"
        @character_name = "!$SAMCHAR_SitSlicer_BF01_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF01"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF01_" + foo
      end
      if @character_name == "$SAMBF01_BigDeal%(6 0)"
        @character_name = "$SAMBF01_BigDeal_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF01_BigDeal%(6)"
        @character_name = "$SAMBF01_BigDeal_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF01_idleDefault_BigDeal%(6)"
        @character_name = "$SAMBF01_idleDefault_BigDeal_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_BF_BigDeal_smoking%(27)"
        @character_name = "$SAMCHAR_BF_BigDeal_smoking_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF_BigDeal_smoking_idle%(8)"
        @character_name = "$SAMCHAR_BF_BigDeal_smoking_idle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_BigDeal_Fistbump%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_BigDeal_Fistbump_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_BigDeal_Fistbump%(9 4)"
        @character_name = "$SAMCHAR_BigDeal_Fistbump_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_BigDeal_Fistbump%(9)"
        @character_name = "$SAMCHAR_BigDeal_Fistbump_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF01"
        @character_name = "$SAMCHAR_HockeyBF01_" + foo
      end
      if @character_name == "$SAMCHAR_BF01Smoke%(27 0)"
        @character_name = "$SAMCHAR_BF01Smoke_" + foo + "%(27 0)"
      end
      if @character_name == "$SAMCHAR_BF01Smoke%(27)"
        @character_name = "$SAMCHAR_BF01Smoke_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF01SmokeIdle%(8)"
        @character_name = "$SAMCHAR_BF01SmokeIdle_" + foo + "%(8)"
      end
    end
    
    #BF_02 #####
    if $game_variables[2412] > 0  
      foo = $game_variables[2412].to_s
      
      if @character_name == "!$SAMCHAR_BF02_Sit"
        @character_name = "!$SAMCHAR_BF02_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF02_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF02_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF02"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF02_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF02"
        @character_name = "!$SAMCHAR_SitSlicer_BF02_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF02"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF02_" + foo
      end
      if @character_name == "$SAMBF02_HungChan%(6 0)"
        @character_name = "$SAMBF02_HungChan_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF02_HungChan%(6)"
        @character_name = "$SAMBF02_HungChan_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF02_idleDefault_HungChan%(6)"
        @character_name = "$SAMBF02_idleDefault_HungChan_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF02%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF02_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF02%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF02_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF02%(9)"
        @character_name = "$SAMCHAR_FistbumpBF02_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF02"
        @character_name = "$SAMCHAR_HockeyBF02_" + foo
      end
      if @character_name == "$SAMCHAR_Texting_HungChan%(6)"
        @character_name = "$SAMCHAR_Texting_HungChan_" + foo + "%(6)"
      end
       if @character_name == "$SAMCHAR_BF02_Sit"
        @character_name = "$SAMCHAR_BF02_Sit_" + foo
      end
    end
    
    #BF_03 #####
    if $game_variables[2413] > 0  
      foo = $game_variables[2413].to_s
      
      if @character_name == "!$SAMCHAR_BF03_Sit"
        @character_name = "!$SAMCHAR_BF03_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF03_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF03_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF03"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF03_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF03"
        @character_name = "!$SAMCHAR_SitSlicer_BF03_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF03"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF03_" + foo
      end
      if @character_name == "$SAMBF03_idleDefault_Pablo%(6)"
        @character_name = "$SAMBF03_idleDefault_Pablo_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF03_Pablo%(6 0)"
        @character_name = "$SAMBF03_Pablo_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF03_Pablo%(6)"
        @character_name = "$SAMBF03_Pablo_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF03%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF03_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF03%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF03_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF03%(9)"
        @character_name = "$SAMCHAR_FistbumpBF03_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF03"
        @character_name = "$SAMCHAR_HockeyBF03_" + foo
      end
      if @character_name == "$SAMCHAR_IdlePhone_BF03%(9 0 0 0 0 1 2 3 4 5 6 7 0 9 10 10 10 9 0)"
        @character_name = "$SAMCHAR_IdlePhone_BF03_" + foo + "%(9 0 0 0 0 1 2 3 4 5 6 7 0 9 10 10 10 9 0)"
      end
    end
    
    #BF_04 #####
    if $game_variables[2414] > 0  
      foo = $game_variables[2414].to_s
      
      if @character_name == "!$SAMCHAR_BF04_Sit"
        @character_name = "!$SAMCHAR_BF04_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF04_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF04_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF04"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF04_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF04"
        @character_name = "!$SAMCHAR_SitSlicer_BF04_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF04"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF04_" + foo
      end
      if @character_name == "$SAMBF04_DeMarcus%(6 0)"
        @character_name = "$SAMBF04_DeMarcus_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF04_DeMarcus%(6)"
        @character_name = "$SAMBF04_DeMarcus_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF04_idleAngry_DeMarcus%(10 0 1 2 3 4 5 6 7 8 9 9 9 9 9 9 9 9)"
        @character_name = "$SAMBF04_idleAngry_DeMarcus_" + foo + "%(10 0 1 2 3 4 5 6 7 8 9 9 9 9 9 9 9 9)"
      end
      if @character_name == "$SAMBF04_idleAngry_DeMarcus%(10)"
        @character_name = "$SAMBF04_idleAngry_DeMarcus_" + foo + "%(10)"
      end
      if @character_name == "$SAMBF04_idleDefault_DeMarcus%(6)"
        @character_name = "$SAMBF04_idleDefault_DeMarcus_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF04%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF04_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF04%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF04_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF04%(9)"
        @character_name = "$SAMCHAR_FistbumpBF04_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF04"
        @character_name = "$SAMCHAR_HockeyBF04_" + foo
      end
      if @character_name == "$SAMCHAR_paranoid_DeMarkus%(7 0 1 2 3 3 2 1 4 5 6 5 4 0 0 0)"
        @character_name = "$SAMCHAR_paranoid_DeMarkus_" + foo + "%(7 0 1 2 3 3 2 1 4 5 6 5 4 0 0 0)"
      end
      if @character_name == "$SAMCHAR_BF04Smoke%(27 0)"
        @character_name = "$SAMCHAR_BF04Smoke_" + foo + "%(27 0)"
      end
      if @character_name == "$SAMCHAR_BF04Smoke%(27)"
        @character_name = "$SAMCHAR_BF04Smoke_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF04SmokeIdle%(8)"
        @character_name = "$SAMCHAR_BF04SmokeIdle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_Sitting_DeMarkus"
        @character_name = "$SAMCHAR_Sitting_DeMarkus_" + foo
      end
    end
    
    #BF_05 #####
    if $game_variables[2415] > 0  
      foo = $game_variables[2415].to_s
      
      if @character_name == "!$SAMCHAR_BF05_Sit"
        @character_name = "!$SAMCHAR_BF05_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF05_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF05_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF05"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF05_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF05"
        @character_name = "!$SAMCHAR_SitSlicer_BF05_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF05"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF05_" + foo
      end
      if @character_name == "$SAMBF05_Hassan%(6 0)"
        @character_name = "$SAMBF05_Hassan_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF05_Hassan%(6)"
        @character_name = "$SAMBF05_Hassan_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF05_idleDefault_Hassan%(6)"
        @character_name = "$SAMBF05_idleDefault_Hassan_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_BF_Hassan_smoking%(27)"
        @character_name = "$SAMCHAR_BF_Hassan_smoking_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF_Hassan_smoking_idle%(8)"
        @character_name = "$SAMCHAR_BF_Hassan_smoking_idle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF05%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF05_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF05%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF05_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF05%(9)"
        @character_name = "$SAMCHAR_FistbumpBF05_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF05"
        @character_name = "$SAMCHAR_HockeyBF05_" + foo
      end
      if @character_name == "$SAMCHAR_BF05_Sit"
        @character_name = "$SAMCHAR_BF05_Sit_" + foo
      end
      if @character_name == "$SAMCHAR_BF05Smoke%(27 0)"
        @character_name = "$SAMCHAR_BF05Smoke_" + foo + "%(27 0)"
      end
      if @character_name == "$SAMCHAR_BF05Smoke%(27)"
        @character_name = "$SAMCHAR_BF05Smoke_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF05SmokeIdle%(8)"
        @character_name = "$SAMCHAR_BF05SmokeIdle_" + foo + "%(8)"
      end
    end
    
    #BF_06 #####
    if $game_variables[2416] > 0  
      foo = $game_variables[2416].to_s
      
      if @character_name == "!$SAMCHAR_BF06_Sit"
        @character_name = "!$SAMCHAR_BF06_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF06_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF06_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF06"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF06_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF06"
        @character_name = "!$SAMCHAR_SitSlicer_BF06_" + foo
      end
       if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF06"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF06_" + foo
      end
      if @character_name == "$SAMBF06_idleDefault_Ruth%(6)"
        @character_name = "$SAMBF06_idleDefault_Ruth_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF06_Ruth%(6 0)"
        @character_name = "$SAMBF06_Ruth_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF06_Ruth%(6)"
        @character_name = "$SAMBF06_Ruth_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF06%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF06_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF06%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF06_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF06%(9)"
        @character_name = "$SAMCHAR_FistbumpBF06_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF06"
        @character_name = "$SAMCHAR_HockeyBF06_" + foo
      end
      if @character_name == "$SAMCHAR_Idle_BF06%(10 0 9 1 3 4 5 7 7 7 7 6 6 6 6 5 8)"
        @character_name = "$SAMCHAR_Idle_BF06_" + foo + "%(10 0 9 1 3 4 5 7 7 7 7 6 6 6 6 5 8)"
      end
      if @character_name == "$SAMCHAR_Sitting_Ruth"
        @character_name = "$SAMCHAR_Sitting_Ruth_" + foo
      end
    end
    
    #BF_07 #####
    if $game_variables[2417] > 0  
      foo = $game_variables[2417].to_s
      
      if @character_name == "!$SAMCHAR_BF07_Sit"
        @character_name = "!$SAMCHAR_BF07_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF07_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF07_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF07"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF07_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF07"
        @character_name = "!$SAMCHAR_SitSlicer_BF07_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF07"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF07_" + foo
      end
      if @character_name == "!$SAMCHAR_Texting_Trisha%(6)"
        @character_name = "!$SAMCHAR_Texting_Trisha_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF07_idleDefault_Trisha%(6)"
        @character_name = "$SAMBF07_idleDefault_Trisha_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF07_Trisha%(6 0)"
        @character_name = "$SAMBF07_Trisha_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF07_Trisha%(6)"
        @character_name = "$SAMBF07_Trisha_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF07_Trisha_Dress%(6)"
        @character_name = "$SAMBF07_Trisha_Dress_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_BF_Trisha_smoking%(27)"
        @character_name = "$SAMCHAR_BF_Trisha_smoking_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF_Trisha_smoking_idle%(8)"
        @character_name = "$SAMCHAR_BF_Trisha_smoking_idle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF07%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF07_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF07%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF07_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF07%(9)"
        @character_name = "$SAMCHAR_FistbumpBF07_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF07"
        @character_name = "$SAMCHAR_HockeyBF07_" + foo
      end
      if @character_name == "$SAMCHAR_BF07Smoke%(27 0)"
        @character_name = "$SAMCHAR_BF07Smoke_" + foo + "%(27 0)"
      end
      if @character_name == "$SAMCHAR_BF07Smoke%(27)"
        @character_name = "$SAMCHAR_BF07Smoke_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF07SmokeIdle%(8)"
        @character_name = "$SAMCHAR_BF07SmokeIdle_" + foo + "%(8)"
      end
    end
    
    #BF_08 #####
    if $game_variables[2418] > 0  
      foo = $game_variables[2418].to_s
      
      if @character_name == "!$SAMCHAR_BF08_Sit"
        @character_name = "!$SAMCHAR_BF08_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF08_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF08_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF08"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF08_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF08"
        @character_name = "!$SAMCHAR_SitSlicer_BF08_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF08"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF08_" + foo
      end
      if @character_name == "$SAMBF08_Alexa%(6 0)"
        @character_name = "$SAMBF08_Alexa_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF08_Alexa%(6)"
        @character_name = "$SAMBF08_Alexa_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF08_idleDefault_Alexa%(6)"
        @character_name = "$SAMBF08_idleDefault_Alexa_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_BF_Alexa_smoking%(27)"
        @character_name = "$SAMCHAR_BF_Alexa_smoking_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF_Alexa_smoking_idle%(8)"
        @character_name = "$SAMCHAR_BF_Alexa_smoking_idle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF08%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF08_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF08%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF08_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF08%(9)"
        @character_name = "$SAMCHAR_FistbumpBF08_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF08"
        @character_name = "$SAMCHAR_HockeyBF08_" + foo
      end
      if @character_name == "$SAMCHAR_BF08Smoke%(27 0)"
        @character_name = "$SAMCHAR_BF08Smoke_" + foo + "%(27 0)"
      end
      if @character_name == "$SAMCHAR_BF08Smoke%(27)"
        @character_name = "$SAMCHAR_BF08Smoke_" + foo + "%(27)"
      end
      if @character_name == "$SAMCHAR_BF08SmokeIdle%(8)"
        @character_name = "$SAMCHAR_BF08SmokeIdle_" + foo + "%(8)"
      end
      if @character_name == "$SAMCHAR_Sitting_Alexa"
        @character_name = "$SAMCHAR_Sitting_Alexa_" + foo
      end
    end
    
    #BF_09 #####
    if $game_variables[2419] > 0  
      foo = $game_variables[2419].to_s
      
      if @character_name == "!$SAMCHAR_BF09_Sit"
        @character_name = "!$SAMCHAR_BF09_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF09_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF09_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Idle_BF09"
        @character_name = "!$SAMCHAR_Idle_BF09_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF09"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF09_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF09"
        @character_name = "!$SAMCHAR_SitSlicer_BF09_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF09"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF09_" + foo
      end
      if @character_name == "$SAMBF09_idleDefault_Sheena%(6)"
        @character_name = "$SAMBF09_idleDefault_Sheena_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF09_Sheena%(6 0)"
        @character_name = "$SAMBF09_Sheena_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF09_Sheena%(6)"
        @character_name = "$SAMBF09_Sheena_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF09_Sheena_Smoke_Walk%(6)"
        @character_name = "$SAMBF09_Sheena_Smoke_Walk_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF09%(9 4 5 6 7 8)"
        @character_name = "$SAMCHAR_FistbumpBF09_" + foo + "%(9 4 5 6 7 8)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF09%(9 4)"
        @character_name = "$SAMCHAR_FistbumpBF09_" + foo + "%(9 4)"
      end
      if @character_name == "$SAMCHAR_FistbumpBF09%(9)"
        @character_name = "$SAMCHAR_FistbumpBF09_" + foo + "%(9)"
      end
      if @character_name == "$SAMCHAR_HockeyBF09"
        @character_name = "$SAMCHAR_HockeyBF09_" + foo
      end
    end
    
    #BF_10 #####
    if $game_variables[2420] > 0  
      foo = $game_variables[2420].to_s
      
      if @character_name == "!$SAMCHAR_BF10_Sit"
        @character_name = "!$SAMCHAR_BF10_Sit_" + foo
      end
      if @character_name == "!$SAMCHAR_BF10_Sit_HeadTurn"
        @character_name = "!$SAMCHAR_BF10_Sit_HeadTurn_" + foo
      end
      if @character_name == "!$SAMCHAR_Sit_North_headturn_BF10"
        @character_name = "!$SAMCHAR_Sit_North_headturn_BF10_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_BF10"
        @character_name = "!$SAMCHAR_SitSlicer_BF10_" + foo
      end
      if @character_name == "!$SAMCHAR_SitSlicer_headturn_BF10"
        @character_name = "!$SAMCHAR_SitSlicer_headturn_BF10_" + foo
      end
      if @character_name == "$SAMBF10_idleDefault_Yasi%(6)"
        @character_name = "$SAMBF10_idleDefault_Yasi_" + foo + "%(6)"
      end
      if @character_name == "$SAMBF10_Yasi%(6 0)"
        @character_name = "$SAMBF10_Yasi_" + foo + "%(6 0)"
      end
      if @character_name == "$SAMBF10_Yasi%(6)"
        @character_name = "$SAMBF10_Yasi_" + foo + "%(6)"
      end
      if @character_name == "$SAMCHAR_HockeyBF10"
        @character_name = "$SAMCHAR_HockeyBF10_" + foo
      end
      if @character_name == "$SAMCHAR_Idle_BF10%(13 0 1 2 3 4 3 4 5 6 7 8 9 10 11 12)"
        @character_name = "$SAMCHAR_Idle_BF10_" + foo + "%(13 0 1 2 3 4 3 4 5 6 7 8 9 10 11 12)"
      end
      if @character_name == "$SAMCHAR_BF10_Sit"
        @character_name = "$SAMCHAR_BF10_Sit_" + foo
      end
    end
    #BUS FRIENDS DLC ----- END
     
    @character_index  = @page.graphic.character_index
    if @original_direction != @page.graphic.direction
      @direction          = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction  = 0
    end
    if @original_pattern != @page.graphic.pattern
      @pattern            = @page.graphic.pattern
      @original_pattern   = @pattern
    end
    @move_type          = @page.move_type
    @move_speed         = @page.move_speed
    @move_frequency     = @page.move_frequency
    @move_route         = @page.move_route
    @move_route_index   = 0
    @move_route_forcing = false
    @walk_anime         = @page.walk_anime
    @step_anime         = @page.step_anime
    @direction_fix      = @page.direction_fix
    @through            = @page.through
    @priority_type      = @page.priority_type
    @trigger            = @page.trigger
    @list               = @page.list
    @interpreter = @trigger == 4 ? Game_Interpreter.new : nil
  end
  
end