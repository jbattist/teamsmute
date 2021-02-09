Pause::

prev := WinExist("A")                           ;retrieve the ID of the active window

WinGet, id, list, ahk_exe Teams.exe             ;get all teams windows IDs
Loop, %id% 							            
{
    this_ID := id%A_Index%
    WinGetTitle, Title, ahk_id %this_ID%		;get the window title
    If Title <> Microsoft Teams Notification	;disregard the notification window
    {
        If Title <> 							;disregard null titles
        {
            WinActivate, ahk_id %this_ID%		;activate the window
            Send, ^M							;send ctrl,shift,m to the window
            break								;break the loop in case there's 2 Teams windows due to pop out meeting
        }
    }
}

;WinActivate, ahk_id %prev%                      ;reactivate the previous window (Comment out this line if you don't want to switch back to previous window)