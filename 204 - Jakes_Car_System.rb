module SAM_CARS

#CONFIG
SAFETY_SWITCH = 2852
CITY_VAR = 1148
CAR_X = 2188
CAR_Y = 2189

#City 1 Stop Locations
CITY_1 = 
[
[34,42],
[34,43],
[68,42],
[68,43],
[101,42],
[101,43],
[106,36],
[107,36],
[109,22],
[110,22],
[101,17],
[101,18],
[17,14],
[17,15],
[9,23],
[10,23],
[6,36],
[7,36],
[9,48],
[10,48],
[6,64],
[7,64],
[15,67],
[15,68],
[34,70],
[34,71],
[39,64],
[40,64],
[48,67],
[48,68],
[68,70],
[68,71],
[73,63],
[74,63],
[82,67],
[82,68],
[101,70],
[101,71],
[106,63],
[107,63],
[109,47],
[110,47],
[82,39],
[82,40],
[76,48],
[77,48],
[48,39],
[48,40],
[42,48],
[43,48],
[15,39],
[15,40]
]

#City 2 Stop Locations
CITY_2 = 
[
[49,26],
[62,24],
[57,29],
[50,45],
[74,43],
[68,50]
]

#City 3 Stop Locations
CITY_3 = 
[
[76,6],
[62,13],
[22,11],
[15,19],
[13,31],
[22,34],
[15,42],
[13,54],
[23,59],
[71,61],
[76,52],
[83,59],
[78,43],
[70,36]
]

#City 4 Stop Locations
CITY_4 = 
[
[14,27],
[20,21],
[28,25],
[22,32],
[20,39],
[20,38],
[20,40]
]

#City 5 Stop Locations
CITY_5 = 
[
[33,23],
[40,29],
[47,21],
[68,23],
[76,29],
[82,21],
[96,23],
[38,39],
[32,46],
[32,72],
[38,64],
[40,59],
[46,53],
[68,55],
[68,72],
[74,64],
[74,48]
]

def self.reset
   $game_switches[SAFETY_SWITCH] = false
end

def self.register_hit
   $game_switches[SAFETY_SWITCH] = true
end

def self.set_list
  if $game_variables[CITY_VAR] <= 1
    return CITY_1
  elsif $game_variables[CITY_VAR] == 2
    return CITY_2
  elsif $game_variables[CITY_VAR] == 3
    return CITY_3
  elsif $game_variables[CITY_VAR] == 4
    return CITY_4
  else
    return CITY_5
  end
end #set 

def self.run_safety_check
  self.reset
  hit_vector = [$game_variables[CAR_X],$game_variables[CAR_Y]]
  stop_locations = self.set_list
  
  #run check
  stop_locations.each do |stop|
    if stop == hit_vector
      self.register_hit
      break
    end # check
  end # loop
end # safety check

end #module