%function con = con_dis(chord1,chord2)

%If a single interval within a chord is dissonant according to the given
%list, the entire chord is deemed dissonant.
%This functin breaks a chord down to intervals and checks whether
%the chord is dissonant or consonant.

chord1 = [60, 57, 30];
chord2 = [59, 62, 67];

semi_con = {0,'Y'; 1,'N'; 2,'N'; 3,'Y'; 4,'Y'; 5,'Y'; 6,'N';...
    7,'Y'; 8,'Y'; 9,'Y'; 10,'N'; 11,'N'; 12,'Y'};

[row1,ch1size] = size(chord1);
[row2,ch2size] = size(chord2);

for number = 1:ch1size
    midinote = chord1(number);
    inter1(ch1size, ch1size) = abs(midinote-chord1(1,1:ch1size));
end

inter1

%end