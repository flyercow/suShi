function [ candidatos ] = candidatos_por_cuadricula(i_input, j_input, sudoku)

    candidatos = [0 0 0 0 0 0 0 0 0];
    
    if i_input <= 3 
        
        i_lower_limit = 1;
        i_upper_limit = 3;
        
    elseif i_input <= 6
        
        i_lower_limit = 4;
        i_upper_limit = 6;
        
    else
        
        i_lower_limit = 7;
        i_upper_limit = 9;
        
    end
    
    if j_input <= 3 
        
        j_lower_limit = 1;
        j_upper_limit = 3;
        
    elseif j_input <= 6
        
        j_lower_limit = 4;
        j_upper_limit = 6;
        
    else
        
        j_lower_limit = 7;
        j_upper_limit = 9;
        
    end
        
    for i = i_lower_limit:i_upper_limit 
        
        for j = j_lower_limit:j_upper_limit
            
            %if ~(i == i_input) && (j == j_input)
            if sudoku(i,j) ~= 0
                
                candidatos(sudoku(i,j)) = 1; 
                
            end
            
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
   