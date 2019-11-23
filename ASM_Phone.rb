module ASM
  module Phone
    # Check for any email notifications
    # Be sure to add any conditionals used in the common event here so HUD updates
    def self.has_notifications
      # No messages if no reception
      if !ASM::has_phone_reception
        return false
      end
      # Shelly Party Invite
      if $game_switches[1929] && $game_variables[1267] == 1
        return true
      end
      # Silver Lotto
      if $game_switches[1815] && $game_switches[1817]
        return true
      end
      # Gold Lotto
      if $game_switches[1816] && $game_switches[1818]
        return true
      end
      # Reading Reminder
      if $game_switches[1784]
        return true
      end
      # Superfan Email
      if $game_switches[1400] && $game_switches[1785]
        return true
      end
    end
  end
end