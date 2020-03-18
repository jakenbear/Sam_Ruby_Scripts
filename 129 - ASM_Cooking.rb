module ASM
  module Cooking
    
    def self.unlock_recipes
      return $game_switches[1926]
    end
    
    def self.get_recipes(type=-1)
      recipes = Array.new
      # Create a new recipe, variable order is as follows
      # 0: Item ID of finished food
      # 1: Item ID of base ingredient
      # 2: Item ID of extra ingredient 1
      # 3: Item ID of extra ingredient 2.
      # 4: Item ID of spice
      # 5: Category ID of the recipe
      # Use -1 if you need to enter a null entry for an ingredient
      
      ## QUICK FOOD ##
      if (type == -1 || type == 0)
        recipes.push([750, 683, -1, -1, -1, 0]) #Baked Potato
        recipes.push([751, 519, -1, -1, -1, 0]) #Plain Rice
        recipes.push([752, 517, -1, -1, -1, 0]) #Mashed Potato
        recipes.push([753, 515, -1, -1, -1, 0]) #Wet Noodles
        recipes.push([754, 515, 545, -1, -1, 0]) #Buttered Noodles
        recipes.push([755, 514, -1, -1, -1, 0]) #Ramen
        recipes.push([756, 513, -1, -1, -1, 0]) #Mac & Cheese
        recipes.push([757, 526, -1, -1, -1, 0]) #Bread Sandwich
      end
      
      ## MAINS ##
      if (type == -1 || type == 1)
        recipes.push([758, 515, 516, -1, -1, 1]) #Marinara Pasta
        recipes.push([759, 515, 545, 546, -1, 1]) #Alfredo Pasta
        recipes.push([760, 515, 518, -1, -1, 1]) #Stroganoff
        recipes.push([761, 515, 520, -1, -1, 1]) #Curry Noodles
        recipes.push([799, 693, 549, 561, 546, 1]) #Stuffed Pepper
        recipes.push([808, 515, 516, 458, -1, 1]) #Spaghetti & Meatballs
        recipes.push([824, 759, 466, -1, -1, 1])
        recipes.push([826, 597, 515, 544, 594, 1])
        recipes.push([827, 460, 593, 516, 523, 1])
        recipes.push([828, 593, 516, 692, 523, 1])
        recipes.push([829, 467, 593, -1, -1, 1])
        recipes.push([830, 466, -1, -1, -1, 1])
        recipes.push([831, 466, -1, -1, 523, 1])
        recipes.push([832, 735, 466, 730, 521, 1])
        recipes.push([833, 735, 466, 730, 523, 1])
        recipes.push([834, 460, 526, 549, -1, 1])
        recipes.push([835, 460, 526, 549, 530, 1])
        recipes.push([836, 467, 691, 740, -1, 1])
        recipes.push([837, 463, 545, -1, -1, 1])
        recipes.push([838, 463, 545, -1, 524, 1])
        recipes.push([839, 519, 466, 549, 735, 1])
        recipes.push([840, 519, 695, 463, 735, 1])
        recipes.push([841, 519, 693, 685, 735, 1])
        recipes.push([842, 461, 545, -1, 524, 1])
        recipes.push([843, 461, 683, 685, 522, 1])
        recipes.push([844, 461, 735, -1, 521, 1])
        recipes.push([845, 465, 545, -1, -1, 1])
        recipes.push([846, 464, 545, -1, -1, 1])
        recipes.push([847, 558, 528, -1, -1,  1])
        recipes.push([848, 558, 528, 557, -1, 1])
        recipes.push([849, 559, 529, -1, -1, 1])
        recipes.push([850, 560, 528, -1, -1, 1])
        recipes.push([851, 459, -1, -1, -1, 1])
        recipes.push([852, 459, 545, -1, -1, 1])
        recipes.push([853, 459, 691, 545, -1, 1])
        recipes.push([854, 468, 545, -1, -1, 1])
        recipes.push([855, 468, 526, 691, -1, 1])
        recipes.push([856, 459, 550, -1, -1, 1])
        recipes.push([857, 458, 526, 516, -1, 1])
        recipes.push([858, 459, 691, -1, 735, 1])
        recipes.push([859, 460, 691, -1, 735, 1])
        recipes.push([860, 466, 691, 678, 735, 1])
        recipes.push([861, 462, 678, -1, -1, 1])
        recipes.push([862, 462, 520, 691, -1, 1])
        recipes.push([863, 462, 516, 683, -1, 1])
        recipes.push([864, 462, 613, -1, -1, 1])
        recipes.push([865, 462, 687, 684, -1, 1])
        recipes.push([866, 462, 730, 549, 735, 1])
        recipes.push([867, 544, 545, 683, 524, 1])
        recipes.push([868, 867, 465, -1, -1, 1])
        recipes.push([869, 867, 463, -1, -1, 1])
        recipes.push([870, 867, 464, -1, -1, 1])
        recipes.push([871, 867, 464, 465, 463, 1])
        recipes.push([872, 468, 549, 730, 735, 1])
        recipes.push([873, 468, 740, -1, -1, 1])
        recipes.push([874, 468, 670, 545, 737, 1])
        recipes.push([875, 459, 516, -1, -1, 1])
        recipes.push([876, 459, 526, 691, -1, 1])
        recipes.push([877, 459, 526, 546, -1, 1])
        recipes.push([878, 459, 686, -1, 521, 1])
        recipes.push([879, 459, 549, 730, 735, 1])
        recipes.push([880, 458, 544, 545, -1, 1])
        recipes.push([881, 466, 740, -1, -1, 1])
        recipes.push([882, 458, -1, -1, 523, 1])
        recipes.push([883, 733, 738, 546, -1, 1])
        recipes.push([884, 683, 685, 691, 522, 1])
        recipes.push([885, 515, 546, 516, -1, 1])
        recipes.push([886, 683, 520, -1, -1, 1])
        recipes.push([887, 593, 613, -1, -1, 1])
        recipes.push([888, 690, 460, 519, 516, 1])
        recipes.push([889, 466, 671, 735, 734, 1])
        recipes.push([890, 733, 561, 546, -1, 1])
        recipes.push([891, 733, 559, 546, -1, 1])
        recipes.push([892, 689, 598, 678, 736, 1])
        recipes.push([893, 689, 466, 526, 736, 1])
        recipes.push([894, 689, 550, 526, 736, 1])
        recipes.push([895, 689, 466, 550, 736, 1])
        recipes.push([896, 689, 555, 549, 736, 1])
        recipes.push([897, 689, 694, 685, 736, 1])
        recipes.push([898, 689, 463, 695, 736, 1])
        recipes.push([899, 689, 610, 679, 736,1])
        recipes.push([900, 558, 518, -1, -1, 1])
        recipes.push([901, 733, 459, 545, 522, 1])
        recipes.push([902, 733, 460, 545, 521, 1])
        recipes.push([903, 741, 460, 687, 523, 1])
        recipes.push([904, 741, 459, 691, 523, 1])
        recipes.push([905, 741, 466, 594, 523, 1])
        recipes.push([906, 741, 463, 519, 523, 1])
        recipes.push([907, 741, 593, 546, 523, 1])
        recipes.push([908, 741, 467, 695, 523, 1])
        recipes.push([909, 741, 546, 548, -1, 1])
        recipes.push([910, 467, 691, 735, 524, 1])
        recipes.push([911, 561, -1, -1, -1, 1])
        recipes.push([912, 561, 559, -1, -1, 1])
        recipes.push([913, 469, 528, 516, -1, 1])
        recipes.push([914, 469, 545, -1, 521, 1])
        recipes.push([915, 469, 518, -1, -1, 1])
        recipes.push([916, 469, 549, 730, 735, 1])
        recipes.push([917, 469, 550, 466, 463, 1])

      end
      
      ## SIDES ##
      if (type == -1 || type == 2)
        recipes.push([752, 683, 545, -1, -1, 2]) #Mashed Potato
        recipes.push([762, 683, 546, 545, -1, 2]) #Scalloped Potatoes
        recipes.push([763, 683, 533, -1, -1, 2]) #Potato Salad
        recipes.push([765, 519, 545, -1, -1, 2]) #Buttered Rice
        recipes.push([766, 519, 520, -1, -1, 2]) #Curried Rice
        recipes.push([756, 515, 546, -1, -1, 2]) #Mac & Cheese
        recipes.push([767, 515, 657, 695, 735, 2]) #Pasta Salad
        recipes.push([800, 686, -1, -1, 524, 2]) #Garlic Broccoli
        recipes.push([801, 686, -1, -1, -1, 2]) #Steamed Broccoli
        recipes.push([802, 689, 679, 688, -1, 2]) #Lettuce Wrap
        recipes.push([803, 517, 735, -1, 519, 2]) #French Fries
        recipes.push([804, 466, 734, 735, 519, 2]) #Chicky Nuggies
        recipes.push([918, 689, -1, -1, -1, 2])
        recipes.push([919, 689, -1, -1, 736, 2])
        recipes.push([920, 689, 687, -1, 736, 2])
        recipes.push([921, 689, 694, -1, 736, 2])
        recipes.push([922, 689, -1, -1, 736, 2])
        recipes.push([923, 689, 688, 738, 736, 2])
        recipes.push([924, 689, 677, 674, 736, 2])
        recipes.push([925, 689, 684, 693, 736, 2])
        recipes.push([926, 689, 678, -1, 736, 2])
        recipes.push([927, 689, 690, 692, 736, 2])
        recipes.push([928, 689, 678, 685, 736, 2])
        recipes.push([929, 689, 671, 672, 736, 2])
        recipes.push([930, 689, 673, 675, 736, 2])
        recipes.push([931, 689, 546, 738, 736, 2])
        recipes.push([932, 689, 738, 694, 736, 2])
        recipes.push([933, 689, 686, 688, 736, 2])
        recipes.push([934, 689, 687, 673, 736, 2])
        recipes.push([935, 689, 693, 686, 736, 2])
        recipes.push([936, 689, 676, 692, 736, 2])
        recipes.push([937, 694, -1, -1, -1, 2])
        recipes.push([938, 694, -1, -1, 519, 2])
        recipes.push([939, 694, 613, -1, 731, 2])
        recipes.push([940, 546, 730, 549, 735, 2])
        recipes.push([941, 546, 544, -1, -1, 2])
        recipes.push([942, 546, -1, -1, -1, 2])
        recipes.push([943, 519, -1, -1, 735, 2])
        recipes.push([944, 519, 593, -1, -1, 2])
        recipes.push([945, 519, 544, -1, 521, 2])
        recipes.push([946, 519, 544, 738, 521, 2])
        recipes.push([947, 738, 545, 691, -1, 2])
        recipes.push([948, 738, 546, -1, -1, 2])
        recipes.push([949, 684, -1, -1, -1, 2])
        recipes.push([950, 684, 545, -1, -1, 2])
        recipes.push([951, 684, 545, -1, 523, 2])
        recipes.push([952, 684, 533, -1, 523, 2])
        recipes.push([953, 517, 518, -1, -1, 2])
        recipes.push([954, 683, 548, 695, -1, 2])
        recipes.push([955, 519, 518, -1, -1, 2])
        recipes.push([956, 526, 687, 691, -1, 2])        
        recipes.push([957, 596, -1, -1, -1, 2])
        
        end
      
      ## DESSERTS ##
      if (type == -1 || type == 3)
        recipes.push([768, 733, 731, 680, -1, 3]) #Strawberry Tart
        recipes.push([769, 733, 731, 681, -1, 3]) #Blueberry Tart
        recipes.push([770, 730, 612, 549, -1, 3]) #Brownies
        recipes.push([771, 730, 732, 543, -1, 3]) #Biscuits
        recipes.push([772, 730, 545, 731, -1, 3]) #Shortbread
        recipes.push([773, 678, 544, 731, -1, 3]) #Lemon Pudding
        recipes.push([774, 610, 549, 731, -1, 3]) #P.B. Cookies
        recipes.push([775, 547, 549, -1, 734, 3]) #Cheesecake
        recipes.push([776, 547, 549, 680, 734, 3]) #Strawberry Cheesecake
        recipes.push([777, 547, 549, 681, 734, 3]) #Blueberry Cheesecake
        recipes.push([778, 547, 549, 612, 734, 3]) #Chocolate Cheesecake
        recipes.push([805, 675, 731, -1, -1, 3]) #Caramelized Pear
        recipes.push([806, 670, 730, 549, -1, 3]) #Apple Pie
        recipes.push([807, 671, 731, 549, -1, 3]) #Orange Meringue
        
      end
      
      ## BREAKFAST ##
      if (type == -1 || type == 4)
        recipes.push([779, 730, 549, 543, -1, 4]) #Pancakes
        recipes.push([780, 549, 546, -1, -1, 4]) #Omelette
        recipes.push([781, 549, 546, 555, -1, 4]) #Ham Omelette
        recipes.push([782, 549, 546, 554, -1, 4]) #Turkey Omelette
        recipes.push([783, 549, 546, 550, -1, 4]) #Bacon Omelette
        recipes.push([784, 526, 549, 543, 737, 4]) #French Toast
        recipes.push([785, 549, 550, -1, -1, 4]) #Bacon & Eggs
        recipes.push([789, 550, 549, -1, -1, 4]) #Eggs & Bacon
        recipes.push([786, 549, 543, -1, -1, 4]) #Scrambled Eggs
        recipes.push([787, 549, -1, -1, -1, 4]) #Fried Egg
        recipes.push([764, 683, 546, -1, 735, 4]) #Hashbrowns
        recipes.push([958, 670, -1, -1, 737, 4])
        recipes.push([959, 526, 549, -1, -1, 4])
        recipes.push([960, 527, -1, -1, -1, 4])
        recipes.push([961, 527, 547, -1, -1, 4])
        recipes.push([962, 527, 610, -1, -1, 4])
        recipes.push([963, 527, 550, -1, -1, 4])
        recipes.push([964, 527, 546, -1, -1, 4])
        recipes.push([965, 741, 549, -1, -1, 4])
        recipes.push([966, 741, 549, 550, -1, 4])
        recipes.push([967, 741, 549, 561, -1, 4])
        recipes.push([968, 526, 545, 731, 737, 4])
        recipes.push([969, 733, 545, 731, 737, 4])
        recipes.push([970, 733, 670, 545, 737, 4])
        recipes.push([971, 733, 545, -1, -1, 4])
        recipes.push([972, 733, 545, 546, -1, 4])
        recipes.push([973, 733, 545, 612, -1, 4])
        recipes.push([974, 527, 612, -1, -1, 4])
        recipes.push([975, 544, 680, -1, -1, 4])
        recipes.push([976, 544, 681, -1, -1, 4])
        recipes.push([977, 544, 674, -1, -1, 4])
        recipes.push([978, 527, 549, -1, -1, 4])
      end
      
      ## INGREDIENTS ##
      if (type == -1 || type == 5)
        recipes.push([516, 687, 545, 691, -1, 5]) #Tomato Sauce
      end
      
      return recipes
    end
    
    def self.get_ingredients(type=0)
      # Get a list of ingredient item IDs
      # Type variable acts as category
      # 0: All ingredients
      # 1: Base ingredients
      # 2: Extra ingredients
      # 3: Spices
      ingredients = Array.new
      if (type == 0 || type == 1)
        # Base ingredients
        ingredients.push(458)
        ingredients.push(459)
        ingredients.push(460)
        ingredients.push(461)
        ingredients.push(462)
        ingredients.push(463)
        ingredients.push(464)
        ingredients.push(465)
        ingredients.push(466)
        ingredients.push(467)
        ingredients.push(468)
        ingredients.push(469)
        ingredients.push(513)
        ingredients.push(514)
        ingredients.push(515)
        ingredients.push(516)
        ingredients.push(517)
        ingredients.push(518)
        ingredients.push(519)
        ingredients.push(526)
        ingredients.push(527)
        ingredients.push(544)
        ingredients.push(546)
        ingredients.push(547)
        ingredients.push(549)
        ingredients.push(550)
        ingredients.push(558)
        ingredients.push(559)
        ingredients.push(560)
        ingredients.push(593)
        ingredients.push(595)
        ingredients.push(596)
        ingredients.push(597)
        ingredients.push(601)
        ingredients.push(610)
        ingredients.push(670)
        ingredients.push(671)
        ingredients.push(675)
        ingredients.push(678)
        ingredients.push(683)
        ingredients.push(684)
        ingredients.push(686)
        ingredients.push(687)
        ingredients.push(689)
        ingredients.push(690)
        ingredients.push(693)
        ingredients.push(694)
        ingredients.push(730)
        ingredients.push(733)
        ingredients.push(735)
        ingredients.push(738)
        ingredients.push(741)
        ingredients.push(759)
        ingredients.push(867)

      end
      if (type == 0 || type == 2)
        # Extra ingredients
        ingredients.push(460)
        ingredients.push(643)
        ingredients.push(466)
        ingredients.push(516)
        ingredients.push(518)
        ingredients.push(519)
        ingredients.push(520)
        ingredients.push(526)
        ingredients.push(528)
        ingredients.push(529)
        ingredients.push(533)
        ingredients.push(543)
        ingredients.push(544)
        ingredients.push(545)
        ingredients.push(546)
        ingredients.push(547)
        ingredients.push(549)
        ingredients.push(550)
        ingredients.push(554)
        ingredients.push(555)
        ingredients.push(557)
        ingredients.push(561)
        ingredients.push(593)
        ingredients.push(595)
        ingredients.push(598)
        ingredients.push(610)
        ingredients.push(612)
        ingredients.push(613)
        ingredients.push(670)
        ingredients.push(671)
        ingredients.push(672)
        ingredients.push(673)
        ingredients.push(674)
        ingredients.push(675)
        ingredients.push(676)
        ingredients.push(677)
        ingredients.push(678)
        ingredients.push(679)
        ingredients.push(680)
        ingredients.push(681)
        ingredients.push(683)
        ingredients.push(684)
        ingredients.push(685)
        ingredients.push(686)
        ingredients.push(687)
        ingredients.push(688)
        ingredients.push(690)
        ingredients.push(691)
        ingredients.push(692)
        ingredients.push(693)
        ingredients.push(694)
        ingredients.push(695)
        ingredients.push(730)
        ingredients.push(731)
        ingredients.push(732)
        ingredients.push(734)
        ingredients.push(738)
        ingredients.push(740)
           
      end
      if (type == 3)
        # Spices
        ingredients.push(463)
        ingredients.push(516)
        ingredients.push(521)
        ingredients.push(522)
        ingredients.push(523)
        ingredients.push(524)
        ingredients.push(530)
        ingredients.push(594)
        ingredients.push(731)
        ingredients.push(732)
        ingredients.push(735)
        ingredients.push(736)
        ingredients.push(737)       
        
      end
      return ingredients
    end
    
    def self.get_categories
      categories = Array.new
      # Create a new category, variable order is as follows
      # 0: Icon ID of category
      # 1: Name of category
      
      categories.push([946, "Quick Food"])
      categories.push([1172, "Mains"])
      categories.push([955, "Sides"])
      categories.push([966, "Desserts"])
      categories.push([967, "Breakfast"])
      categories.push([976, "Ingredients"])
      
      return categories
    end
  
    def self.init_recipe_variables
      #$game_variables[1354] = self.get_recipes
      if ($game_variables[1353].is_a? Fixnum)
        $game_variables[1353] = Array.new
      end
    end
    
    # Item data for garbage food
    def self.failed_recipe_item
      return $data_items[455]
    end
    
    # Grab the recipe array
    def self.get_recipe_book
      return self.get_recipes #$game_variables[1354]
    end
    
    # Grab the known recipes array
    def self.get_known_recipes
      return $game_variables[1353]
    end
    
    # Grab the last recipe cooked's ID
    def self.get_last_recipe
      return $game_variables[1350]
    end
    
    # Grab the last recipe cooked's name
    def self.get_last_recipe_name
      return $game_variables[1351]
    end
    
    # Grab the last recipe cooked's icon ID
    def self.get_last_recipe_icon
      return $game_variables[1352]
    end
    

    # Set the last recipe cooked's ID
    def self.set_last_recipe(value)
      $game_variables[1350] = value
    end
    
    # Set the last recipe cooked's name
    def self.set_last_recipe_name(value)
      $game_variables[1351] = value
    end
    
    # Set the last recipe cooked's icon ID
    def self.set_last_recipe_icon(value)
      $game_variables[1352] = value
    end
    
    # Get the player's cooking skill
    def self.get_cooking_skill
      return $game_variables[1692]
    end
    
    # Set the player's cooking skill
    def self.set_cooking_skill(value)
      $game_variables[1692] = value
    end
    
    # The check value for cooking garbage
    def self.get_garbage_chance
      return 15
    end
    
    # Common event to run when cooking is finished
    def self.cooking_common_event
      $game_temp.reserve_common_event(490)
    end
    
    # Pass in ingredients and return the cooked item!
    def self.cook_recipe(ingredients)
      recipes = self.get_recipes
      item = nil
      
      # Parse through our recipe listings and see if the
      # ingredients match any
      if (!recipes.empty?)
        recipes.each_with_index do |recipe, index|
          # Set up a match flag and process the recipe
          # to determine if anything flags it as not being a match
          match = true

          # Check if base ingredients match
          if recipe[1] != ingredients[0].id
            match = false
          end

          # Check if this recipe has no extra ingredients
          extra = true
          if match
            if recipe[2] < 0 && recipe[3] < 0
              match = (ingredients[1] == nil && ingredients[2] == nil)
              extra = false
            end
          end

          # Check extra ingredients if we have them
          if extra
            # Setup for extra ingredient checks
            extraingredient1 = (ingredients[1].nil?) ? -1 : ingredients[1].id
            extraingredient2 = (ingredients[2].nil?) ? -1 : ingredients[2].id
            extraingredient1used = false
            extraingredient2used = false

            # Check extra ingredient #1
            if match
              extra1 = false
              recipe_id = recipe[2]

              if !extraingredient1used && recipe_id == extraingredient1
                extraingredient1used = true
                extra1 = true
              elsif !extraingredient2used && recipe_id == extraingredient2
                extraingredient2used = true
                extra1 = true
              end

              if !extra1
                match = false
              end
            end

            # Check extra ingredient #2
            if match
              extra2 = false
              recipe_id = recipe[3]

              if !extraingredient1used && recipe_id == extraingredient1
                extraingredient1used = true
                extra2 = true
              elsif !extraingredient2used && recipe_id == extraingredient2
                extraingredient2used = true
                extra2 = true
              end

              if !extra2
                match = false
              end
            end
          end

          # Does the spice match?
          if match
            if (recipe[4] >= 0)
              if ingredients[3].nil?
                match = false
              elsif recipe[4] != ingredients[3].id
                match = false
              end
            end
          end

          # If we have a match at this point, assign the result item
          # from the recipe
          if match
            item = $data_items[recipe[0]]
            # Unlock the recipe in the player's recipe book
            self.get_known_recipes[index] = true
          end
        end
      end
      
      # Pass back the item cooked
      return item
      $game_variables[9] += 1

    end
  end
end