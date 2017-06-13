sclProCrea
==============

## English


Is a batch file to create the directory structure for Scala Sbt Projects based on different line command parameters.

#### Usage: 

    sclProCrea [options]

#### Options:

   * `-e  FLAG`   Use of English as message language   : 1 = yes / 0 = no  (Default: 1)
   
               (NOTE: Should be the first option if used - 0 means use of Spanish)
	       
   * ` -m  FLAG`   Create directory [src\main\scala]    : 1 = yes / 0 = no  (Default: 1)
   * ` -mr FLAG`   Create directory [src\main\resources]: 1 = yes / 0 = no  (Default: 0)
   * ` -mj FLAG`   Create directory [src\main\java]     : 1 = yes / 0 = no  (Default: 0)
   * ` -t  FLAG`   Create directory [src\test\scala]    : 1 = yes / 0 = no  (Default: 0)
   * ` -tr FLAG`   Create directory [src\test\resources]: 1 = yes / 0 = no  (Default: 0)
   * ` -tj FLAG`   Create directory [src\test\java]     : 1 = yes / 0 = no  (Default: 0)
   * ` -b  FLAG`   Create file      [build.sbt]         : 1 = yes / 0 = no  (Default: 1)
   
               Content:

                                  name:="nombrePoyecto"
                                  version:="1.0"
                                  scalaVersion:="2.11.10"

   * ` -h`         Show this help message. Make no changes to directory structure

#### Example:

        sclProCrea -b 0 -t 1 -tr 1

    Create the following directories:
        src\main\scala
        src\test\scala
        src\test\resources

    Avoid creating:
        build.sbt
		
