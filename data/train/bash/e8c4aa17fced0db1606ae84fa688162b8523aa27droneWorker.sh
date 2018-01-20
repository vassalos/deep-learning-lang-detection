#!/bin/bash
cd /home/chuck/Temp/USW-02/

make cleanEverything everything

echo Finished compiling the software.

make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=1 DISSERTATION_C="1 2" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &
make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=2 DISSERTATION_C="1 2" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &
make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=3 DISSERTATION_C="1 2" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &
make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=1 DISSERTATION_C="3 4" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &
make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=2 DISSERTATION_C="3 4" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &
make DISSERTATION_A="1 2 3 4 5" DISSERTATION_B=3 DISSERTATION_C="3 4" DISSERTATION_SAMPLE="1 2 3 4 5 6 7 8 9 10" dissertation &

echo Finished executing the make commands.
