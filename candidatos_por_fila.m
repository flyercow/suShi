function [ candidatos ] = candidatos_por_fila(i, sudoku)

    candidatos = [0 0 0 0 0 0 0 0 0];
    
    for j = 1:9
        
        if sudoku(i,j) ~= 0
            
            candidatos(sudoku(i,j)) = 1; 
            
        end
        
    end
    
    for j = 1:9 
        
        if candidatos(j) == 0
            
            candidatos(j) = 1;
            
        else
            
            candidatos(j) = 0; 
            
        end
        
    end
    
end