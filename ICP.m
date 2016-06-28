function attraction = ICP()

%Calculates the attraction betwen two notes or chords
%that are inputed by the user.
%Goes through a series of mathematical steps to output a single
%attraction value.


%step 1: Grab chords & count number of columns
[chord1, chord2, root1, root2] = chordin();

[chorow1, chocol1] = size(chord1);
[chorow2, chocol2] = size(chord2);


%step 2: Grab settings
[alpha, beta, gamma, delta] = icpsettings();


%step 3: translate both chords & roots into MIDI
%Also locates the column/row of the respective roots.

% a. translate chords
for note = 1:chocol1
    currentNote = chord1{note};
    midiX(note) = translate(currentNote);
end

for note = 1:chocol2
    currentNote = chord2{note};
    midiY(note) = translate(currentNote);
end

% b. translates the root
if root1 ~= 'N'
    rootX = translate(root1);
else
    rootX = 1
end

if root2 ~= 'N'
    rootY = translate(root2);
else
    rootY = 1
end

% midiX
% midiY
% rootX
% rootY

% c. locates the root within the cell array
for midinote = 1:chocol1
    if rootX{1} == midiX{midinote}
        placeX = midinote;
    else
        placeX = 1;
    end
end

for midinote = 1:chocol2
    if rootY{1} == midiY{midinote}
        placeY = midinote;
    else
        placeY = 1;
    end
end

%placeX
%placeY


%step 4: Pitch Distance
%This table calculates the absolute distance between MIDI designations.

for noteX = 1:chocol1
    chordX = midiX(noteX);
    for noteY = 1:chocol2
        chordY = midiY(noteY);
        PD(noteX,noteY) = abs(chordX{1}-chordY{1});
    end
end
%PD


% step 5: Interval Cycles
% This table calculates the interval cycle distance for each interval.
for noteX = 1:chocol1
    for noteY = 1:chocol2
        IC(noteX, noteY) = 12/(gcd(PD(noteX,noteY),12));
    end
end
%IC


%step 6: Voice Leading
%Calculates the weight of voice leading through use of alpha and PD.
for noteX = 1:chocol1
    for noteY = 1:chocol2
        VL(noteX, noteY) = alpha/(PD(noteX,noteY)+alpha);
    end
end
%VL


%step 7: Interval Cycles & Voice Leading
%Combines semitone distance with interval cycles by multiplication.
ICVL = IC .* VL;
%ICVL


%step 8: Root Salience
%RS1 is an array of 1's, RS2 gives weight to the roots based on beta
%and gamma.
RS1 = ones(chocol1, chocol2);
RS2 = RS1;

RS2(placeX, 1:chocol2) = RS2(placeX, 1:chocol2) * beta;
RS2(1:chocol1,placeY) = RS2(1:chocol1,placeY) * gamma;

firstsum = sum(RS2);
secondsum = sum(firstsum);

RS3(1:chocol1, 1:chocol2) = RS2(1:chocol1, 1:chocol2) .* (1/secondsum);

%RS1
% RS2
% RS3

%step 9: Consonance & Dissonance
%Check whether the order is con-dis, dis-con or same

global codi
condis = con_dis(midiX, midiY);

if codi == 'SM'
    CD = RS3;
elseif codi == 'CD'
    CD = ((1 - gamma) .* RS3)
elseif codi == 'DC'
    CD = ((1 + gamma) .* RS3)
else
    CD = 'confiscated by the Vox Populi'
end
codi


%step 10: Tonal Attraction

end