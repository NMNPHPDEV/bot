; Start a specific program
Run("C:\Program Files (x86)\WinAuth\WinAuth.exe")
; Wait for the program to start (you can wait for it to load during this time)
WinWaitActive("WinAuth")
; Write "test" in the input field in the program
Send("examplepass")
; Click the OK button
ControlClick("WinAuth", "", "[CLASS:WindowsForms10.BUTTON.app.0.2a125d8_r8_ad1; INSTANCE:2]")
; Wait time after the operation is complete
Sleep(500)
WinWaitActive("WinAuth")
Local $winPos = WinGetPos("WinAuth")
Local $centerX = $winPos[0] + $winPos[2] / 2
Local $centerY = $winPos[1] + $winPos[3] / 2
MouseClick("right", $centerX, $centerY, 1, 0)
; Wait time (wait for the context menu to appear)
Sleep(200)
; Get the coordinates of the context menu
Local $contextMenuX = $centerX + 190 ; Set the X coordinate of the context menu, for example
Local $contextMenuY = $centerY + 22 ; Set the Y coordinate of the context menu, for example
; Click the 3rd item in the context menu
MouseClick("left", $contextMenuX, $contextMenuY + 50, 1, 0)
; Close the WinAuth window
WinClose("WinAuth")

; Open the VPN program
Run("C:\Program Files (x86)\Pritunl\Pritunl.exe")

; Get the text from the Windows Clipboard
Local $copiedText = ClipGet()

; Wait for the window to start (you can wait for it to load during this time)
WinWaitActive("Pritunl Client")
Sleep(200)
Local $winPos = WinGetPos("Pritunl Client")
Local $trgetX = $winPos[0] + 70
Local $trgetY = $winPos[1] + 201
MouseClick("left", $trgetX, $trgetY, 1, 0)
Sleep(3500)

Local $targetX = $winPos[0] + 118
Local $targetY = $winPos[1] + 254
MouseClick("left", $targetX, $targetY, 1, 0)
Sleep(300)
Send("examplepass")

Local $targX = $winPos[0] + 123
Local $targY = $winPos[1] + 320
MouseClick("left", $targX, $targY, 1, 0)
Sleep(200)
Send($copiedText)

Local $targX = $winPos[0] + 323
Local $targY = $winPos[1] + 388
MouseClick("left", $targX, $targY, 1, 0)

Sleep(4000)
WinClose("Pritunl Client")
