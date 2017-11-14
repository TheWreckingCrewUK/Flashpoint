@ECHO OFF

echo Making hard junction links to Domination core within mission folders...

for /d %%i in (*) do (
	IF /I "%%i" == "Flashpoint_Core" (
		echo Skipping Flashpoint_Core...
	) else (
		IF /I "%%i" == "tools" (
			echo Skipping Tools...
		) else (
			echo Adding Flashpoint_Core to %%i
			mklink /j ".\%%i\Flashpoint_Core" ".\Flashpoint_Core\"
		)
	)
)

PAUSE