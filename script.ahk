;version 0.11
#SingleInstance force 
#Persistent


global title := "Clicker Heroes"
global running := false
global getCandy := true

;toggle Candy on/off
F8::
	getCandy := !getCandy
	return

;start the script
F9::
	running := true
	Run()
	return

;stop the loop from running
F10::
	running := false
	return

;exit the script
F11::
	ExitApp
	return
	
Run() {
	SetMouseDelay 0
	SetControlDelay -1
	timer := 0
	getCandy := true
	
	GetWindowAttributes()
	useSkillsOnce()
	while(running) {
		;check for Clickstorm/Powersurge
		if (mod(timer, 185) == 0) {
			ControlSend,, 1, %title%
			ControlSend,, 2, %title%
		}
		
		;check for Lucky Strikes/Metal Detector
		if (mod(timer, 785) == 0) {
			ControlSend,, 3, %title%
			ControlSend,, 4, %title%
		}
		
		;check for Golden Clicks/SuperClicks
		if (mod(timer, 1535) == 0) {
			ControlSend,, 5, %title%
			ControlSend,, 7, %title%
		}
	
		
		if (timer >= 3050) {
			ControlSend,, 8, %title%
			ControlSend,, 6, %title%
			ControlSend,, 9, %title%
			timer := 0
		}
		
		if (getCandy) {
			getCandies()
		}
		
		levelHero()
		killThemMonsters()

		timer++
	}
	
	return
}

GetWindowAttributes() {
	SetTitleMatchMode 3 ; window title contains the string supplied
    WinActivate %title%
    return
}

useSkillsOnce() {
	ControlSend,, 8, %title%
	ControlSend,, 6, %title%
	ControlSend,, 9, %title%
	ControlSend,, 1, %title%
	ControlSend,, 2, %title%
	ControlSend,, 3, %title%
	ControlSend,, 4, %title%
	ControlSend,, 5, %title%
	ControlSend,, 7, %title%
}

getCandies() {
	ControlClick, % "x" 527 " y" 486, %title%,,,, NA
    ControlClick, % "x" 751 " y" 432, %title%,,,, NA
    ControlClick, % "x" 758 " y" 380, %title%,,,, NA
    ControlClick, % "x" 871 " y" 510, %title%,,,, NA
    ControlClick, % "x" 1004 " y" 453, %title%,,,, NA
    ControlClick, % "x" 1057 " y" 444, %title%,,,, NA
    return
}

killThemMonsters()
{
    clickNumber := 10
    clickDelay := floor( 600 / 10 )
 
    Loop, %clickNumber%
    {
        x_coord := 800 + ( 20 * A_Index )
        ControlClick, % "x" x_coord " y" 160, %title%,,,, NA
        Sleep clickDelay
    }
 
    return
}

levelHero() {
	ControlClick, % "x" 60 " y" 570, %title%,,,, NA
	return
}