module ASM
  module ShelfStorage
    
    def self.init_storage_variables
      if ($game_variables[1956].is_a? Fixnum)
        $game_variables[1956] = Array.new
      end
    end
    
    def self.get_storage_arrays
      return $game_variables[1956]
    end
    
    def self.get_storage_index
      return $game_variables[1957]
    end
    
    def self.get_storage_array(index)
      if get_storage_arrays[index].nil?
        get_storage_arrays[index] = Hash.new
      end
      return get_storage_arrays[index]
    end
    
    def self.get_storage_items(index)
      items = Array.new
      storage = get_storage_array(index)
      for item in storage
        if item[1] > 0
          items.push($data_items[item[0]])
        end
      end
      return items
    end
    
    def self.get_item_amount(index, item_id)
      amount = get_storage_array(index)[item_id]
      if amount.nil?
        amount = 0
      end
      return amount
    end
    
    def self.modify_item_amount(index, item_id, amount)
      if get_storage_array(index)[item_id].nil?
        get_storage_array(index)[item_id] = 0
      end
      get_storage_array(index)[item_id] += amount
      if get_storage_array(index)[item_id] < 0
        get_storage_array(index)[item_id] = 0
      end
    end
    
    def self.set_item_amount(index, item_id, amount)
      if get_storage_array(index)[item_id].nil?
        get_storage_array(index)[item_id] = 0
      end
      get_storage_array(index)[item_id] = amount
      if get_storage_array(index)[item_id] < 0
        get_storage_array(index)[item_id] = 0
      end
    end
    
    def self.clear_storage(index)
      get_storage_arrays[index] = Hash.new
    end
    
    def self.storage_count(index)
      return get_storage_items(index).length
    end
    
    def self.storage_full(index, stack_check = true)
      count = storage_count(index)
      capacity = storage_capacity(index)
      full = (count >= capacity)
      if full && stack_check
        storage = get_storage_array(index)
        for item in storage
          if item[1] > 0 && item[1] < storage_item_capacity(index)
            full = false
          end
        end
      end
      return full
    end
    
    def self.storage_item_full(index, item_id)
      count = get_item_amount(index, item_id)
      capacity = storage_item_capacity(index)
      return count >= capacity || (count == 0 && storage_full(index, false))
    end
    
    def self.storage_item_space(index, item_id)
      count = get_item_amount(index, item_id)
      return storage_item_capacity(index) - count
    end
    
    def self.storage_capacity(index)
      capacity = case index
      when 0 then 20 # Shelf 0 max 20 items
      when 1 then 20 # Shelf 1 max 10 items
      when 3 then 0
      when 7 then 0
      when 8 then 0
      when 11 then 6
      when 13 then 6
      when 14 then 8
      when 15 then 6
        else 10 # default value
      end
      return capacity
    end
    
    def self.storage_item_capacity(index)
      capacity = case index
      when 0 then 20 # Shelf 0 max 20 of each item
      when 1 then 20 # Shelf 1 max 10 of each item
      when 3 then 0
      when 7 then 0
      when 8 then 0
      when 11 then 4
      when 12 then 6
      when 13 then 6
      when 14 then 8
      when 15 then 3
      else 20 # default value
      end
      return capacity
    end
    
    # Set the name for a shelf
    def self.storage_name(index)
      name = case index
      when 0 then "Fridge" #HomeFridge
      when 1 then "Crisper" #DEFUNCT
      when 2 then "Freezer"
      when 3 then "Fruitbowl"
      when 4 then "Cupboard"
      when 5 then "Suitcase"
      when 6 then "Fridge" #BusFridge
      when 7 then "Spice Rack"
      when 8 then "Medicine Cabinet"
      when 9 then "Dresser"
      when 10 then "Hamper"
      when 11 then "Bar"
      when 12 then "Washer"
      when 13 then "Dryer"
      when 14 then "Laundry Pile"
      when 15 then "Sink Cabinet"
        else "Shelf"
      end
      return name
    end
    
    # Set the command prompt for adding items to a shelf
    def self.storage_add_prompt(index)
      text = case index
      when 0 then "Store In " + storage_name(index)
      when 1 then "Store In " + storage_name(index)
      when 2 then "Keep In " + storage_name(index)
      when 3 then "Put In " + storage_name(index)
      when 4 then "Stow In " + storage_name(index)
      when 5 then "Pack In " + storage_name(index)
      when 6 then "Store In " + storage_name(index)
      when 7 then "Put In " + storage_name(index)
      when 8 then "Keep In " + storage_name(index)
      when 9 then "Place In " + storage_name(index)
      when 10 then "Toss In " + storage_name(index)
      when 11 then "Stock The " + storage_name(index)
      when 12 then "Put In " + storage_name(index)
      when 13 then "Put In " + storage_name(index)
      when 14 then "Toss On " + storage_name(index)
      when 15 then "Keep In " + storage_name(index)
        else "Add to " + storage_name(index)
      end
    end
    
    # Set the command prompt for closing a shelf
    def self.storage_close_prompt(index)
      text = case index
      when 0 then "Close"
      when 1 then "Close"
      when 2 then "Close"
      when 3 then "Leave"
      when 4 then "Leave"
      when 5 then "Zip-up"
      when 6 then "Close"
      when 7 then "Leave"
      when 8 then "Close"
      when 9 then "Close"
      when 10 then "Leave"
      when 11 then "Leave"
      when 12 then "Done"
      when 13 then "Done"
      when 14 then "Leave"
      when 15 then "Close"
      else "Close"
      end
    end
    
    # Set the command prompt for returning to a shelf after adding items
    def self.storage_return_prompt(index)
      text = case index
      when 0 then "Finished"
      else "Finished"
      end
    end
    
    # Set the help text for adding items to a shelf
    def self.storage_add_help(index)
      text = case index
      when 0 then "Put stuff in the fridge"
      when 1 then "Store stuff in the crisper"
      when 2 then "Freeze something"
      when 3 then "Eat fruit, don't put it back"
      when 4 then "Put something on the shelves"
      when 5 then 
        if $game_switches[1324] == true
          "Stash something in your suitcase"
        else
          "Pack your suitcase for the tour"
        end 
      when 6 then
        if $game_variables[1416] == 0
          "No guarantees it won't be eaten"
        else
        if $game_variables[1416] == 1
          "Be sure to label what's yours"
        else
        if $game_variables[1416] == 2
          "Keep all breakables on the bottom shelf"
        end end end
      when 7 then "There's no extra room in the rack"
      when 8 then "Put your meds in the cabinet"
      when 9 then "Hide stuff in your dresser"
      when 10 then "Trow something dirty in the hamper"
      when 11 then "Put another bottle on the shelf"
      when 12 then "Put clothes in washer"
      when 13 then "Put clothes in dryer"
      when 14 then "Throw dirty clothes on the pile"
      when 15 then "Keep your personal items organized"
      else "Add to " + storage_name(index)
      end
    end
    
    # Set the help text for closing a shelf
    def self.storage_close_help(index)
      text = case index
      when 0 then "Quit wasting electricity and close the door"
      when 1 then "You should never have gotten here"
      when 2 then "Close the door before you freeze to death"
      
      when 3 then 
        $game_variables[1416] = ASM::ShelfStorage::get_item_amount(3, 743)
        if $game_variables[1416] > 0
          "Just leave all that rotten fruit in there"
        else
          "Got all the fruit you need"
        end
      
      when 4 then "Leave the shelves for now"
      when 5 then "Try and get that zipper closed"
      when 6 then "Close the door before something falls out"
      when 7 then "Finished picking through the spices"
      when 8 then "Don't need anything else here"
      when 9 then "Figured out what you're going to wear?"
      
        when 10 then 
        $game_variables[929] = 0
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 994)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 995)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 996)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 997)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 998)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(10, 999)
        if $game_variables[929] > 3
          "Should probably do the laundry soon"
        else
          "The laundry should be fine for a little while"
        end
      when 11 then "Got all you need?"
      when 12 then 
        $game_variables[931] = 0
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 991)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 992)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 993)
        if $game_variables[931] > 0
          "These wet clothes are ready for the dryer"
        else
        $game_variables[931] = 0
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 997)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 998)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(12, 999)
        if $game_variables[931] > 0
          "Should take out those clean clothes"
        else
        $game_variables[931] = 0
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(10, 994)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(10, 995)
        $game_variables[931] += ASM::ShelfStorage::get_item_amount(10, 996)
        if $game_variables[931] = 0
          "Need to put in some dirty clothes"
        else if $game_variables[931] < 3
          "Not quite enough for a full load"
        else
          "I could start a load of laundry now"
        end end end end 
        
        when 13 then 
        $game_variables[929] = 0
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 997)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 998)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 999)
        if $game_variables[929] > 0
          "Should take out these fresh clothes"
        else
        $game_variables[929] = 0
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 994)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 995)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 996)
        if $game_variables[929] > 0
          "Should probably wash these first"
        else 
        $game_variables[929] = 0
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 991)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 992)
        $game_variables[929] += ASM::ShelfStorage::get_item_amount(13, 993)
        if $game_variables[929] > 0
          "Not quite enough for a full load"
        else
          "I could start a load of laundry now"
        end end end          
        when 14 then "A good home for dirty clothes"  
        when 15 then "A place to store your deoderant"
        else "Close the " + storage_name(index)
      end
    end
    
    # Set the help text for returning to a shelf after adding items
    def self.storage_return_help(index)
      text = case index
      when 0 then "Finished placing items in the " + storage_name(index)
      else "Finished placing items in the  " + storage_name(index)
      end
    end
    
    # Set if an item can be stored in shelves
    def self.storable(item)
      store = case item.id
      when 341 then false # Draft page item id = 341
      when 362 then false # Manuscript item id = 362
      when 388 then false # Cellphone item id = 388
      else true
      end
      
      return store
    end
    
  end
end