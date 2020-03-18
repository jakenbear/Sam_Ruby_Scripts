=begin
More Choices
by Fomar0153
Version 1.0
----------------------
Notes
----------------------
No requirements
Allows you to have more than four choices
----------------------
Instructions
----------------------
Edit the method more_choice and then use the call in 
a choice option.
----------------------
Known bugs
----------------------
None
=end
class Game_Interpreter
  #--------------------------------------------------------------------------
  # ● Edit Here
  # when handle
  #   $game_message.choices.push("a choice")
  #--------------------------------------------------------------------------
  def more_choice(p)
    case p
    
      when "BannedBooks"
        $game_message.choices.push("Something Good")
        if $game_switches[1845]
          $game_message.choices.push("Something Gay")
          $game_variables[1343] = 1
        else
          if $game_switches[1846]
            $game_message.choices.push("Something Racial")
            $game_variables[1343] = 2
          else
            if $game_switches[1848]
              $game_message.choices.push("Something Druggy")
              $game_variables[1343] = 3 
            else
              if $game_switches[1849]
                $game_message.choices.push("Something Suicidal")
                $game_variables[1343] = 4
              else
                if $game_switches[1850]
                  $game_message.choices.push("Something Political")
                  $game_variables[1343] = 5
                end
                  if $game_switches[1851]
                    $game_message.choices.push("Something Sexual")
                    $game_variables[1343] = 6
                  else
                    if $game_switches[1867]
                      $game_message.choices.push("Something Religious")
                      $game_variables[1343] = 7
                    else
                      $game_message.choices.push("Something Terrible")
                      $game_variables[1343] = 0
                    end end end end end end 
                    
        $game_message.choices.push("Nevermind")
          
  when "Phone"
    if $game_variables[943] == 0
    $game_message.choices.push("My Husband")  
    else
    $game_message.choices.push("My Wife")
    end     
      $game_message.choices.push("Shelly Walnut")
   
    if $game_switches[1892]
      if $game_variables[870] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[870] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[870] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[870] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[870] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[870] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[870] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[870] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[870] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[870] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end 
    else    
      $game_message.choices.push("Pizza Delivery")
    end

   if $game_switches[1892]
    if $game_variables[871] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[871] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[871] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[871] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[871] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[871] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[871] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[871] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[871] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[871] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end 
    else    
   ##   $game_message.choices.push("??????????")
    end
    
    if $game_switches[1892]
      if $game_variables[872] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[872] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[872] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[872] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[872] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[872] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[872] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[872] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[872] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[872] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
        end end end end end end end end end end 
            else    
 ##     $game_message.choices.push("??????????")
    end

    if $game_switches[1892] 
    if $game_variables[873] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[873] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[873] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[873] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[873] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[873] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[873] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[873] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[873] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[873] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
        end end end end end end end end end end   
            else    
 ##     $game_message.choices.push("??????????")
    end
      
      $game_message.choices.push("Casey")
      if $game_switches[1296]
        if $game_variables[1055] >= 2
          $game_message.choices.push("Viper")
        else
          $game_message.choices.push("Darkeff")
        end
      else
        $game_message.choices.push("???????????")
      end
      $game_message.choices.push("(Hang Up)")
 ##    $game_message.choices.push("More...")
      
    
    when "Phone2"
      $game_message.choices.push("Pizza Delivery")
      
      if $game_variables[1584] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1584] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1584] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1584] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1584] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1584] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1584] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1584] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1584] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1584] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
        end end end end end end end end end end
        
      if $game_variables[1585] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1585] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1585] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1585] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1585] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1585] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1585] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1585] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1585] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1585] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
        end end end end end end end end end end
        
      if $game_variables[1586] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1586] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1586] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1586] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1586] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1586] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1586] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1586] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1586] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1586] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end

      if $game_variables[1587] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1587] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1587] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1587] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1587] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1587] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1587] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1587] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1587] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1587] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end

      if $game_variables[1588] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1588] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1588] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1588] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1588] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1588] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1588] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1588] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1588] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1588] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end
        
      if $game_variables[1589] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1589] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1589] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1589] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1589] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1589] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1589] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1589] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1589] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1589] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
        end end end end end end end end end end  
        
      if $game_variables[1590] == 1
         $game_message.choices.push("Big Deal")
      else
      if $game_variables[1590] == 2
         $game_message.choices.push("Hung Chan")
      else
      if $game_variables[1590] == 3
         $game_message.choices.push("Pablo Ramos")
      else
      if $game_variables[1590] == 4
         $game_message.choices.push("DeMarcus Jackson")
      else
      if $game_variables[1590] == 5
         $game_message.choices.push("Hassan Ghorbani")
      else
      if $game_variables[1590] == 6
         $game_message.choices.push("Ruth Sanderson")
      else
      if $game_variables[1590] == 7
         $game_message.choices.push("Trisha Himura")
      else
      if $game_variables[1590] == 8
         $game_message.choices.push("Alexa Reyes")
      else
      if $game_variables[1590] == 9
         $game_message.choices.push("Sheena Williamson")
      else
      if $game_variables[1590] == 10
         $game_message.choices.push("Yasi Awad")
      else
          $game_message.choices.push("??????????")
      end end end end end end end end end end  
      
      $game_message.choices.push("Hang Up")
      $game_message.choices.push("More...")

      when "AlexaBooze"
      $game_message.choices.push("Beer")
      $game_message.choices.push("Whiskey")
      $game_message.choices.push("Vodka")
      $game_message.choices.push("Gin")
      $game_message.choices.push("Wine")
      $game_message.choices.push("Tequila")
      $game_message.choices.push("Nothing")  
      
  when "Portsmith"
      $game_message.choices.push("Bus Depot")
      $game_message.choices.push("Stalker Media")
      $game_message.choices.push("Con-Mart")
      $game_message.choices.push("Pavel's Books")
      $game_message.choices.push("Tim's Hardware")
      $game_message.choices.push("Sunny Megaplex")
      $game_message.choices.push("Starcups Coffee")
      $game_message.choices.push("Portsmith PD")
      $game_message.choices.push("The Firm")
      $game_message.choices.push("More...")
  
      when "Portsmith 2"
      $game_message.choices.push("Kinder Select")
      $game_message.choices.push("Sacred Hope")
      $game_message.choices.push("Drug Store")
      $game_message.choices.push("Cellblock Mobile")
      $game_message.choices.push("Golden City Games")
      $game_message.choices.push("All 4 Pets")
      $game_message.choices.push("Century Park")
      $game_message.choices.push("Doromir Accounting")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...") 
    
  when "Sequoia"
      $game_message.choices.push("Tour Bus")
      $game_message.choices.push("County Sheriff's Office")
      $game_message.choices.push("Public Library")
      $game_message.choices.push("Cosmo's Books")
      $game_message.choices.push("Art Gallery")
      $game_message.choices.push("Sacred Reflection")
      $game_message.choices.push("Outer Worlds")
      $game_message.choices.push("Santana Theatre")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")
  
  when "Sequoia 2"
      $game_message.choices.push("Gas 66")
      $game_message.choices.push("Starcups Coffee")
      $game_message.choices.push("Con-Mart")
      $game_message.choices.push("Quick$tarter")
      $game_message.choices.push("Drug Store")
      $game_message.choices.push("Sequoia General Hospital")
      $game_message.choices.push("SRB Legal & Accounting")
      $game_message.choices.push("Cellblock Mobile")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")      
  
  when "NewCreole"
      $game_message.choices.push("Tour Bus")
      $game_message.choices.push("Queen Ria Casino")
      $game_message.choices.push("Creole Hostel")
      $game_message.choices.push("Lady Voodoo's")
      $game_message.choices.push("Wellman Manor")
      $game_message.choices.push("Burncash Manor")
      $game_message.choices.push("Soliel Park")
      $game_message.choices.push("Book Store")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")
  
  when "NewCreole2"
      $game_message.choices.push("Con-Mart")
      $game_message.choices.push("Bullet Burger")
      $game_message.choices.push("Drug Store")
      $game_message.choices.push("Starcups Coffee")
      $game_message.choices.push("Bayou Fitness")
      $game_message.choices.push("Cellblock Mobile")
      $game_message.choices.push("Police Station")
      $game_message.choices.push("Hospital")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")   
 
  when "GatorBay1"
      $game_message.choices.push("Tour Bus")
      $game_message.choices.push("Retirement Home")
      $game_message.choices.push("Splash Zone")
      $game_message.choices.push("2Elf")
      $game_message.choices.push("Shelly's Hotel")
      $game_message.choices.push("Lobster Shack")
      $game_message.choices.push("Easy Target")
      $game_message.choices.push("Book Store")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")     
  
  when "GatorBay2"
      $game_message.choices.push("Con-Mart")
      $game_message.choices.push("Bullet Burger")
      $game_message.choices.push("Drug Store")
      $game_message.choices.push("Uptown")
      $game_message.choices.push("Crash Fitness")
      $game_message.choices.push("Cellblock Mobile")
      $game_message.choices.push("Police Station")
      $game_message.choices.push("Hospital")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")     
      
  when "SlabTown1"
      $game_message.choices.push("Tour Bus")
      $game_message.choices.push("The Quarry Bar")
      $game_message.choices.push("Last Page Books")
      $game_message.choices.push("Funeral Home")
      $game_message.choices.push("Sunny Megaplex")
      $game_message.choices.push("Con-Mart")
      $game_message.choices.push("Stonemen Hall")
      $game_message.choices.push("Bullet Burger")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...")
  
  when "SlabTown2"
      $game_message.choices.push("Drug Store")
      $game_message.choices.push("K&V Accounting")
      $game_message.choices.push("Quickstarter")
      $game_message.choices.push("All 4 Pets")
      $game_message.choices.push("Frou & Frou")
      $game_message.choices.push("Cellblock Mobile")
      $game_message.choices.push("Police Station")
      $game_message.choices.push("Hospital")
      $game_message.choices.push("Cancel Car")
      $game_message.choices.push("More...") 
      
  when "HermesPhone"
      $game_message.choices.push("Thea")
      $game_message.choices.push("NC Lotto Comm.")
      $game_message.choices.push("Helena")
      $game_message.choices.push("Chuck")
      $game_message.choices.push("Holly")
      $game_message.choices.push("Close Messages")

  when "RouletteBet"
      $game_message.choices.push("Bet $5")
      $game_message.choices.push("Bet $10")
      $game_message.choices.push("Bet $25")
      $game_message.choices.push("Bet $50")
      $game_message.choices.push("Bet $100")
      $game_message.choices.push("Bet $250")
      $game_message.choices.push("Bet $500")
      $game_message.choices.push("Cancel Bet")
      
  when "RoulettePlace"
    $game_message.choices.push("Colours - 2:1")
    $game_message.choices.push("Thirds - 3:1")
    $game_message.choices.push("Numbers - 35:1")
    $game_message.choices.push("Evil Zero - ????")
    $game_message.choices.push("Cancel Bet")
    
  when "SolielTickets"
    $game_message.choices.push("Ten Tickets ($45)")
    $game_message.choices.push("Five Tickets ($22)")
    $game_message.choices.push("One Ticket ($5)")
    $game_message.choices.push("Day Pass ($500)")
    $game_message.choices.push("None, Thanks")
    
    when "Investment"
    $game_message.choices.push("$100")
    $game_message.choices.push("$250")
    $game_message.choices.push("$500")
    $game_message.choices.push("$1000")
    $game_message.choices.push("$2500")
    $game_message.choices.push("$5000")
    $game_message.choices.push("Nevermind")
      
    when "Freezer1"
    $game_message.choices.push("Ice Cream")
    $game_message.choices.push("Chicken Breast")
    $game_message.choices.push("Hamburgers")
    $game_message.choices.push("Meatballs")
    $game_message.choices.push("Close Fridge")
         
    when "Fridge1"
    $game_message.choices.push("Eggs")
    $game_message.choices.push("Milk")
    $game_message.choices.push("Butter")
    $game_message.choices.push("Cheese")
    $game_message.choices.push("Balogna")
    $game_message.choices.push("Mayonaise")
    $game_message.choices.push("Cream Cheese")
    $game_message.choices.push("Cola")
    $game_message.choices.push("Water Bottle")
    $game_message.choices.push("Close Fridge")
 
    when "Fridge2"
    $game_message.choices.push("Eggs")
    $game_message.choices.push("Milk")
    $game_message.choices.push("Butter")
    $game_message.choices.push("Cheese")
    $game_message.choices.push("Bacon")
    $game_message.choices.push("Pickles")
    $game_message.choices.push("Pudding Cups")
    $game_message.choices.push("Beer")
    $game_message.choices.push("Energy Drink")
    $game_message.choices.push("Close Fridge")
    
    when "Fridge3"
    $game_message.choices.push("Eggs")
    $game_message.choices.push("Milk")
    $game_message.choices.push("Butter")
    $game_message.choices.push("Cream")
    $game_message.choices.push("Hot Dogs")
    $game_message.choices.push("Mustard")
    $game_message.choices.push("Ketchup")
    $game_message.choices.push("Spritz")
    $game_message.choices.push("Orange Juice")
    $game_message.choices.push("Close Fridge")
    
    when "Fridge4"
    $game_message.choices.push("Eggs")
    $game_message.choices.push("Milk")
    $game_message.choices.push("Butter")
    $game_message.choices.push("Cream")
    $game_message.choices.push("Bacon")
    $game_message.choices.push("Cream Cheese")
    $game_message.choices.push("Jelly")
    $game_message.choices.push("Jiggl-o Cups")
    $game_message.choices.push("Apple Juice")
    $game_message.choices.push("Close Fridge")

    
    when "Crisper1"
    $game_message.choices.push("Potato")
    $game_message.choices.push("Lettuce")
    $game_message.choices.push("Onion")
    $game_message.choices.push("Tomato")
    $game_message.choices.push("Carrot")
    $game_message.choices.push("Broccoli")
    $game_message.choices.push("Bell Pepper")
    $game_message.choices.push("Close Fridge")
    
    when "Crisper2"
    $game_message.choices.push("Potato")
    $game_message.choices.push("Lettuce")
    $game_message.choices.push("Onion")
    $game_message.choices.push("Tomato")
    $game_message.choices.push("Corn")
    $game_message.choices.push("Cabbage")
    $game_message.choices.push("Beets")
    $game_message.choices.push("Close Fridge")
    
    when "Crisper3"
    $game_message.choices.push("Potato")
    $game_message.choices.push("Lettuce")
    $game_message.choices.push("Onion")
    $game_message.choices.push("Tomato")
    $game_message.choices.push("Cucumber")
    $game_message.choices.push("Celery")
    $game_message.choices.push("Scallions")
    $game_message.choices.push("Close Fridge")
    
    when "Cupboard1"
    $game_message.choices.push("Mac Dinner")  
    $game_message.choices.push("Ramen")  
    $game_message.choices.push("Instant Rice")
    $game_message.choices.push("Potato Flakes")
    $game_message.choices.push("Curry Sauce")
    $game_message.choices.push("Gravy Sauce")
    $game_message.choices.push("Tomato Sauce")
    $game_message.choices.push("Noodles")
    $game_message.choices.push("Flour")
    $game_message.choices.push("Close Cupboard")
    
    when "Fruitbowl1"
    $game_message.choices.push("Apple")  
    $game_message.choices.push("Banana")  
    $game_message.choices.push("Orange")
    $game_message.choices.push("Grapes")
    $game_message.choices.push("Strawberries")
    $game_message.choices.push("Lemon")
    $game_message.choices.push("Peach")
    $game_message.choices.push("Nevermind")
    
    when "Fruitbowl2"
    $game_message.choices.push("Apple")  
    $game_message.choices.push("Banana")  
    $game_message.choices.push("Orange")
    $game_message.choices.push("Grapes")
    $game_message.choices.push("Cherries")
    $game_message.choices.push("Pear")
    $game_message.choices.push("Mango")
    $game_message.choices.push("Nevermind")
    
    when "Fruitbowl3"
    $game_message.choices.push("Apple")  
    $game_message.choices.push("Banana")  
    $game_message.choices.push("Orange")
    $game_message.choices.push("Grapes")
    $game_message.choices.push("Lemon")
    $game_message.choices.push("Blueberries")
    $game_message.choices.push("Watermelon")
    $game_message.choices.push("Nevermind")
    
    when "VoodooDoll"
    $game_message.choices.push("Head")  
    $game_message.choices.push("Eyes")  
    $game_message.choices.push("Heart")
    $game_message.choices.push("Arms")
    $game_message.choices.push("Stomach")
    $game_message.choices.push("Crotch")
    $game_message.choices.push("Ass")
    $game_message.choices.push("Legs")
    $game_message.choices.push("Feet")
    $game_message.choices.push("Nevermind")
    
    when "FinaleChoices"
    $game_message.choices.push("Nothing")
    $game_message.choices.push("Everything")
    $game_message.choices.push("Time Moves")
    $game_message.choices.push("No Idea")
    $game_message.choices.push("The Best")
    $game_message.choices.push("The Worst")
    $game_message.choices.push("No Idea")

    
    when "SuperCheats"
    $game_message.choices.push("Kill Some Time")  
    $game_message.choices.push("Take Care Of Me")
    $game_message.choices.push("Gimme Dat Coin")
    $game_message.choices.push("Make New Friends")  
    $game_message.choices.push("Where Is The Love?")
    $game_message.choices.push("Cold Tea")
    $game_message.choices.push("Free Lunch")
    $game_message.choices.push("Redecorating")
    $game_message.choices.push("HyperWriter")
    $game_message.choices.push("Debug Explainer")
    $game_message.choices.push("DaySkipper")
    $game_message.choices.push("Warp Whistle")
    $game_message.choices.push("Nevermind")   
    
    when "SuperCheats2"    
    $game_message.choices.push("Rename Folks")
    $game_message.choices.push("Swap Up BFs")
    $game_message.choices.push("Change Player Skin")
    $game_message.choices.push("Change Player Gender")
    $game_message.choices.push("Change Lover Gender")
    $game_message.choices.push("Weather Control")
    $game_message.choices.push("Nevermind")
    
    when "WarpWhistle"
    $game_message.choices.push("Portsmith")  
    $game_message.choices.push("Sequoia")
    $game_message.choices.push("New Creole")
    $game_message.choices.push("Gator Bay")
    $game_message.choices.push("Slab Town")
    $game_message.choices.push("Bus Bedroom")
    $game_message.choices.push("Home Bedroom")
    $game_message.choices.push("Vagabond Dog")
    $game_message.choices.push("Nevermind")   
    
    when "WhyWrite"
    
      if $game_variables[1013] > 12
         $game_message.choices.push("Sam")
      else
      if $game_variables[942] == 0
         $game_message.choices.push("Him")
      else
          $game_message.choices.push("Her")
      end end
     
    $game_message.choices.push("I Need Perfection")
    $game_message.choices.push("My Lasting Legacy")
    $game_message.choices.push("For Our Security")
    $game_message.choices.push("To Be The Best")
    $game_message.choices.push("I'm Just Stuck")   
    $game_message.choices.push("Too Scared To Stop")   
    $game_message.choices.push("What Else Is There?")   
    $game_message.choices.push("I Don't Know")  
    
    
    
    
    when "GunShop"
    $game_message.choices.push("Pistol ($100)")  
    $game_message.choices.push("Assault Rifle ($130)")  
    $game_message.choices.push("Sniper Rifle ($175)")
    $game_message.choices.push("Rocket Launcher ($500)")
    $game_message.choices.push("Nevermind")    
    
    
    when "StarcupSnacks"
    $game_message.choices.push("$3 - Donut")  
    $game_message.choices.push("$5 - Brownie")
    $game_message.choices.push("$6 - Croissant")
    $game_message.choices.push("$8 - Apple Fritter")
    $game_message.choices.push("$10 - Cinnamon Roll")
    $game_message.choices.push("Nevermind")   
    
    when "SexualAthletics1"
    $game_message.choices.push("I Want To Please You")
    if $game_variables[943] == 0
    $game_message.choices.push("Give It To Me, Boy")  
    else
    $game_message.choices.push("Give It To Me, Girl")
    end
    $game_message.choices.push("Submit To Me, Won't You?")
    $game_message.choices.push("Show Me How You Take Control")
    $game_message.choices.push("Nevermind")    
    
    when "SexualAthletics2"
    $game_message.choices.push("Let Me Take Care Of You")
    $game_message.choices.push("I Need You To Give It To Me")  
    $game_message.choices.push("You Can Be Obedient, Right?")
    $game_message.choices.push("Be The Boss, You're In Charge")
    $game_message.choices.push("Nevermind")   
    
    when "SexualAthletics3"
    $game_message.choices.push("I'm Going To Make You Happy")
    $game_message.choices.push("Please, Take Care Of Me?")  
    $game_message.choices.push("You're Going To Submit For Me")
    $game_message.choices.push("Do You Think You Can Dominate Me?")
    $game_message.choices.push("Nevermind")   

    when "SexualAthletics4"
    $game_message.choices.push("I Want To See You Come")
    $game_message.choices.push("You Think You Can Finish Me?")  
    $game_message.choices.push("I'm Going To Make You Submit")
    $game_message.choices.push("Don't Be Afraid To Hurt Me")
    $game_message.choices.push("Nevermind")   

    when "SexualAthletics5"
    $game_message.choices.push("You Deserve To Feel Good")
    $game_message.choices.push("I Want To Come")  
    $game_message.choices.push("You're Going To Do What I Say")
    $game_message.choices.push("I'm In Need Of Punishment")
    $game_message.choices.push("Nevermind")   
    
    when "SexualAthletics6"
    $game_message.choices.push("Let Me Help You Out")
    $game_message.choices.push("Can You Give Me A Hand?")  
    $game_message.choices.push("I Want To See You Follow Orders")
    if $game_variables[943] == 0
    $game_message.choices.push("Tell Me What To Do, Master")  
    else
    $game_message.choices.push("Tell Me What To Do, Mistress")
    end
    $game_message.choices.push("Nevermind")
    
    when "VijaGames"
    $game_message.choices.push("Sisyphys")
    $game_message.choices.push("Daily Soldier")  
    $game_message.choices.push("Fire Escape")
    $game_message.choices.push("OuttaGrasp HD")
    $game_message.choices.push("Box Mover 2020")
    $game_message.choices.push("(Buy More)")
    $game_message.choices.push("Nevermind")   
    
    when "LoverGenChat"
    $game_variables[1416] = rand(3)
    if $game_variables[1416] == 0
      $game_message.choices.push("Yes, Of Course")  
    end
    if $game_variables[1416] == 1
      $game_message.choices.push("Yeah, Sure")   
    end
    if $game_variables[1416] == 2
      $game_message.choices.push("Definitely")  
    end
    $game_message.choices.push("No, Not Really")  
    $game_message.choices.push("I Don't Know")
    $game_message.choices.push("Uh, Maybe")
    
    when "GuestMode"
    $game_variables[1416] = rand(3)
    if $game_variables[1416] == 0
      $game_message.choices.push("Hot Tub")  
      $game_message.choices.push("Watch TV")  
      $game_message.choices.push("Hang Out")
    end
    if $game_variables[1416] == 1
      $game_message.choices.push("Watch TV")  
      $game_message.choices.push("Hang Out")  
      $game_message.choices.push("Hot Tub")
    end
    if $game_variables[1416] == 2
      $game_message.choices.push("Hang Out")  
      $game_message.choices.push("Hot Tub")
      $game_message.choices.push("Watch TV")  
    end
      if $game_variables[1826] == 1
        $game_message.choices.push("Smoke One")
      end
      if $game_variables[1826] == 2
        $game_message.choices.push("Play Games")  
      end
      if $game_variables[1826] == 3
        $game_message.choices.push("Get Serious")  
      end
      if $game_variables[1826] == 4
        $game_message.choices.push("Have A Drink")  
      end      
      if $game_variables[1826] == 5
        $game_message.choices.push("Check The News")  
      end      
      if $game_variables[1826] == 6
        $game_message.choices.push("Cup Of Tea")  
      end      
      if $game_variables[1826] == 7
        $game_message.choices.push("Compare Numbers")  
      end      
      if $game_variables[1826] == 8
        $game_message.choices.push("Listen to Records")  
      end      
      if $game_variables[1826] == 9
        $game_message.choices.push("Read Something")  
      end      
      if $game_variables[1826] == 10
        $game_message.choices.push("Look at Flights")  
      end      
    
    when "GuestModeZ"
    $game_variables[1416] = rand(3)
    if $game_variables[1416] == 0
      $game_message.choices.push("Hot Tub")  
      $game_message.choices.push("Watch TV")  
      $game_message.choices.push("Hang Out")
    end
    if $game_variables[1416] == 1
      $game_message.choices.push("Watch TV")  
      $game_message.choices.push("Hang Out")  
      $game_message.choices.push("Hot Tub")
    end
    if $game_variables[1416] == 2
      $game_message.choices.push("Hang Out")  
      $game_message.choices.push("Hot Tub")
      $game_message.choices.push("Watch TV")  
    end
      if $game_variables[1826] == 1
        $game_message.choices.push("Smoke One")
      end
      if $game_variables[1826] == 2
        $game_message.choices.push("Play Games")  
      end
      if $game_variables[1826] == 3
        $game_message.choices.push("Get Serious")  
      end
      if $game_variables[1826] == 4
        $game_message.choices.push("Have A Drink")  
      end      
      if $game_variables[1826] == 5
        $game_message.choices.push("Check The News")  
      end      
      if $game_variables[1826] == 6
        $game_message.choices.push("Cup Of Tea")  
      end      
      if $game_variables[1826] == 7
        $game_message.choices.push("Compare Numbers")  
      end      
      if $game_variables[1826] == 8
        $game_message.choices.push("Listen to Records")  
      end      
      if $game_variables[1826] == 9
        $game_message.choices.push("Read Something")  
      end      
      if $game_variables[1826] == 10
        $game_message.choices.push("Look at Flights")  
      end      
    $game_message.choices.push("Nothing")    
    $game_message.choices.push("Time To Leave")    

    when "GuestMode_BF02"
    $game_message.choices.push("Hot Tub")  
    $game_message.choices.push("Watch TV")  
    $game_message.choices.push("Hang Out")
    
    $game_message.choices.push("Nothing")    

    when "LoverInteract1"
      # JUST TALK
      $game_variables[1416] = rand(5)
      if $game_variables[1416] == 0
        $game_message.choices.push("Just Talk")
      end
      if $game_variables[1416] == 1
        $game_message.choices.push("Let's Chat")
      end
      if $game_variables[1416] == 2
        $game_message.choices.push("What's Up?")
      end
      if $game_variables[1416] == 3
        $game_message.choices.push("What's New?")
      end
      if $game_variables[1416] == 4
        $game_message.choices.push("How Goes?")
      end
      # I'M HUNGRY
      $game_variables[1416] = rand(5)
      if $game_variables[1416] == 0
        $game_message.choices.push("I'm Hungry")
      end
      if $game_variables[1416] == 1
        $game_message.choices.push("Feed Me")
      end
      if $game_variables[1416] == 2
        $game_message.choices.push("You Hungry?")
      end
      if $game_variables[1416] == 3
        $game_message.choices.push("I'm Starving")
      end
      if $game_variables[1416] == 4
        $game_message.choices.push("Wanna Eat?")
      end
      # CUDDLES
      $game_variables[1416] = rand(5)
      if $game_variables[1416] == 0
        $game_message.choices.push("Let's Cuddle")
      end
      if $game_variables[1416] == 1
        $game_message.choices.push("Lay In Bed?")
      end
      if $game_variables[1416] == 2
        $game_message.choices.push("Cuddle With Me")
      end
      if $game_variables[1416] == 3
        $game_message.choices.push("Come, Be Close")
      end
      if $game_variables[1416] == 4
        $game_message.choices.push("I Want You")
      end
      # GROCERIES
      $game_variables[1416] = rand(5)
      if $game_variables[1416] == 0
        $game_message.choices.push("Need Groceries")
      end
      if $game_variables[1416] == 1
        $game_message.choices.push("We're Out Of Food")
      end
      if $game_variables[1416] == 2
        $game_message.choices.push("Go To The Store")
      end
      if $game_variables[1416] == 3
        $game_message.choices.push("Pick Up Groceries")
      end
      if $game_variables[1416] == 4
        $game_message.choices.push("Go Buy Some Food")
      end
      # END LOVER
      $game_message.choices.push("Nevermind")
      
            
      else
      $game_message.choices.push(p)
    end
  end
  #--------------------------------------------------------------------------
  # ● Long Choices - Don't edit this bit
  #--------------------------------------------------------------------------
  def setup_choices(params)
    for s in params[0]
      more_choice(s)
    end
    $game_message.choice_cancel_type = params[1]
    $game_message.choice_proc = Proc.new {|n| @branch[@indent] = n }
  end
end

class Window_ChoiceList < Window_Command
  #--------------------------------------------------------------------------
  # ● Feel free to change the 1 to another variable that you'd prefer
  #--------------------------------------------------------------------------
  alias mc_call_ok_handler call_ok_handler
  def call_ok_handler
    $game_variables[1339] = index
    mc_call_ok_handler
  end
end