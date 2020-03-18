#CONTINUITY EXPORTER
#SCRIPT CALL TO MAKE: Use line 4 below to call script
#
# @instance_class = Continuity.new
# 
class Continuity

def initialize
write_cont_file
end

def write_cont_file

tempsave = DataManager.last_savefile_index + 1
fname = "ProjCon_" + tempsave.to_s + "_" + $game_actors[20].name + "_and_" + $game_actors[21].name + ".txt"
contfile = File.open(fname, "w")
contfile.puts "Save ID: " + tempsave.to_s
contfile.puts "Player Name: " + $game_actors[20].name
contfile.puts "Lover Name: " + $game_actors[21].name
contfile.puts "========="
contfile.puts "VARIABLES"
contfile.puts "========="
contfile.puts "V[40]End Game Cash: $" + $game_variables[40].to_s
contfile.puts "V[189]Boxes Moved: " + $game_variables[189].to_s
contfile.puts "V[1215]Baseball Cards Owned: " + $game_variables[1215].to_s
contfile.puts "V[022] Q Darkeff Drugs: " + $game_variables[22].to_s
contfile.puts "V[038] Teliwagers Balance: " + $game_variables[38].to_s
contfile.puts "V[039] Bank Balance: " + $game_variables[39].to_s
contfile.puts "V[054] Times pickpocketed: " + $game_variables[54].to_s
contfile.puts "V[088] Jack Bullet count: " + $game_variables[88].to_s
contfile.puts "V[108] Jack Friendship: " + $game_variables[108].to_s
contfile.puts "V[120] Character: " + $game_variables[120].to_s
contfile.puts "V[121] Gender: " + $game_variables[121].to_s
contfile.puts "V[122] Race: " + $game_variables[122].to_s
contfile.puts "V[123] Love Gender: " + $game_variables[123].to_s
contfile.puts "V[124] Lover Race: " + $game_variables[124].to_s
contfile.puts "V[125] Lover Character: " + $game_variables[125].to_s
contfile.puts "V[130] Orientation: " + $game_variables[130].to_s
contfile.puts "V[131] Archetype: " + $game_variables[131].to_s
contfile.puts "V[134] Made Jack Call: " + $game_variables[134].to_s
contfile.puts "V[136] Jacks quest done: " + $game_variables[136].to_s
contfile.puts "V[263] Times slept at Haileys: " + $game_variables[263].to_s
contfile.puts "V[273] Q Mansion outcome: " + $game_variables[273].to_s
contfile.puts "V[376] Belly Crunched: " + $game_variables[376].to_s
contfile.puts "V[404] SMoked how many smokes: " + $game_variables[404].to_s
contfile.puts "V[405] Dog pet counts: " + $game_variables[405].to_s
contfile.puts "V[410] POO COUNTER: " + $game_variables[410].to_s
contfile.puts "V[451] Weed job times worked: " + $game_variables[451].to_s
contfile.puts "V[459] Garden times worked: " + $game_variables[459].to_s
contfile.puts "V[461] Breakfast choice: " + $game_variables[461].to_s
contfile.puts "V[528] Mayor choice: " + $game_variables[528].to_s
contfile.puts "V[530] RPS total winnings: " + $game_variables[530].to_s
contfile.puts "V[539] RPS total matches: " + $game_variables[539].to_s
contfile.puts "V[548] Bridge outcome: " + $game_variables[548].to_s
contfile.puts "V[568] Marks GF: " + $game_variables[568].to_s
contfile.puts "V[590] Sermon opinion: " + $game_variables[590].to_s
contfile.puts "V[591] Sins confessed: " + $game_variables[591].to_s
contfile.puts "V[746] Fan Level: " + $game_variables[746].to_s
contfile.puts "V[750] Break up reason: " + $game_variables[750].to_s
contfile.puts "V[760] Race outcome: " + $game_variables[760].to_s
contfile.puts "V[762] Jerk Off Counter: " + $game_variables[762].to_s
contfile.puts "V[780] Sold Journal: " + $game_variables[780].to_s
contfile.puts "V[787] Larry Booted you: " + $game_variables[787].to_s
contfile.puts "V[788] Belinda Booted you: " + $game_variables[788].to_s
contfile.puts "V[789] Nobody Booted you: " + $game_variables[789].to_s
contfile.puts "V[833] Alley Outcome: " + $game_variables[833].to_s
contfile.puts "========"
contfile.puts "SWITCHES"
contfile.puts "========"
contfile.puts "S[559]Punk Access: " + $game_switches[559].to_s
contfile.puts "S[560]Union Access: " + $game_switches[560].to_s
contfile.puts "S[614]Detective Access: " + $game_switches[614].to_s
contfile.puts "S[1537]Has apartment key: " + $game_switches[1537].to_s
contfile.puts "S[1533]Likes strippers: " + $game_switches[1533].to_s
contfile.puts "S[1534]Owns Darkeff Guitar: " + $game_switches[1534].to_s
contfile.puts "S[1535]Owns Viper Necklace: " + $game_switches[1535].to_s
contfile.puts "S[1536]Heroin Keeper: " + $game_switches[1536].to_s
contfile.puts "S[040] Slept outside: " + $game_switches[40].to_s
contfile.puts "V[047] Newspaper job: " + $game_switches[47].to_s
contfile.puts "S[048] Ad agency job: " + $game_switches[48].to_s
contfile.puts "S[049] Have dog locket: " + $game_switches[49].to_s
contfile.puts "S[052] Woman has dog: " + $game_switches[52].to_s
contfile.puts "S[053] Sold Dog: " + $game_switches[53].to_s
contfile.puts "S[061] Helped Old Lady: " + $game_switches[61].to_s
contfile.puts "S[071] Jack is dead: " + $game_switches[71].to_s
contfile.puts "S[126] Know Hailey: " + $game_switches[126].to_s
contfile.puts "S[127] Know Lady: " + $game_switches[127].to_s
contfile.puts "S[128] Stealer: " + $game_switches[128].to_s
contfile.puts "S[129] Know Jack: " + $game_switches[129].to_s
contfile.puts "S[130] Jack is friend: " + $game_switches[130].to_s
contfile.puts "S[132] Is gay: " + $game_switches[132].to_s
contfile.puts "S[139] Interacial couple: " + $game_switches[139].to_s
contfile.puts "S[275] Saw Sex: " + $game_switches[275].to_s
contfile.puts "S[276] Faitful: " + $game_switches[276].to_s
contfile.puts "S[277] Stle from Hailey: " + $game_switches[277].to_s
contfile.puts "S[292] Killed poor people: " + $game_switches[292].to_s
contfile.puts "S[303] Darkeff sick: " + $game_switches[303].to_s
contfile.puts "S[304] Viper sick: " + $game_switches[304].to_s
contfile.puts "S[314] Smached docs car: " + $game_switches[314].to_s
contfile.puts "S[315] Took docs photo: " + $game_switches[315].to_s
contfile.puts "S[321] Patient died: " + $game_switches[321].to_s
contfile.puts "S[335] Rode with jack: " + $game_switches[335].to_s
contfile.puts "S[356] Visited Chance: " + $game_switches[356].to_s
contfile.puts "S[359] Took Dons last beer: " + $game_switches[359].to_s
contfile.puts "S[365] Dead Chance: " + $game_switches[365].to_s
contfile.puts "S[399] Gave pass to chance: " + $game_switches[399].to_s
contfile.puts "S[400] Saved chance: " + $game_switches[400].to_s
contfile.puts "S[475] Darkeff Alive: " + $game_switches[475].to_s
contfile.puts "S[476] Viper Alive: " + $game_switches[476].to_s
contfile.puts "S[477] Darkeff Dead: " + $game_switches[477].to_s
contfile.puts "S[478] Viper dead: " + $game_switches[478].to_s
contfile.puts "S[480] Paid for rehab: " + $game_switches[480].to_s
contfile.puts "S[484] Stole from squatters: " + $game_switches[484].to_s
contfile.puts "S[487] Dream 1 called sam: " + $game_switches[487].to_s
contfile.puts "S[488] Dream 1 called Larry: " + $game_switches[488].to_s
contfile.puts "S[529] Bechdel test: " + $game_switches[529].to_s
contfile.puts "S[536] Salon Finished: " + $game_switches[536].to_s
contfile.puts "S[557] Browntown: " + $game_switches[557].to_s
contfile.puts "S[558] Forman splat: " + $game_switches[558].to_s
contfile.puts "S[563] Knows fishing kid died: " + $game_switches[563].to_s
contfile.puts "S[598] Hoard supporter: " + $game_switches[598].to_s
contfile.puts "S[615] Dick door unlock: " + $game_switches[615].to_s
contfile.puts "S[616] Traded brick: " + $game_switches[616].to_s
contfile.puts "S[654] Key Run away from landlord: " + $game_switches[654].to_s
contfile.puts "S[662] Punk Hack btrayer: " + $game_switches[662].to_s
contfile.puts "S[663] Union hack betrayer: " + $game_switches[663].to_s
contfile.puts "S[689] Shit on dead man: " + $game_switches[689].to_s
contfile.puts "S[691] Kicked sattelite: " + $game_switches[691].to_s
contfile.puts "S[698] Hoard ville: " + $game_switches[698].to_s
contfile.puts "S[699] Trudeau town: " + $game_switches[699].to_s
contfile.puts "S[703] Fishing kid Died: " + $game_switches[703].to_s
contfile.puts "S[704] Fishing kid lived: " + $game_switches[704].to_s
contfile.puts "S[718] Own the bridge bed: " + $game_switches[718].to_s
contfile.puts "S[722] Bacon fan: " + $game_switches[722].to_s
contfile.puts "S[723] Egg fan: " + $game_switches[723].to_s
contfile.puts "S[724] Not a fan of bacon or eggs: " + $game_switches[724].to_s
contfile.puts "S[725] Offered to get wood: " + $game_switches[725].to_s
contfile.puts "S[768] Theist: " + $game_switches[768].to_s
contfile.puts "S[769] ATHEIST: " + $game_switches[769].to_s
contfile.puts "S[774] KEPT OLD LADY CHANGE: " + $game_switches[774].to_s
contfile.puts "S[775] Helped old lady day: " + $game_switches[775].to_s
contfile.puts "S[776] Helped old lady night: " + $game_switches[776].to_s
contfile.puts "S[777] Drug enabler: " + $game_switches[777].to_s
contfile.puts "S[778] LEft drugs: " + $game_switches[778].to_s
contfile.puts "S[779] Gave drugs: " + $game_switches[779].to_s
contfile.puts "S[780] Sold drugs: " + $game_switches[780].to_s
contfile.puts "S[786] Visited mansion: " + $game_switches[786].to_s
contfile.puts "S[787] Took newspaper bribe: " + $game_switches[787].to_s
contfile.puts "S[794] Strip club employee: " + $game_switches[794].to_s
contfile.puts "S[796] Blue racer: " + $game_switches[796].to_s
contfile.puts "S[797] Red racer: " + $game_switches[797].to_s
contfile.puts "S[799] Driver is player: " + $game_switches[799].to_s
contfile.puts "S[800] Driver is Mark: " + $game_switches[800].to_s
contfile.puts "S[801] Is steam app: " + $game_switches[801].to_s
contfile.puts "S[862] Mark knows: " + $game_switches[862].to_s
contfile.puts "S[863] Mark is ignoramus: " + $game_switches[863].to_s
contfile.puts "S[875] Cut the brakes: " + $game_switches[875].to_s
contfile.puts "S[686] Car poo master: " + $game_switches[686].to_s
contfile.puts "S[687] Car poo expert: " + $game_switches[687].to_s
contfile.puts "S[916] Car poo x 2: " + $game_switches[916].to_s
contfile.puts "S[917] Car poo x 3: " + $game_switches[917].to_s
contfile.puts "S[918] Car poo x 4: " + $game_switches[918].to_s
contfile.puts "S[947] Trans chill: " + $game_switches[947].to_s
contfile.puts "S[948] transphobic: " + $game_switches[948].to_s
contfile.puts "S[949] trans player: " + $game_switches[949].to_s
contfile.puts "S[950] Strans lover: " + $game_switches[950].to_s
contfile.puts "S[951] Morgon complete: " + $game_switches[951].to_s
contfile.puts "S[953] Player dead: " + $game_switches[953].to_s
contfile.puts "S[954] Sam dead: " + $game_switches[954].to_s
contfile.puts "S[955] Both live: " + $game_switches[955].to_s
contfile.puts "S[956] Player married: " + $game_switches[956].to_s
contfile.puts "S[961] Player is author: " + $game_switches[961].to_s
contfile.puts "S[962] Sam is author: " + $game_switches[962].to_s
contfile.puts "S[965] Mark is dead: " + $game_switches[965].to_s
contfile.puts "S[968] The dumped: " + $game_switches[968].to_s
contfile.puts "S[969] The dumper: " + $game_switches[969].to_s
contfile.puts "S[978] Stan is dead: " + $game_switches[978].to_s
contfile.puts "S[1020] Player paid parker: " + $game_switches[1020].to_s
contfile.puts "S[1030] Worthy: " + $game_switches[1030].to_s
contfile.puts "S[1031] Unworthy: " + $game_switches[1031].to_s
contfile.puts "S[1043] Larry divoreced: " + $game_switches[1043].to_s
contfile.puts "S[1085] Brakes cut: " + $game_switches[1085].to_s
contfile.puts "S[1097] Judgement - Keep hair: " + $game_switches[1097].to_s
contfile.puts "S[1098] Judgement - Abandon red: " + $game_switches[1098].to_s
contfile.puts "S[1099] Judgement - Went in vents: " + $game_switches[1099].to_s
contfile.puts "S[1100] Judgement - Pervo: " + $game_switches[1100].to_s
contfile.puts "S[1101] Judgement - Told about carla: " + $game_switches[1101].to_s
contfile.puts "S[1102] Judgement - Did not tell about carla: " + $game_switches[1102].to_s
contfile.puts "S[1110] Got carla dance: " + $game_switches[1110].to_s
contfile.close
    
end #my_Method
end #Class