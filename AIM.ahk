color = 0x343C67

ColVn := 0
ZeroX := 640
ZeroY := 512
CFovX := 55
CFovY := 95
ScanL := ZeroX - CFovX
ScanT := ZeroY - CFovY
ScanR := ZeroX + CFovX
ScanB := ZeroY + CFovY
sens:=2.5
modifier:=2.52/sens

c::
loop 10{
 MouseGetPos, PosX, PosY
 ScanL := Ceil(PosX - CFovX)
 ScanT := Ceil(PosY - CFovY)
 ScanR := Ceil(PosX + CFovX)
 ScanB := Ceil(PosY + CFovY)
 PixelSearch, AimPixelX, AimPixelY, ScanL, ScanT, ScanR, ScanB, color, ColVn, Fast

 if !ErrorLevel
 
 AimX := (AimPixelX - Ceil(PosX))*modifier
 AimY := (AimPixelY - Ceil(PosY))*modifier
 
 
 DllCall("mouse_event", "UInt", 0x01, "UInt", AimX, "UInt", 0)
 Click
 }

return 

g::
 MouseGetPos, X, Y
 PixelGetColor, ColorId, %X%, %Y%
 color = %ColorId%
return

^e::
 ExitApp
return


;Rotina_teste:
