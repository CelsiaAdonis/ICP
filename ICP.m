%function attraction = ICP()

%Calculates the attraction betwen two notes or chords
%that are inputed by the user.
%Goes through a series of mathematical steps to output a single
%attraction value.


%step 1: Grab chords & count number of columns
[chord1, chord2] = chordin();

[chorow1, chocol1] = size(chord1);
[chorow2, chocol2] = size(chord2);


%step 2: Grab settings
[alpha, beta, gamma, delta] = icpsettings();


%step 3: translate both chords into MIDI
for note = 1:chocol1
    currentNote = chord1{note};
    midiX(note) = translate(currentNote);
end

for note = 1:chocol2
    currentNote = chord2{note};
    midiY(note) = translate(currentNote);
end


%step 4: Pitch Distance
%This table calculates the absolute distance between MIDI designations.

for noteX = 1:chocol1
    chordX = midiX(noteX);
    for noteY = 1:chocol2
        chordY = midiY(noteY);
        PD(noteX,noteY) = abs(chordX{1}-chordY{1});
    end
end
PD


% step 5: Interval Cycles
% This table calculates the interval cycle distance for each interval.
for noteX = 1:chocol1
    for noteY = 1:chocol2
        IC(noteX, noteY) = 12/(gcd(PD(noteX,noteY),12));
    end
end
IC


%step 6: Voice Leading
%Calculates the weight of voice leading through use of alpha and PD.
for noteX = 1:chocol1
    for noteY = 1:chocol2
        VL(noteX, noteY) = alpha/(PD(noteX,noteY)+alpha);
    end
end
VL

%step 7: Interval Cycles & Voice Leading
%Combines semitone distance with interval cycles by multiplication.
ICVL = IC .* VL;
ICVL




%end