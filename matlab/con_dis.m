function codi = con_dis(pastchord,preschord)

%If a single interval within a chord is dissonant according to the given
%list, the entire chord is deemed dissonant.
%This functin breaks a chord down to intervals and checks whether
%the chord is dissonant or consonant.


%(a) calculate semitone distance between notes & size the resulting arrays

%[midiX, midiY] = ICP();

arrayX = diffarray(pastchord);
arrayY = diffarray(preschord);

[row1,ch1size] = size(arrayX);
[row2,ch2size] = size(arrayY);


%(b) check for consonance & label chord as cons or diss

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
                    chordX = 'diss';
                    break
                else
                    chordX = 'cons';
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

for number = 1:ch2size
    for numb = 1:row2
        for interval = 1:semiRow
            if arrayY(numb, number) == semi_con{interval,1}
                con = semi_con{interval,2};
                if con == 'N'
                    chordY = 'diss';
                    break
                else
                    chordY = 'cons';
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


%(c) label the sequence of chords as CD, DC, SM (cons to diss,
%diss to cons, or same)
global codi

if chordX == chordY
    codi = 'SM';
elseif (chordX == 'cons' & chordY == 'diss')
    codi = 'CD';
elseif (chordX == 'diss' & chordY == 'cons')
    codi = 'DC';
else
    codi = 'error: self-destruct imminent';
end

end