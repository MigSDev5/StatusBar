waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

	3 cutRsc["statusBar","PLAIN"];
	[] spawn 
	{

		sleep 5;
		//sleep 1;
		//set the color values.
		//Additional color codes can be found here:  http://html-color-codes.com/
		_colourDefault  = parseText "#ADADAD"; //set your default colour here
		_colour100 		= parseText "#336600";
		_colour90 		= parseText "#339900";
		_colour80 		= parseText "#33CC00";
		_colour70 		= parseText "#33FF00";
		_colour60 		= parseText "#66FF00";
		_colour50 		= parseText "#CCFF00";
		_colour40 		= parseText "#CCCC00";
		_colour30 		= parseText "#CC9900";
		_colour20 		= parseText "#CC6600";
		_colour10 		= parseText "#CC3300";
		_colour0 		= parseText "#CC0000";
		_colourDead 	= parseText "#000000";
			
	
	while {true} do 
	{
		sleep 1;
				
		//moved the creation of the status bar inside the loop and create it if it is null,
		//this is to handle instance where the status bar is disappearing 
		
		if(isNull ((uiNamespace getVariable "statusBar")displayCtrl 55555)) then
		{
			diag_log "statusbar is null create";
			disableSerialization;
			3 cutRsc["statusBar","PLAIN"];
		};		
		
		//initialize variables and set values
		_unit = _this select 0;
		_damage = round((r_player_blood / r_player_bloodTotal) * 100);
		_hunger = round(100 - (dayz_hunger / SleepFood) * 100);
		_thirst = round(100 - (dayz_thirst / SleepWater) * 100);
		_wallet = [player getVariable[Z_moneyVariable,0]] call BIS_fnc_numberText;
		_bank	= [player getVariable[Z_BankVariable,0]] call BIS_fnc_numberText;
		_energy = nil;
		_energyPercent = nil;
		_fps = format["%1",round diag_fps];
		_grid = mapGridPosition  player; 
		_time = (round(240-(serverTime)/60));
		_hours = (floor(_time/60));
		_minutes = (_time - (_hours * 60));
		_players = count playableUnits;
		
		
		switch(_minutes) do	{
			case 9: {_minutes = "09"};
			case 8: {_minutes = "08"};
			case 7: {_minutes = "07"};
			case 6: {_minutes = "06"};
			case 5: {_minutes = "05"};
			case 4: {_minutes = "04"};
			case 3: {_minutes = "03"};
			case 2: {_minutes = "02"};
			case 1: {_minutes = "01"};
			case 0: {_minutes = "00"};
		};
						
		
		//Colour coding
		//Damage
		_colourDamage = _colourDefault;
		
		switch true do {
			case(_damage >= 100) : {_colourDamage = _colour100;};
			case((_damage >= 90) && (_damage < 100)) : {_colourDamage =  _colour90;};
			case((_damage >= 80) && (_damage < 90)) : {_colourDamage =  _colour80;};
			case((_damage >= 70) && (_damage < 80)) : {_colourDamage =  _colour70;};
			case((_damage >= 60) && (_damage < 70)) : {_colourDamage =  _colour60;};
			case((_damage >= 50) && (_damage < 60)) : {_colourDamage =  _colour50;};
			case((_damage >= 40) && (_damage < 50)) : {_colourDamage =  _colour40;};
			case((_damage >= 30) && (_damage < 40)) : {_colourDamage =  _colour30;};
			case((_damage >= 20) && (_damage < 30)) : {_colourDamage =  _colour20;};
			case((_damage >= 10) && (_damage < 20)) : {_colourDamage =  _colour10;};
			case((_damage >= 1) && (_damage < 10)) : {_colourDamage =  _colour0;};
			case(_damage < 1) : {_colourDamage =  _colourDead;};
		};
		
		//Hunger
		_colourHunger = _colourDefault;
		switch true do {
			case(_hunger >= 100) : {_colourHunger = _colour100;};
			case((_hunger >= 90) && (_hunger < 100)) :  {_colourHunger =  _colour90;};
			case((_hunger >= 80) && (_hunger < 90)) :  {_colourHunger =  _colour80;};
			case((_hunger >= 70) && (_hunger < 80)) :  {_colourHunger =  _colour70;};
			case((_hunger >= 60) && (_hunger < 70)) :  {_colourHunger =  _colour60;};
			case((_hunger >= 50) && (_hunger < 60)) :  {_colourHunger =  _colour50;};
			case((_hunger >= 40) && (_hunger < 50)) :  {_colourHunger =  _colour40;};
			case((_hunger >= 30) && (_hunger < 40)) :  {_colourHunger =  _colour30;};
			case((_hunger >= 20) && (_hunger < 30)) :  {_colourHunger =  _colour20;};
			case((_hunger >= 10) && (_hunger < 20)) :  {_colourHunger =  _colour10;};
			case((_hunger >= 1) && (_hunger < 10)) :  {_colourHunger =  _colour0;};
			case(_hunger < 1) : {_colourHunger =  _colourDead;};
		};
		
		//Thirst
		_colourThirst = _colourDefault;		
		switch true do{
		
			case(_thirst >= 100) : {_colourThirst = _colour100;};
			case((_thirst >= 90) && (_thirst < 100)) :  {_colourThirst =  _colour90;};
			case((_thirst >= 80) && (_thirst < 90)) :  {_colourThirst =  _colour80;};
			case((_thirst >= 70) && (_thirst < 80)) :  {_colourThirst =  _colour70;};
			case((_thirst >= 60) && (_thirst < 70)) :  {_colourThirst =  _colour60;};
			case((_thirst >= 50) && (_thirst < 60)) :  {_colourThirst =  _colour50;};
			case((_thirst >= 40) && (_thirst < 50)) :  {_colourThirst =  _colour40;};
			case((_thirst >= 30) && (_thirst < 40)) :  {_colourThirst =  _colour30;};
			case((_thirst >= 20) && (_thirst < 30)) :  {_colourThirst =  _colour20;};
			case((_thirst >= 10) && (_thirst < 20)) :  {_colourThirst =  _colour10;};
			case((_thirst >= 1) && (_thirst < 10)) :  {_colourThirst =  _colour0;};
			case(_thirst < 1) : {_colourThirst =  _colourDead;};
		};
		
		
		//display the information 
		((uiNamespace getVariable "statusBar")displayCtrl 55555)ctrlSetStructuredText parseText 
			format["
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\players.paa' color='%10'/> %2</t>
			<t shadow='1' shadowColor='#000000' color='%11'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\damage.paa' color='%11'/> %3%1</t> 
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\krypto.paa' color='%10'/> %4</t> 
			<t shadow='1' shadowColor='#000000' color='%12'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\hunger.paa' color='%12'/> %5%1</t> 
			<t shadow='1' shadowColor='#000000' color='%13'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\thirst.paa' color='%13'/> %6%1</t> 
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\bank.paa' color='%10'/>%9</t>
			<t shadow='1' shadowColor='#000000' color='%10'>FPS: %7</t>
			<t shadow='1' shadowColor='#000000' color='%10'>GRID: %16</t>
			<t shadow='1' shadowColor='#000000' color='%10'><img size='1.6'  shadowColor='#000000' image='addons\status_bar\images\restart.paa' color='%10'/>%17:%18</t>",
					"%", 
					_players,
					_damage,
					_wallet, 
					_hunger, 
					_thirst, 
					_fps, 
					_energyPercent, 
					_bank,
					_colourDefault,
					_colourDamage,
					_colourHunger,
					_colourThirst,
					_colourEnergy,
					_colourStamina,
					_grid,
					_hours,
					_minutes,
					_colourToxicity,
					_toxPercent
					
				];	
			
	}; 
};