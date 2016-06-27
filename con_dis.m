%function con = con_dis(chord1,chord2)

%If a single interval within a chord is dissonant according to the given
%list, the entire chord is deemed dissonant.
%This functin breaks a chord down to intervals and checks whether
%the chord is dissonant or consonant.

% [midiX, midiY] = ICP();
chord1 = [60, 64, 67];
chord2 = [57, 59, 67];


arrayX = diffarray(chord1);
arrayY = diffarray(chord2);

% arrayX = num2cell(array1)
% arrayY = num2cell(array2);

[row1,ch1size] = size(arrayX);
[row2,ch2size] = size(arrayY);
lengthX = 1:ch1size;
% lengthY = 1:ch2size;

%(b) check the semitones consonance
semi_con = {0,'Y'; 1,'N'; 2,'N'; 3,'Y'; 4,'Y'; 5,'Y'; 6,'N';...
    7,'Y'; 8,'Y'; 9,'Y'; 10,'N'; 11,'N'; 12,'Y'};

[semiRow, semiCol] = size(semi_con);

con = 'Y';
for number = 1:ch1size
    for numb = 1:row1
        for interval = 1:semiRow
            if arrayX(numb, number) == semi_con{interval,1}
                con = semi_con{interval,2};
                if con == 'N'
                    chordX = 'diss'
                    break
                else
                    chordX = 'cons'
                end
            end
        end
        if con == 'N'
            break
        end                
    end
    if con == 'N'
        break
    end
end





%end