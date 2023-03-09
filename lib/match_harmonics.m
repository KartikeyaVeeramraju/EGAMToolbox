%{
% FUNCTION:     match_harmonics

% DESCRIPTION:  Takes two matrices, Cin and Cref. Cref is a reference matrix
                and Cin is an input matrix. The function finds the middle row and middle
                column of the Cref matrix and cuts the Cin matrix to the same shape as the 
                Cref matrix. Both the matrices are supposed to be Discrete Fourier Images 
                (odd number of rows and columns). 

% INPUTS:       Cin: the matrix to be cut (must have odd rows and columns)
                Cref: the reference matrix to be cut to (must have odd rows and columns)

% OUTPUTS:      M: the output cut matrix

% ERRORS:       If input matrices are not having odd rows and columns, the function
                throws an error

% AUTHOR:       Kartikeya Veeramraju <C> 2022; Missouri S&T
%}

function M = match_harmonics(Cin, Cref)

if rem(size(Cin,1),2) ~= 0 && rem(size(Cin,2),2) ~= 0 && rem(size(Cref,1),2) ~= 0 && rem(size(Cref,2),2) ~= 0
    
    if size(Cin,1) >= size(Cref,1) && size(Cin,2) >= size(Cref,2)    
        szcut_r = size(Cref,1);
        szcut_c = size(Cref,2);
        i1 = (size(Cin, 1) - szcut_r)/2;
        i2 = (size(Cin, 2) - szcut_c)/2;
        ind1 = i1+1:i1+szcut_r;
        ind2 = i2+1:i2+szcut_c;
        M = Cin(ind1, ind2);
        
        %% experimental: find max value of the Cin and see if it lies outside M
        %find max value of Cin
%         r_offset_Cin = ceil(size(Cin,1)/2); %figure out where the c00 element is
%         c_offset_Cin = ceil(size(Cin,2)/2);
%         
%         %make the dc components zero; it is present in both matrices
%         %anyway
%         Cin(r_offset_Cin,c_offset_Cin) = 0;
%         M_in = abs(Cin); %make the abs of Cin to remove complex elements
%         maxin = max(M_in(:)); %find the maximum element in M_in
%         [cin_r,cin_c] = find(M_in == maxin); %get the indices of the max element
%         
%         %out matrix should have the in matrix's largest element
%         if ~all(M(:))
%             
%         else
%             if (cin_r(1) > size(M,1) || cin_c(1) > size(M,2)) && norm(M) > 1
%                 %if you reach here, that means, important harmonics are being
%                 %tossed out!!
%                 fprintf("Truncation is tossing out important harmonics")
%             end
%         end
    else 
        fprintf("Error! Size of the cutout matrix is larger than the 2D convolved matrix!\n")
    end
else
    fprintf("Error! Input matrices are not DFI! Input matrices are not odd sized\n")
end

end