Status bar ported A3 to A2.

INSTRUCTIONS:

1. download mod folder.
2. place the download folder in your addons folder.
3. place this line: 
        
       [] execVM "addons\status_bar\PlayerBar.sqf";
        
    below after !isDedicated in the init.sqf.
    
  4. open your description.ext and place this line:
  
         #include "addons\Status_Bar\statusBar.hpp"
  
   below after class RscTitles {.
   
   Done.
   
   all the credits go to Darth_Rogue, I only modified it for epoch arma 2.
