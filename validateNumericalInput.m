function [ value ] = validateNumericalInput( str, min, max )

    value = str2num(str);
    
    if isempty(value) | value < min | value > max
        throw('Invalid Value')
    end
    
end

