function ICP(usernote)
%The first step. Takes a note name assigned by the user
%and translates it into MIDI numbers. Spits out the MIDI number.

%prompt = 'Input note name: ';
%usernote = input('Input note name: ', 's');
%usernote = inputdlg(prompt)
note = upper(usernote);

MIDI = {'C', 0; 'C#', 1; 'DB', 1; 'D', 2; 'D#', 3; 'EB', 3;
    'E', 4; 'F', 5; 'F#', 6; 'GB', 6; 'G', 7; 'G#', 8; 'AB', 8;
    'A', 9; 'A#', 10; 'BB', 10; 'B', 11;
    
    'C0',12; 'C#0',13; 'DB0',13; 'D0',14; 'D#0',15; 'EB0',15;
    'E0',16; 'F0',17; 'F#0',18; 'GB0',18; 'G0',19; 'G#0',20; 'AB0',20;
    'A0',21; 'A#0',22; 'BB0',22; 'B0',23;
    
    'C1',24; 'C#1',25; 'DB1',25; 'D1',26; 'D#1',27; 'EB1',27;
    'E1',28; 'F1',29; 'F#1',30; 'GB1',30; 'G1',31; 'G#1',32; 'AB1',32;
    'A1',33; 'A#1',34; 'BB1',34; 'B1',35;
    
    'C2',36; 'C#2',37; 'DB2',37; 'D2',38; 'D#2',39; 'EB2',39;
    'E2',40; 'F2',41; 'F#2',42; 'GB2',42; 'G2',43; 'G#2',44; 'AB2',44;
    'A2',45; 'A#2',46; 'BB2',46; 'B2',47;
    
    'C3',48; 'C#3',49; 'DB3',49; 'D3',50; 'D#3',51; 'EB3',51;
    'E3',52; 'F3',53; 'F#3',54; 'GB3',54; 'G3',55; 'G#3',56; 'AB3',56;
    'A3',57; 'A#3',58; 'BB3',58; 'B3',59;
    
    'C4',60; 'C#4',61; 'DB4',61; 'D4',62; 'D#4',63; 'EB4',63;
    'E4',64; 'F4',65; 'F#4',66; 'GB4',66; 'G4',67; 'G#4',68; 'AB4',68;
    'A4',69; 'A#4',70; 'BB4',70; 'B4',71;
    
    'C5',72; 'C#5',73; 'DB5',73; 'D5',74; 'D#5',75; 'EB5',75;
    'E5',76; 'F5',77; 'F#5',78; 'GB5',78; 'G5',79; 'G#5',80; 'AB5',80;
    'A5',81; 'A#5',82; 'BB5',82; 'B5',83;
    
    'C6',84; 'C#6',85; 'DB6',85; 'D6',86; 'D#6',87; 'EB6',87;
    'E6',88; 'F6',89; 'F#6',90; 'GB6',90; 'G6',91; 'G#6',92; 'AB6',92;
    'A6',93; 'A#6',94; 'BB6',94; 'B6',95;
    
    'C7',96; 'C#7',97; 'DB7',97; 'D7',98; 'D#7',99; 'EB7',99;
    'E7',100; 'F7',101; 'F#7',102; 'GB7',102; 'G7',103; 'G#7',104;
    'AB7',104; 'A7',105; 'A#7',106; 'BB7',106; 'B7',107; 'C8',108};
[MidiRow,MidiCol] = size(MIDI);
i = 1;

for letter = i:MidiRow
    stringcomp = strcmp(note,MIDI{letter,1});
    if stringcomp == 1
        output = MIDI(letter,2)
    end
end


