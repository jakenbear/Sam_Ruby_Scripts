#LOGS WORD 1 and 2 IN FINALE FOR TESTING
#SCRIPT CALL TO MAKE: Use line 5 below to call script word 1
#SCRIPT CALL TO MAKE: Use line 6 below to call script word 2
#
# @instance_class = Word1_logger.new
# @instance_class = Word2_logger.new
#
class Word1_logger

def initialize
write_log_file_1
end

def write_log_file_1
  f = File.open('Word_1_log.txt', 'a')
  f.puts $game_variables[200].to_s
  f.close
end #my_Method

end #Class

class Word2_logger

def initialize
write_log_file_2
end

def write_log_file_2
  f = File.open('Word_2_log.txt', 'a')
  f.puts $game_variables[200].to_s
  f.close
end #my_Method

end #Class