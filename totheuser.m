function totheuser(alpha, beta, gamma, delta)

%user interface for the settings that provides defaults
%and rules for each.

prompt = {'Enter alpha value where alpha > 0', 'Enter beta where beta > 1',
    'Enter gamma where gamma > beta', 'Enter delta where delta > 0'};
dlg_title = 'Model Settings';
defaultans = {'99999', '4', '8', '0.1'};

icpsettings = inputdlg(prompt, dlg_title, 1, defaultans, 'on');
end