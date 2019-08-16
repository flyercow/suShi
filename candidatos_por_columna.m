function [ candidatos ] = candidatos_por_columna(j, sudoku)

    candidatos = [0 0 0 0 0 0 0 0 0];
    
    for i = 1:9
        
        if sudoku(i,j) ~= 0
            
            candidatos(sudoku(i,j)) = 1; 
            
        end
        
    end
    
    for i = 1:9 
        
        if candidatos(i) == 0
            
            candidatos(i) = 1;
            
        else
            
            candidatos(i) = 0; 
            
        end
        
    end
    
end