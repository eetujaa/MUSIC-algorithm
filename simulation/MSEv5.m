% Funktio laskee keskineliövirheen (MSE) oikeiden taajuuksien ja
% taajuusarvioiden välillä
%
% Parametrit
% Sisään
%   w_correct, tunnetut oikeat sinusoiditaajuudet
%   w_compare, sinusoiditaajuusarviot
% Ulos
%   err, puuttuvien taajuusarvioiden lukumäärä
%   mse, keskineliövirhe
function [err, mse] = MSEv5(w_correct, w_compare)
    %Alustukset
    num_found = 0;
    w_compare = sort(w_compare);
    found = false(size(w_correct));
    w_comp_idx = false(size(w_compare));
    l_correct = length(w_correct);
    l_compare = length(w_compare);
    
    %Liian monta taajuusarviota
    if l_correct < l_compare
        err = 1;
        mse = -0.000001;
   
    %Liian vähän taajuusarvioita
    elseif l_correct > l_compare
        err = l_correct - l_compare;
        k = 1;
        
        %Etsii mille oikeista taajuuksista ei löydy arviota siten, ettei
        %samaa taajuutta valita kahdesti
        for i = 1:length(w_compare)
            [~,matching_index] = min(abs(w_correct(k:end) - w_compare(i)));
            matching_index = matching_index + (k - 1);
            if ~isempty(matching_index)
                k = matching_index(1);
                num_found = num_found + 1;
                matching_index = matching_index(1);
                found(matching_index) = true;
                w_comp_idx(i) = true;
            end
            k = k+1;
        end
        
        %Sijoitetaan satunnaiset luvut puuttuvien taajuusarvioiden paikalle
        full_w_compare = -1 + 2.*rand(l_correct,1);
        full_w_compare(found) = w_compare(w_comp_idx);
        %Lasketaan keskineliövirhe
        mse = 1/l_correct .* sum((w_correct - full_w_compare).^2);
    
    %Oikea määrä taajuusarvioita
    else
        %Lasketaan keskineliövirhe
        mse = 1/l_correct .* sum((w_correct - w_compare).^2);
        err = 0;
    end
    mse = sqrt(mse);
end