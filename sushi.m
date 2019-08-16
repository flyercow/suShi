function [ sudoku ] = sushi(sudoku)

    finished_sudoku_flag = 0;   

    while (finished_sudoku_flag == 0)

        for i = 1:9

            for j = 1:9

                if sudoku(i,j) == 0  

                    candidatos_fila       = candidatos_por_fila(i,sudoku);
                    candidatos_columna    = candidatos_por_columna(j, sudoku);
                    candidatos_cuadricula = candidatos_por_cuadricula(i,j,sudoku);

                    candidatos_globales = [0 0 0 0 0 0 0 0 0];

                    for index = 1:9

                        if candidatos_fila(index) == 1 && candidatos_columna(index) == 1 && candidatos_cuadricula(index) == 1

                            candidatos_globales(index) = 1;

                        end

                    end

                    if sum(candidatos_globales) == 1

                        for index = 1:9

                            if candidatos_globales(index) == 1

                                sudoku(i,j) = index; 

                            end

                        end

                    end

                end

                disp(sudoku);  

            end

            finished_sudoku_flag = 1;   

            for carajote=1:9

                for carajotaso=1:9

                    if sudoku(carajote, carajotaso) == 0

                        finished_sudoku_flag = false;

                    end

                end

            end

        end
        
    end
    
end