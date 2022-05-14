XIncludeFile "../modules/log.pbi"
XIncludeFile "../modules/math/vector.pbi"

UseModule Log
UseModule Vector2
UseModule Vector3

OpenConsole("Vector Maths Example")
EnableGraphicalConsole(#True)

LogToConsole(#True)
SetLogFormat("%msg")

Define.sVec2d vec2d1, vec2d2, result2
Define.sVec3d vec3d1, vec3d2, result3

InitVec2d(@vec2d1, Random(100), Random(100))
InitVec2d(@vec2d2, Random(100), Random(100))

InitVec3d(@vec3d1, Random(100), Random(100), Random(100))
InitVec3d(@vec3d2, Random(100), Random(100), Random(100))

; 2D Vectors
Info("Vector2 Example")
Info("---------------")
Info("Vector 1: " + Vec2d_ToString(@vec2d1))
Info("Vector 2: " + Vec2d_ToString(@vec2d2))
Info("Distance: " + StrD(Vec2d_Distance(@vec2d1, @vec2d2), 2))
Info("Dot Product: " + StrD(Vec2d_DotProduct(@vec2d1, @vec2d2), 2))

Vec2d_Normalise(@vec2d1, @result2)
Info("Vector 1 Normalised: " + Vec2d_ToString(@result2))

Vec2d_Normalise(@vec2d2, @result2)
Info("Vector 2 Normalised: " + Vec2d_ToString(@result2))

Info("")

; 3D Vectors
Info("Vector3 Example")
Info("---------------")

Info("Vector 1: " + Vec3d_ToString(@vec3d1))
Info("Vector 2: " + Vec3d_ToString(@vec3d2))
Info("Distance: " + StrD(Vec2d_Distance(@vec3d1, @vec3d2), 2))
Info("Dot Product: " + StrD(Vec2d_DotProduct(@vec3d1, @vec3d2), 2))

Vec3d_Normalise(@vec3d1, @result3)
Info("Vector 1 Normalised: " + Vec3d_ToString(@result3))

Vec3d_Normalise(@vec3d2, @result3)
Info("Vector 2 Normalised: " + Vec3d_ToString(@result3))

Info("")

; Finish Example
Success("Example finished. Hit return to quit.")
Input()
CloseConsole()
End 0
; IDE Options = PureBasic 6.00 Beta 7 (Linux - x64)
; CursorPosition = 31
; EnableXP