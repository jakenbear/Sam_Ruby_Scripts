#==============================================================================
# ** Main
#------------------------------------------------------------------------------
#  This processing is executed after module and class definition is finished.
#==============================================================================

rgss_main { SceneManager.run }

#begin
#rgss_main { SceneManager.run }
#ensure
#SteamAPI_Shutdown.call
#end
