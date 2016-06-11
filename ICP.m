function attraction = ICP()

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
    firstmidi(note) = translate(currentNote);
end

for note = 1:chocol2
    currentNote = chord2{note};
    secondmidi(note) = translate(currentNote);
end
firstmidi
secondmidi
end