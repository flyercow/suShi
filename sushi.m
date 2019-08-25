function [report, sudoku] = sushi(sudoku)

    [report, sudoku] = straight_sudoku_solver(sudoku);
    
    if (report == 0)
        
        i = 1;
        j = 1;
        
        while i <= 9 && report == 0
            
            while ((j <= 9) && (report == 0))
                
                if sudoku(i,j) == 0

                    candidatos_fila       = candidatos_por_fila(i,sudoku);
                    candidatos_columna    = candidatos_por_columna(j, sudoku);
                    candidatos_cuadricula = candidatos_por_cuadricula(i,j,sudoku);

                    candidatos_globales = [0 0 0 0 0 0 0 0 0];

                    for index = 1:9

                        if candidatos_fila(index)       == 1 &&...
                           candidatos_columna(index)    == 1 &&...
                           candidatos_cuadricula(index) == 1

                            candidatos_globales(index) = 1;

                        end

                    end
                    
                    if sum(candidatos_globales) == 2 
                                             
                        for index = 1:9
                            
                            if candidatos_globales(index) == 1
                                
                                sudoku_modified         = sudoku;
                                sudoku_modified(i,j)    = index; 
                                
                            end
                            
                        end
                            
                        [report, sudoku_output] = sushi(sudoku_modified);
                                                
                        if report == 1 
                                
                            sudoku = sudoku_output; 

                        else 
                                
                            aux = 0;
                            
                            for index = 1:9
                            
                                if candidatos_globales(index) == 1 && aux == 0
                                    
                                    aux = 1;
                                    
                                elseif candidatos_globales(index) == 1 && aux == 1
                                        
                                    sudoku_modified         = sudoku;
                                    sudoku_modified(i,j)    = index; 
                                    
                                end
                                
                            end
                            
                            [report, sudoku_output] = sushi(sudoku_modified);
                                                        
                            if report == 1
                                
                                sudoku = sudoku_output;        
                                                                     
                            end
                            
                        end
                        
                    end
                    
                end
                
                j = j + 1;    
            
            end
            
            i = i + 1;
        
        end
        
    end
            
end
       
function [report, sudoku] = straight_sudoku_solver(sudoku)

    finished_sudoku_flag = 0;

    while (finished_sudoku_flag == 0) 
        
        can_be_solved = 0;

            for i = 1:9

                for j = 1:9

                    if sudoku(i,j) == 0

                        candidatos_fila       = candidatos_por_fila(i,sudoku);
                        candidatos_columna    = candidatos_por_columna(j, sudoku);
                        candidatos_cuadricula = candidatos_por_cuadricula(i,j,sudoku);

                        candidatos_globales = [0 0 0 0 0 0 0 0 0];

                        for index = 1:9

                            if candidatos_fila(index)       == 1 &&...
                               candidatos_columna(index)    == 1 &&...
                               candidatos_cuadricula(index) == 1

                                candidatos_globales(index) = 1;

                            end

                        end

                        if sum(candidatos_globales) == 1

                            can_be_solved = 1; 

                            for index = 1:9

                                if candidatos_globales(index) == 1

                                    sudoku(i,j) = index; 

                                end

                            end

                        end

                    end 

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
            
            if (can_be_solved == 0)
                
                finished_sudoku_flag = 1;
                
            end
            
    end
    
    report = can_be_solved;
    
end