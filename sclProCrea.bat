@ECHO OFF

SET /A main=1
SET /A test=0
SET /A build=1

SET /A mainRes=0
SET /A mainJava=0
SET /A testRes=0
SET /A testJava=0

SET /A english=1
SET /A ayuda=0

:cicloParam

	if "%1%"=="" GOTO finCicloParam
	:: ---------------------------------------------------
	if NOT "%1%"=="-m" (
		if NOT "%1%"=="-t" (
			if NOT "%1%"=="-b" (
				if NOT "%1%"=="-mr" (
					if NOT "%1%"=="-mj" (
						if NOT "%1%"=="-tr" (
							if NOT "%1%"=="-tj" (
								if NOT "%1%"=="-e" (
									if NOT "%1%"=="-h" (
										REM Option don't exist
										CALL :despliegaError noOpt %1 
										GOTO finCicloParam
									)
								)
							)
						)
					)
				)
			)
		)
    ) 
	:: ---------------------------------------------------
	IF %1% == -h (
		SET /A ayuda=1
	) else (
	    CALL :obtenParamVal %1 %2
		SHIFT
	)

	SHIFT
	GOTO cicloParam

:finCicloParam

    IF NOT %ayuda%==1 (
		IF %main%==1     (md src\main\scala)
		IF %mainRes%==1  (md src\main\resources)
		IF %mainJava%==1 (md src\main\java)
		IF %test%==1     (md src\test\scala)
		IF %testRes%==1  (md src\test\resources)
		IF %testJava%==1 (md src\test\java)
		IF %build%==1 (
			ECHO name:="nombrePoyecto" > build.sbt
			ECHO version:="1.0" >> build.sbt
			ECHO scalaVersion:="2.11.10" >> build.sbt
		)
	) ELSE (
		CALL :despliegaAyuda
	)
	
	EXIT /B 0
	
:obtenParamVal

    IF NOT "%~2"=="0" (
		IF NOT "%~2"=="1" (
			CALL :despliegaError %~1
			EXIT /B 0
		)
	) 
	
	IF %~1 == -m  ( SET /A main=%~2     )
	IF %~1 == -t  ( SET /A test=%~2     )
	IF %~1 == -b  ( SET /A build=%~2    )
	IF %~1 == -mr ( SET /A mainRes=%~2  )
	IF %~1 == -mj ( SET /A mainJava=%~2 )
	IF %~1 == -tr ( SET /A testRes=%~2  )
	IF %~1 == -tj ( SET /A testJava=%~2 )
	IF %~1 == -e  ( SET /A english=%~2  )
	
	
EXIT /B 0

:despliegaError
    CALL :asignaCeroVars
	IF "%~1" == "noOpt" ( 
		IF %english%==1 (
		    ECHO ERROR: [%~2] Non-existent option
		) ELSE (
		    ECHO ERROR: [%~2] Opción inexistente
		)
	) ELSE ( 
	    IF %english%==1 (
		    ECHO ERROR: Value of  [%~1]  must be 1 or 0
		) ELSE (
		    ECHO ERROR: El valor de [%~1] debe ser 1 o 0
		)
	) 
EXIT /B 0	

:asignaCeroVars
	SET /A main=0
	SET /A test=0
	SET /A build=0
	
	SET /A mainRes=0
	SET /A mainJava=0
	SET /A testRes=0
	SET /A testJava=0
	
	SET /A help=0
	
EXIT /B 0

:despliegaAyuda

	IF %english%==1 (
	    CALL :despliegaAyudaEng
	) ELSE (
	    CALL :despliegaAyudaEsp
	)
EXIT /B 0

:despliegaAyudaEng
	ECHO USAGE: sclProCrea [options]
	ECHO. 
	ECHO Options:
	ECHO     -e  FLAG   Use of English as message language   : 1 = yes / 0 = no  (Default: 1) 
	ECHO                (NOTE: Should be the first option if used - 0 means use of Spanish)
	ECHO     -m  FLAG   Create directory [src\main\scala]    : 1 = yes / 0 = no  (Default: 1)
	ECHO     -mr FLAG   Create directory [src\main\resources]: 1 = yes / 0 = no  (Default: 0)
	ECHO     -mj FLAG   Create directory [src\main\java]     : 1 = yes / 0 = no  (Default: 0)
	ECHO     -t  FLAG   Create directory [src\test\scala]    : 1 = yes / 0 = no  (Default: 0)
	ECHO     -tr FLAG   Create directory [src\test\resources]: 1 = yes / 0 = no  (Default: 0)
	ECHO     -tj FLAG   Create directory [src\test\java]     : 1 = yes / 0 = no  (Default: 0)
	ECHO     -b  FLAG   Create file      [build.sbt]         : 1 = yes / 0 = no  (Default: 1)
	ECHO                Content:
	ECHO. 
	ECHO                                   name:="nombrePoyecto"
	ECHO                                   version:="1.0"
	ECHO                                   scalaVersion:="2.11.10"
	ECHO. 
	ECHO     -h         Show this help message. Make no changes to directory structure
	ECHO.
	ECHO Example:
	ECHO. 
	ECHO         sclProCrea -b 0 -t 1 -tr 1 
	ECHO. 
	ECHO     Create the following directories:
	ECHO         src\main\scala
	ECHO         src\test\scala
	ECHO         src\test\resources
	ECHO. 
	ECHO     Avoid creating:
	ECHO         build.sbt
	
EXIT /B 0

:despliegaAyudaEsp
	ECHO USO: sclProCrea [opciones]
	ECHO. 
	ECHO Opciones:
	ECHO     -e  BANDERA   Use del Inglés como lenguaje        : 1 = si / 0 = no  (Default: 1) 
	ECHO                   (NOTA: Debería ser la primera opción si se usa - 0 para uso del Español)
	ECHO     -m  BANDERA   Crea directorio [src\main\scala]    : 1 = si / 0 = no  (Default: 1)
	ECHO     -mr BANDERA   Crea directorio [src\main\resources]: 1 = si / 0 = no  (Default: 0)
	ECHO     -mj BANDERA   Crea directorio [src\main\java]     : 1 = si / 0 = no  (Default: 0)
	ECHO     -t  BANDERA   Crea directorio [src\test\scala]    : 1 = si / 0 = no  (Default: 0)
	ECHO     -tr BANDERA   Crea directorio [src\test\resources]: 1 = si / 0 = no  (Default: 0)
	ECHO     -tj BANDERA   Crea directorio [src\test\java]     : 1 = si / 0 = no  (Default: 0)
	ECHO     -b  BANDERA   Crea archivo    [build.sbt]         : 1 = si / 0 = no  (Default: 1)
	ECHO                   Contenido:
	ECHO. 
	ECHO                                   name:="nombrePoyecto"
	ECHO                                   version:="1.0"
	ECHO                                   scalaVersion:="2.11.10"
	ECHO. 
	ECHO     -h            Muestra esta ayuda. No realiza cambios en la estructura del directorio
	ECHO.
	ECHO Ejemplo:
	ECHO. 
	ECHO         sclProCrea -b 0 -t 1 -tr 1 
	ECHO. 
	ECHO     Crea los siguientes directorios:
	ECHO         src\main\scala
	ECHO         src\test\scala
	ECHO         src\test\resources
	ECHO. 
	ECHO     Evita crear:
	ECHO         build.sbt
	
EXIT /B 0

:detectaIdioma
EXIT /B 0
