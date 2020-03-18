# Parallel Process Events Execution Bug Fix.
# Version 1.0.0
# 09/02/15 - DD/MM/YY
# www.rpgmakersource.com
# forums.rpgmakersource.com

#class Game_Interpreter
# Overwrites default method with the fixed version.
# def run
 #  wait_for_message
 #  while @list[@index] do
 #    execute_command
 #    @index += 1
 #  end
 #  @fiber = nil
 #  Fiber.yield
 #end
#end