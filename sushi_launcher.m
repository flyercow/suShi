% Launcher

clear
clc
close all 
 
sudoku = [ 7 0 0 4 9 0 0 6 1; %NISHIO
           0 6 9 8 0 0 0 0 0;
           0 4 1 5 6 0 0 2 0;
           0 1 0 0 2 0 7 0 6;
           0 7 3 0 4 0 1 0 0;
           9 0 0 0 7 0 0 4 0;
           0 3 0 0 8 9 0 1 0;
           0 9 0 0 0 4 5 7 0;
           1 2 0 0 5 0 0 0 8];
       
[report, sudoku] = sushi(sudoku)