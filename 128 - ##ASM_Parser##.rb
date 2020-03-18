module ASM
  module Parser
    def self.get_word(actor_id)
      if ($game_actors[actor_id] != nil)
        $game_actors[actor_id].name =
        $game_actors[actor_id].name.downcase.gsub(/[^\w\s\d]/, '')
        return $game_actors[actor_id].name
      else
        return nil
      end
    end
    
    def self.get_word_lists
      synonyms = Hash.new
      # Create a new synonym list
      # Template is as follows
      # synonyms.store("word-to-return", ["synonym1", "synonym2", "synonym3", "etc"])
      # All words are lowercase
      
      # EXAMPLES
      synonyms.store("dummy", ["test", "testing", "etcetera"])
      synonyms.store("intro", ["intro_handler", "introname_holder"])
      
      #PRONOUN PARSE
      synonyms.store("me", ["me", "moi"])
      synonyms.store("him", ["him", "he"])
      synonyms.store("her", ["her", "she"])
      synonyms.store("Sam", ["sam"])
      synonyms.store("god", ["god"])
      synonyms.store("us", ["us"])
      synonyms.store("now", ["now"])
      synonyms.store("it", ["it"])
      synonyms.store("all", ["all"])
      synonyms.store("you", ["you"])
      
      #CORE VERBS
      synonyms.store("shot", ["shoot", "erased", "sacked", "smote", "smite", "snipe", "sniped", "fire", "fired", "gunned", "blast",
      "blasted", "kill", "killed", "kills", "shoots", "erases", "smites", "murder", "murders",
      "murdered", "target", "downed", "downs", "nuked", "nukes", "wasted",
      "wastes", "buried", "buries"])
      
      synonyms.store("quit", ["quit", "left", "folds", "fold", "folded" "quits",
      "aborts", "abort", "retire", "ran", "runs", "went", "walked", "walks",
      "fled", "flee", "flees", "leaves", "gtfo", "ceased", "ceases"])
      
      synonyms.store("cried", ["cried", "sobs", "wept", "wailed", "teared",
      "sobbed", "bawled", "cries"])
      
      synonyms.store("laughs", ["laughs", "laughed"])
      
      synonyms.store("fapped", ["fapped", "faps", "jilled", "jills", "jacks",
      "jacked", "diddle", "cums", "cummed", "jizzed"])
      
      synonyms.store("kissed", ["kissed", "kisses", "pecked", "pecks", "smooched",
      "smooches", "smooch", "kiss", "snogs", "snogged", "pets", "petted", "licked",
      "licks", "rubs", "rubbed", "hug", "hugged", "embraces", "embraced", "cudles",
      "cuddled"])

      synonyms.store("said", ["said", "spoke", "opined", "told", "chid", 
      "hissed", "stated", "yelled", "swore", "talked", "talk", "moaned",
      "chats", "chatted", "chat", "yells", "yell", "talks", "moans","moaned", "states",
      "hisses", "chids", "tells", "says", "blabs", "blabbed", "gabs", "gabbed",
      "yakked", "yaks", "yaked", "yammers", "mumbled", "shouts", "shouted",
      "argued", "argues", "talks", "recited", "recites", "orates", "orated", "opined"])
      
      synonyms.store("died", ["died", "dead", "dies", "falls", "fall" , "fell", "dies",
      "die", "passed", "befell", "broke"])
      
      synonyms.store("won", ["won", "wins"])
      
      synonyms.store("sat", ["sat", "sits", "squats", "squated", "seats",
      "seated"])

      synonyms.store("sang", ["sang", "sings", "hums", "hummed", "cooed"])
      
      synonyms.store("flew", ["flew", "flies", "floats", "floated", "soars",
      "soared", "glided", "glides", "flapped", "flaps"])
      
      synonyms.store("wrote", ["wrote", "writes", "pens", "penned", "drafts",
      "prints", "printed", "inks", "inked", "typed", "types"])
      
      synonyms.store("stole", ["stole", "steals", "robbed", "robs", "lifted",
      "lifts", "conned", "cheats", "cheated", "took", "takes", "loots",
      "looted", "thieve", "thiefs", "copied", "copies"])
      
      synonyms.store("forgave", ["forgave", "forgives", "let go", "forgot",
      "grew", "healed", "learnt", "reset" ])
      
      synonyms.store("lost", ["lost", "loses", "lose", "fails", "fail", "failed"])
      synonyms.store("lied", ["lied", "lies", "fibs", "fibbed", "cons", "hoaxed",
      "misled"])
      synonyms.store("groin", ["groin", "balls", "nuts", "crotch", "penis", "dick",
      "nads", "nards", "testi", "testis", "gonad"])
      synonyms.store("boobs", ["boobs", "breast", "tits", "titty", "booby"])
      synonyms.store("ate", ["ate", "ate", "eats", "eated", "munch", "munches",
      "bites", "dines", "dined", "fed", "feeds", "nosh", "noshes", "noshed",
      "scarfed", "scarfs", "lunched", "lunches", "gorged", "gorges", "chews",
      "chewed", "grazes", "grazed", "crams", "crammed"])
      
      synonyms.store("rotted", ["rotted", "rots", "melted", "melts", "spoilt",
      "spoils", "stank", "cycled", "dried", "merged", "froze", "smelt"])

      
      synonyms.store("read", ["read", "reads"])
      synonyms.store("loved", ["loved", "loves", "love"])
      
      synonyms.store("drank", ["drank", "drinks", "gulps", "gulped", "sips",
      "sipped", "slurps", "slurped", "boozes", "boozed", "toasted", "toasts",
      "swilled", "swills", "thirsts", "thirsted"])
      
      synonyms.store("hates", ["hates", "hated", "hate", "scorn", "scorns",
      "loathe", "loathes", "loathed", "abhors", "abhor", "abhored", "spite",
      "spited", "spites", "seethe"])
      
      synonyms.store("swore", ["swore", "swears", "cursed", "curses", "insults",
      "insulted", "insult", "taunt", "taunts", "taunted", "slights", "slighted",
      "slight", "snubs", "snubbed", "libel", "libels"])
      
      synonyms.store("hit", ["hit", "hits", "beat", "beats", "abused", "abuses",
      "smacked", "smacks", "smack", "strikes", "struck", "striked", "punched",
      "punch", "punches", "boxed", "boxes", "slapped", "slaps", "slap", "knocks",
      "bonked", "bonks", "socked", "socks", "cuffed", "cuffs", "belted", "belts",
      "belt", "slogged", "slogs", "slog", "spanks", "spanked", "spank", "assail",
      "thrash", "punish", "whacks", "bopped", "bops", "whack", "thumps", "hurt",
      "hurts", "shook", "fought", "fights", "pushed", "shoved", "shove", "mashed"])
      
      synonyms.store("jumps", ["jumps", "jumped", "jump", "leapt", "leaps",
      "bounced", "hopped", "hops", "vaults", "vaulted", "dances", "danced"])
      
      synonyms.store("farts", ["farted", "farts", "fart", "shit", "shits",
      "toot", "toots", "tooted", "gassed", "gasses", "craps", "crapped",
      "crap", "mudded", "muds", "pooed", "pooped", "poos", "poo", "shat",
      "dumped"])
  
      synonyms.store("burps", ["burps", "burp", "burped", "belched", "belch",
      "belches"])

      synonyms.store("verb", ["verb", "verbs" ])
      
      synonyms.store("looked", ["looked", "looks", "beheld", "eyed", "views",
      "gazed", "gazes", "leered", "peeped", "saw", "sees", "stares","stared",
      "viewed"])
      
      synonyms.store("knit", ["knit", "knits", "knited", "sewed", "wove"])
      synonyms.store("smiled", ["smiled", "smiles", "grinned", "grins" ])
      synonyms.store("owed", ["owed", "owes", "spent", "spends", "paid", "pays",
      "resold", "sells", "sold", "rented", "rents", "rent", "taxed", "taxes", "bet",
      "cashed", "cost", "costs", "costed", "earned", "owned", "bought"])
      synonyms.store("felt", ["felt", "feels", "envied", "envies", "dwelt",
      "minded", "minds", "wanted", "wished", "tried", "upset", "hoped", "ached"])
      synonyms.store("obeyed", ["obeyed", "obeys", "acted", "acts" ])
      synonyms.store("mewed", ["mewed", "meows", "mews", "meowed" ])
      synonyms.store("mooed", ["mooed", "moos" ])
      
      synonyms.store("sweat", ["sweat", "sweats", "boiled", "pouted", "sagged"])
      
      synonyms.store("baked", ["baked", "bakes", "cooked", "cooks", "chefed",
      "grilled", "grills"])

      
     synonyms.store("stood", ["stood", "stands", "stays", "stayed", "waits",
     "waited", "holds", "held", "hangs", "hung", "stalls", "stalled", "paused",
     "seized"])
      
      synonyms.store("cut", ["cut", "cuts", "stabs", "stabbed", "bled", "bleeds",
      "carves", "carved", "carve", "shaves", "shaved", "slashed", "slash", "slashes", "sliced", "slices", "slice", "dices", "diced",
      "gashed", "gashes", "gash", "hacked", "hacks", "hack", "hewn", "minced",
      "minces", "mince",  "nicked", "nicks", "nick", "pierced", "pierces",
      "pierce", "rends", "rend", "sawed", "saws", "scarred", "scars", "scar",
      "shears", "sheared", "slit", "slits", "slivers", "slivered", "snips",
      "snipped", "snip", "stung", "stings", "nipped", "marked", "sawed"])
      
      synonyms.store("slept", ["slept", "sleep", "naps", "napped", "nap",
      "rest", "rests", "rested", "dreams", "dreamt", "dreamed", "dozed",
      "dozes", "doze", "relaxed", "relaxes", "relax", "snored", "snores",
      "laid", "lay"])
      
      synonyms.store("strips", ["strips", "strip", "stripped", "nudes",
      "naked", "nude", "undress", "sheds", "shed","disrobe", "teased",
      "teases"])
      
      synonyms.store("peed", ["peed", "pees", "pee", "tinkle", "wizz",
      "pisses", "pissed", "piss", "peepee", "leak", "leaked", "leaks",
      "urined", "urine", "urines", "wet", "wets", "wetted", "damped"])
      
      synonyms.store("plays", ["plays", "play", "played", "woke", "awoke"])
      
      synonyms.store("lived", ["lived", "lives", "exists", "existed", "remain",
      "endure", "abides", "abided", "dwells", "dwelt", "remains", "lasts",
      "lasted", "survives", "survive", "began"])
      
      synonyms.store("joked", ["joked", "joke", "jokes", "japed", "japes",
      "jape", "quips", "quipped", "quip", "chaffs", "joshes", "joshed",
      "spoofed", "spoofs", "gags", "gagged", "goofs", "goofed", "goof",
      "jest", "jested", "jests", "kidded", "sassed"])
      
       synonyms.store("fuck", ["fuck"])
       
       synonyms.store("puked", ["puked", "puked", "spews", "spewed", "vomits",
       "vomited", "vomit", "puke", "gagged", "hurled"])
       
       synonyms.store("barked", ["barked", "barks", "woofed", "woofs"])
       
       synonyms.store("burned", ["burned", "burns", "alit", "burnt", "charred",
       "fired", "fires", "chars", "lit", "lights", "fried"])
       
       synonyms.store("chose", ["chose", "chooses", "opted", "decide"])
       
       synonyms.store("smoked", ["smoked", "smokes", "toked", "tokes",
       "puffs", "puffed", "inhale"])
       
        synonyms.store("called", ["called", "phoned", "rang", "dialed",
        "calls", "phones", "rings", "dials"])

       
       synonyms.store("saved", ["saved", "saves", "rescue", "rescued", "rescues",
       "protect", "protects", "helped", "freed"])
      
       synonyms.store("raped", ["raped", "rapes", "rape", "fucks", "fucked",
       "sexed", "sexes", "screwed", "humped", "humps", "hump", "bangs", "banged",
       "mates", "mated", "boinks", "shagged", "shags", "shag", "lays", "layed",
       "screws", "coitus", "forced", "forces"])
       
          
      synonyms.store("moved", ["moved", "move", "clad", "hike", "hiked", "crept",
      "drove", "leapt", "rolled", "rushed", "sailed", "sprang", "strode", "trod",
      "surged", "zoomed", "came", "went", "made", "dived", "dove", "oozed", "sank",
      "raced", "split", "chased", "chase", "dashed", "dashes", "dipped", "swung",
      "limped", "zipped", "slid", "passed", "pass", "set", "swam", "slunk", "bent",
      "sped", "thrust", "drove", "led", "strode", "strove", "surged", "swam", "shrank",
      "skied", "slid", "parted", "bound", "rode", "rolled"])
      
      return synonyms
    end
    
    def self.check_word(actor_id)
      # This is the function you will use in conditional branches.
      # Simply set up a conditional branch after a name input
      # And use the following sort of script commands (page 4 of conditionals)
      # ASM::Parser::check_word(actor_id) == "word-to-test"
      # e.g.
      # ASM::Parser::check_word(33) == "intro"
      # It'll then automatically run through the above synonyms and check
      word = self.get_word(actor_id)
      output = nil
      if word != nil
        self.get_word_lists.each do |key, value|
          if key == word
            output = key
          else
            value.each do |synonym|
              if synonym == word
                output = key
              end
            end
          end
        end
      end
      
      return output
    end
  end
end