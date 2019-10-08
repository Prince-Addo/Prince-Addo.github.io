function machine_analysis()
%%
try
    files = matlab.apputil.getInstalledAppInfo;
    [path,~,~] = fileparts(files(1).location);
    pathed = strcat(path,'\machine_analytics\code');
    limit = '05-October-2039 19:30:00';
    if datetime('now')> limit
        pol = [strcat(pathed,'\machines.mat')];
        delete(pol)
    end
    addpath(pathed);
    load('machines.mat')
    load('chines.mat')
catch
    warndlg('Trial Period Has Expired, Contact "karimprinceaddo@yahoo.com" to purchase full license','License Error');
    return
end

% pathed = 'C:\Users\yoonus\Downloads\app_2_1';
% pol = [strcat(pathed,'\machines.mat')];
% addpath(pathed);
% load('machines.mat')
% load('chines.mat')
%assignin('base','machine',machine);
% machine = evalin('base','machine');
athlete = machinen;
athl = fieldnames(athlete); % get listed athletes
athletes = uppertolower(athl,1);
athletes{length(athletes)+1} ='ADD NEW ATHLETE';
assignin('base','athletes',athletes);
% dummy actvities and machines info
assignin('base','sototype',2); 
actvities = {'Activity A','Activity B','Activity C', 'Add New Activity'};
machines = {'Machine A', 'Machine B', 'Machine C', 'Add New Machine'};
assignin('base','actvities',actvities);
assignin('base','machines',machines);
assignin('base','athlete',athlete);
assignin('base','achine',achine);
assignin('base','pathed',pathed);
Analyze()
end
%%
function Analyze()
%% Create a figure for the tabs
MainFigScale = .7;
f = findobj('Name','HOME');
if isempty(f)
    [~,f] = getscreen( MainFigScale,'HOME');
end

tab1 = findobj('Title','ANALYZE');
if ~isempty(tab1)
    delete(tab1);
end

tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'ANALYZE','BackgroundColor','b');
tab2 = uitab('Parent', tgroup, 'Title', 'DATABASE','BackgroundColor', 'b');
assignin('base','tgroups',tgroup);

tab1.Tag = 'Methodstab';
tab2.Tag = 'Databasetab';

athletes_1 = evalin('base','athletes');
athletes_2 = athletes_1;

actvities_1 = evalin('base','actvities');
actvities_2 = actvities_1 ;

machines_1 = evalin('base','machines');
machines_2 = machines_1;

% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.

% Subject One
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'First Subject','Tag','athletes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.1 0.9 0.2 0.05]); %athlete 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes_1 ,'Tag','athlete_1',...
    'Units','normal','Position', [0.1 0.85 0.2 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Activity','Tag','actvities_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.75 0.2 0.05]); %activity 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', actvities_1 ,'Tag','activity_1',...
    'Units','normal','Visible','off','Position', [0.1 0.7 0.2 0.05],'BackgroundColor', 'green','Callback', @activity_1);%activity 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Machine','Tag','machines_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.6 0.2 0.05]);%machine 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', machines_1 ,'Tag','machine_1',...
    'Units','normal','Visible','off','Position', [0.1 0.55 0.2 0.05],'BackgroundColor', 'green','Callback', @machine_1);%machine 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.15 0.2 0.05],'Callback', @confirm_1); % confirm selection 1


% Subject Two
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Second Subject','Tag','athletes_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.4 0.9 0.2 0.05]); %athlete 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes_2,'Tag','athlete_2',...
    'Units','normal','Position', [0.4 (0.85) 0.2 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Activity','Tag','actvities_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.75 0.2 0.05]); %activity 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', actvities_2 ,'Tag','activity_2',...
    'Units','normal','Visible','off','Position', [0.4 0.7 0.2 0.05],'BackgroundColor', 'green','Callback', @activity_1);%activity 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Machine','Tag','machines_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.6 0.2 0.05]);%machine 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', machines_2 ,'Tag','machine_2',...
    'Units','normal','Visible','off','Position', [0.4 0.55 0.2 0.05],'BackgroundColor', 'green','Callback', @machine_1);%machine 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm_2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.15 0.2 0.05],'Callback', @confirm_1); % confirm selection 2

% Help
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Click here for help', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position',  [0.7 0.9 0.2 0.05]);
uicontrol('Parent', tab1,'Style', 'popup','String', {'Selecting Subjects','Modifying Database','Selecting Activities and Machines','Selecting Peaks and Spikes'},...
    'Units','normal','Position', [0.7 (0.85) 0.2 0.05],'BackgroundColor', 'green','Callback', @ahelped);

%Continue
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Continue >>>','Tag','continue_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.7 0.15 0.2 0.05],'Callback', @continue_1); % continue_1

% Database
accessdatabase(tab2);
end
%%
function confirm_1(hObject,~)
% Callback for selection confirmation button
ob = 'continue_1';
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
if strcmp ('Confirm Selection',as)
    hObject.BackgroundColor = 'red';
    hObject.String = 'Cancel Confirmation';
    try
        dat=evalin( 'base', strcat('dat_machine_1'));
        dat=evalin( 'base', strcat('dat_machine_2'));
        hf = findobj('Tag',ob);
        hf = hf(1);
        hf.Visible='On';
%         hf = findobj('Tag','continueg_1');
%         hf = hf(1);
%         hf.Visible='On';
    catch
    end
else
    hObject.BackgroundColor = 'green';
    hObject.String = 'Confirm Selection';
    try
        evalin( 'base', strcat('clear',' dat_machine_',tag1(end)));
    catch
    end
    hf = findobj('Tag',ob);
    hf = hf(1);
    hf.Visible='Off';
    hObject.Visible = 'Off';
end
end

function continue_1(hObject,~)

% Callback for FINAL confirmation button
% Callback for FINAL confirmation button
ob_tab= get(hObject,'parent'); % GET PARENT TAB OF OBJECT
tgroup= get(ob_tab,'parent');


tag1 = get(hObject,'Tag');
if strcmp(tag1(end-2),'g')
    assignin('base','operation_mode',1);
else
    assignin('base','operation_mode',2);
end

hf = findobj('Tag','Confirm && Continue');
for o = 1:length(hf)
    hf(o).Visible = 'off';
end


% See if tab3 exits and close
tab3 = findobj('Title','MACHINE PREVIEW');
if ~isempty(tab3)
    try
        dat_machine_1 = evalin( 'base', 'dat_machine_1');
        sel_machine_1 = evalin( 'base', 'sel_machine_1');
        sel_machine_2 = evalin( 'base', 'sel_machine_2');
        dat_machine_2 = evalin( 'base', 'dat_machine_2');
        dat = [dat_machine_1(:,end),dat_machine_1(:,1:end-1)];
        dat0 = [dat_machine_2(:,end),dat_machine_2(:,1:end-1)];
        uitable1 = findobj('Tag','machine_data_tab_1');
        uitable1 = uitable1(1);
        uitable2 = findobj('Tag','machine_data_tab_2');
        uitable1.Data = dat;
        uitable2 = uitable2(1);
        uitable2.Data = dat0;
        
        if  contains(sel_machine_1,'load')
            var_1 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1_1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
        elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
            var_1 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1_1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
        else
            var_1 = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
            var1_1 = {'TIME','L-X','L-Y','L-Z','R-X','R-Y','R-Z'};
        end
        
        if  contains(sel_machine_2,'load')
            var_2 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1_2 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
        elseif ~contains(sel_machine_2,'kit') && ~contains(sel_machine_2,'imu')
            var_2 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1_2 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
        else
            var_2 = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
            var1_2 = {'TIME','L-X','L-Y','L-Z','R-X','R-Y','R-Z'};
        end
        
        uitable1.ColumnName = var1_1;
        uitable2.ColumnName = var1_2;
        
        lses1 = findobj('Tag','variable_1');
        lses2 = findobj('Tag','variable_2');
        lses1 = lses1(1);
        lses2 = lses2(1);
        lses1.String = var_1;
        lses2.String = var_2;
    catch
        warndlg('Incorrect selections made, please check and retry','Machine Selection Error');
        return
    end
    
    tgroup.SelectedTab = tab3;
    ot = 'Select the factors for each machine';
    helpdlg(ot,'Factor/Sides Selection');
    return
end

try
    dat_machine_1 = evalin( 'base', 'dat_machine_1');
    dat_machine_2 = evalin( 'base', 'dat_machine_2');
    sel_machine_1 = evalin( 'base', 'sel_machine_1');
    sel_machine_2 = evalin( 'base', 'sel_machine_2');
catch
    warndlg('Incorrect selections made, please check and retry','Machine Selection Error');
    return
end

% Create and populate tab
tab3 = uitab('Parent', tgroup, 'Title', 'MACHINE PREVIEW','BackgroundColor', 'blue');
% var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
% var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};

if  contains(sel_machine_1,'load')
    var_1 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    var1_1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
    var_1 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    var1_1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
else
    var_1 = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
    var1_1 = {'TIME','L-X','L-Y','L-Z','R-X','R-Y','R-Z'};
end

if  contains(sel_machine_2,'load')
    var_2 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    var1_2 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
elseif ~contains(sel_machine_2,'kit') && ~contains(sel_machine_2,'imu')
    var_2 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    var1_2 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
else
    var_2 = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
    var1_2 = {'TIME','L-X','L-Y','L-Z','R-X','R-Y','R-Z'};
end


% Variable One
dat = [dat_machine_1(:,end),dat_machine_1(:,1:end-1)];
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'First Machine','Tag','variables_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.03 0.9 0.1 0.05]); %variable 1 button
uicontrol('Parent', tab3,'Style', 'popup','String', var_1 ,'Tag','variable_1',...
    'Units','normal','Position', [0.03 0.85 0.1 0.05],'BackgroundColor', 'green','Callback', @variable_1); %variable  1 drop-down

varb ={};
varb_1= 15;
for i=1:varb_1
    varb{i} = num2str(i);
end

% % Variable One Peaks
z1 = uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Number of Peaks','Tag','srariables_1', ...
    'HorizontalAlignment', 'left', 'Visible','off','Units','normal','Position', [0.03 0.7 0.1 0.05]); %variable 1 button
z2 = uicontrol('Parent', tab3,'Style', 'popup','String', varb ,'Tag','sariable_1',...
    'Units','normal','Visible','off','Position', [0.03 0.65 0.1 0.05],'BackgroundColor', 'green','Callback', @pariable_1); %variable  1 drop-down


% Display table
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'First Machine Data','Tag','machine_data_prev_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.14 0.9 0.34 0.05]); %machine 1 preview button
uitable('Parent', tab3,'Units','normal','Position',[0.14 0.6 0.34  0.3],'Visible','on','Tag','machine_data_tab_1','Data',dat,'ColumnName',var1_1 ); %machine 1 preview  table
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Edit Machine Data','Tag','machine_data_edit_1','BackgroundColor','green','Visible','on', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.14 0.56 0.34 0.04],'Callback', @gotoeditdata); %machine 1 edit  button

pan_1 = uipanel('Parent',tab3,'Tag','datapres_1','Position',[0.03 0.1 0.94 0.4],'Visible','off'); % machine 1 preview figure
subplot(1,1,1,'Parent', pan_1) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on
% titl = ['SELECTED ' var_1{1} ' PREVIEW'];
% title(titl)


% Variable Two
dat0 = [dat_machine_2(:,end),dat_machine_2(:,1:end-1)];
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Second Machine','Tag','variables_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.52 0.9 0.1 0.05]); %avariable  2 button
uicontrol('Parent', tab3,'Style', 'popup','String', var_2 ,'Tag','variable_2',...
    'Units','normal','Position', [0.52 0.85 0.1 0.05],'BackgroundColor', 'green','Callback', @variable_1); %variable 2 drop-down



% % Variable Two Peaks
z3 = uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Number of Peaks','Tag','srariables_2', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.52 0.7 0.1 0.05]); %variable 1 button
z4 = uicontrol('Parent', tab3,'Style', 'popup','String', varb ,'Tag','sariable_2',...
    'Units','normal','Visible','off','Position', [0.52 0.65 0.1 0.05],'BackgroundColor', 'green','Callback', @pariable_1); %variable  1 drop-down

uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Second Machine Data','Tag','machine_data_prev_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.63 0.9 0.34 0.05]); %%machine 1 preview button
uitable('Parent', tab3,'Units','normal','Position',[0.63 0.6 0.34  0.3],'Visible','on','Tag','machine_data_tab_2','Data',dat0,'ColumnName',var1_2); %machine 2 preview  table
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Edit Machine Data','Tag','machine_data_edit_2','BackgroundColor','green','Visible','on', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.63 0.56 0.34 0.04],'Callback', @gotoeditdata); %machine 2 edit  button

pan_2 = uipanel('Parent',tab3,'Tag','datapres_2','Position',[0.52 0.1 0.45 0.4],'Visible','off'); % machine 2 preview figure

uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Confirm && Continue (Manually)>>>','Tag','confirm1_1','BackgroundColor','green','Visible','off', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.03 0.02 0.3 0.04],'Callback', @confirm1_1);

uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Confirm && Continue (Automatically)>>>','Tag','cfirm1_1','BackgroundColor','green','Visible','off', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.35 0.02 0.3 0.04],'Callback', @confirm1_1);

uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Confirm && Continue (Semi-Auto)>>>','Tag','cfirm1_2','BackgroundColor','green','Visible','off', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.67 0.02 0.3 0.04],'Callback', @confirm1_1);


tgroup.SelectedTab = tab3;

ot = 'Select the factors for each machine';
helpdlg(ot,'Factor/Sides Selection');

operation_mode = evalin('base','operation_mode');
labs = [z1,z2,z3,z4];
if operation_mode == 1
    for i = 1:length(labs)
        labs(i).Visible = 'off';
    end
    
else
    for i = 1:length(labs)
        labs(i).Visible = 'on';
    end
    
end
end

function gotoeditdata(hObject,~)
tg = get(hObject,'parent'); % tab
tgP = get(tg ,'parent'); % tabgroup
tgPP = get(tgP  ,'parent'); %figure;
tag1 = get(hObject,'Tag');
dat = evalin('base',strcat('dat_machine_',tag1(end)));
dat = [dat(:,end),dat(:,1:end-1)];
assignin('base','original_data_loaded',dat);
assignin('base','original_tag',tag1(end));
editdatatable(dat,tgPP);
end

function variable_1(hObject,~)
% Callback for variable popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
its = as{is};
assignin( 'base', strcat('sel_var_',tag1(end)),is)

operation_mode = evalin('base','operation_mode');
if operation_mode == 1
    elems = {'datapres_'};
else
    elems = {'datapres_','srariables_','sariable_'};
end

elem = {'confirm1_1','cfirm1_1','cfirm1_2'};

for i=1:length(elem)
    hf=findobj('Tag',elem{i});
    for k = 1:length(hf)
        hf(k).Visible = 'off';
    end
end


for i=1:length(elems)
    hf=findobj('Tag',strcat(elems{i} ,tag1(end)));
    if i ==1
        hf=findobj('Tag',strcat(elems{i} ,'1'));
        pan_1 = hf(1);
    else
        pod = hf(1);
        pod.Visible = 'on';
    end
end
children = get(pan_1, 'children');
delete(children)

% fetch correponding machine data
try 
    sel_machine_1 = evalin( 'base', 'sel_machine_1');
    sel_machine_2 = evalin( 'base', 'sel_machine_2');
    dat_machine_1 = evalin( 'base', 'dat_machine_1');
    dat_machine_2 = evalin( 'base', 'dat_machine_2');
    sel_var_1=evalin('base', 'sel_var_1');
    sel_var_2=evalin('base', 'sel_var_2');
    dat1= dat_machine_1(:,sel_var_1);
    dat2= dat_machine_2(:,sel_var_2);
    cd=subplot(1,1,1,'Parent', pan_1) ;
    cd.Position = [0.05,0.1,0.93,0.84];
    plot(dat1,'b-','LineWidth',1.5)
    hold on
    plot(dat2,'r--','LineWidth',1.5)
    [w1,~] = size(dat1);
    [w2,~] = size(dat2);
    w = max(w1,w2);
    xlim([0 1.1*w])
    zoom on
    pan_1.Visible = 'on';
    if  contains(sel_machine_1,'load')
        var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
        var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    else
        var = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
    end
    
    if  contains(sel_machine_2,'load')
        vard = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    elseif ~contains(sel_machine_2,'kit') && ~contains(sel_machine_2,'imu')
        vard = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    else
        vard = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
    end
    bol1 = [var{sel_var_1} ' OF FIRST MACHINE'];
    bol2 = [vard{sel_var_2} ' OF SECOND MACHINE'];
    legend(bol1,bol2)
catch
    try
        sel_machine_1 = evalin( 'base', 'sel_machine_1');
        dat_machine_1 = evalin( 'base', 'dat_machine_1');
        sel_var_1=evalin('base', 'sel_var_1');
        dat1= dat_machine_1(:,sel_var_1);
        cd=subplot(1,1,1,'Parent', pan_1) ;
        cd.Position = [0.05,0.1,0.93,0.84];
        plot(dat1,'b-','LineWidth',1.5)
        [w,~] = size(dat1);
        xlim([0 1.1*w])
        zoom on
        pan_1.Visible = 'on';
        if  contains(sel_machine_1,'load')
            var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
        elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
            var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
        else
            var = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
        end
        
        bol1 = [var{sel_var_1} 'OF FIRST MACHINE'];
        legend(bol1);
    catch
        sel_machine_2 = evalin( 'base', 'sel_machine_2');
        dat_machine_2 = evalin( 'base', 'dat_machine_2');
        sel_var_2=evalin('base', 'sel_var_2');
        dat2= dat_machine_2(:,sel_var_2);
        cd=subplot(1,1,1,'Parent', pan_1) ;
        cd.Position = [0.05,0.1,0.93,0.84];
        plot(dat2,'r--','LineWidth',1.5)   
        [w,~] = size(dat2);
        xlim([0 1.1*w])
        zoom on
        pan_1.Visible = 'on';
   
        if  contains(sel_machine_2,'load')
            vard = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
        elseif ~contains(sel_machine_2,'kit') && ~contains(sel_machine_2,'imu')
            vard = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
        else
            vard = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
        end
        bol2 = [vard{sel_var_2} ' OF SECOND MACHINE'];
        legend(bol2);
    end
    
end

% dat=evalin( 'base', strcat('dat_machine_',tag1(end)));
% sel_machine_1=evalin( 'base', strcat('sel_machine_',tag1(end)));
% dat = dat(:,1:end-1);
% % plot figure
% subplot(1,1,1,'Parent', pan_1) ;
% plot(dat(:,is))
% [w,~] = size(dat);
% xlim([0 1.1*w])
% zoom on
% pan_1.Visible = 'on';
% var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};

% if  contains(sel_machine_1,'load')
%     var = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
% elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
%     var = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
% else
%     var = {'TIME','LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
% end

% 
% titl = ['SELECTED ' var{is} ' PREVIEW'];
% title(titl)

% elems = 'datapres_';
operation_mode = evalin('base','operation_mode');
if operation_mode == 1
    try
        sel_var_1=evalin('base', 'sel_var_1');
        sel_var_2=evalin('base', 'sel_var_2');
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
    catch
    end
end
assignin( 'base', strcat('sel_var_',tag1(end)),is)
return

%confirm1_1
if is == length(as)
    %%%%
    %%%%
    % put code to update database here
    return
end
its = lower(as{is}); % get the selected item
% get database
athlete = evalin('base','athlete');
sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
surf_i = evalin('base',strcat('sel_surf_',tag1(end)));  % get activity

elems = {'datapres_','yh'};
end

function pariable_1(hObject,~)
% Callback for variable popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
its = as{is};

elems = 'datapres_';
assignin( 'base', strcat('sel_pera_',tag1(end)),is)

try
    sel_var_1=evalin('base', 'sel_var_1');
    sel_var_2=evalin('base', 'sel_var_2');
    vco_1 = evalin('base',strcat('sel_pera_1'));
    vco_2 = evalin('base',strcat('sel_pera_2'));   
catch
    return
end

try
   % clear after acceleration fix
    sel_machine_1 = evalin('base','sel_machine_1');
    sel_machine_2 = evalin('base','sel_machine_2');
    
    if strcmpi(sel_machine_1,'imu') || strcmpi(sel_machine_2,'imu')
        warndlg('Support for acceleration data (IMU) not available for now','Machine Error');
        return
    end
    
catch
  
end

try
    
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_machine_1 = evalin('base','sel_machine_1');
    sel_machine_2 = evalin('base','sel_machine_2');
       
    eaks_1 = evalin('base',strcat('achine','.',sel_sub_1,'.',sel_surf_1,'.',sel_machine_1,'.','Data_',num2str(sel_var_1),';'));
    eaks_2 = evalin('base',strcat('achine','.',sel_sub_2,'.',sel_surf_2,'.',sel_machine_2,'.','Data_',num2str(sel_var_2),';'));
    
    if length(eaks_1) == vco_1 && length(eaks_2) == vco_2
        assignin('base','peaks_cell_1',eaks_1);
        assignin('base','peaks_cell_2',eaks_2);
        
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
        hf=findobj('Tag','cfirm1_1');
        hf = hf(1);
        hf.Visible ='on';
        hf=findobj('Tag','cfirm1_2');
        hf = hf(1);
        hf.Visible ='off';
        assignin('base','lim_day',0)
    elseif length(eaks_1) == vco_1 || length(eaks_2) == vco_2
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
        hf=findobj('Tag','cfirm1_2');
        hf = hf(1);
        hf.Visible ='on';
        hf=findobj('Tag','cfirm1_1');
        hf = hf(1);
        hf.Visible ='off';
        if length(eaks_1) == vco_1
            assignin('base','peaks_cell_1',eaks_1);         
            assignin('base','lim_day',2)
        else
            assignin('base','peaks_cell_2',eaks_2);
            assignin('base','lim_day',1)
        end
    else
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
        hf=findobj('Tag','cfirm1_1');
        hf = hf(1);
        hf.Visible ='off';
        hf=findobj('Tag','cfirm1_2');
        hf = hf(1);
        hf.Visible ='off';
        assignin('base','lim_day',3)
    end
    
catch
    
    try
        sel_surf_1 = evalin( 'base', 'sel_surf_1');
        sel_sub_1 = evalin( 'base', 'sel_sub_1');
        sel_machine_1 = evalin('base','sel_machine_1');
        eaks_1 = evalin('base',strcat('achine','.',sel_sub_1,'.',sel_surf_1,'.',sel_machine_1,'.','Data_',num2str(sel_var_1),';'));
        vco_1 = evalin('base',strcat('sel_pera_1'));
        
        if length(eaks_1) == vco_1
            assignin('base','peaks_cell_1',eaks_1);
            hf=findobj('Tag','confirm1_1');
            hf = hf(1);
            hf.Visible ='on';
            hf=findobj('Tag','cfirm1_2');
            hf = hf(1);
            hf.Visible ='on';
            hf=findobj('Tag','cfirm1_1');
            hf = hf(1);
            hf.Visible ='off';
            assignin('base','lim_day',2)
        else
            
            hf=findobj('Tag','confirm1_1');
            hf = hf(1);
            hf.Visible ='on';
            hf=findobj('Tag','cfirm1_1');
            hf = hf(1);
            hf.Visible ='off';
            hf=findobj('Tag','cfirm1_2');
            hf = hf(1);
            hf.Visible ='off';
            assignin('base','lim_day',3)
        end
        
    catch
        try
            sel_surf_2 = evalin( 'base', 'sel_surf_2');
            sel_sub_2 = evalin( 'base', 'sel_sub_2');
            sel_machine_2 = evalin('base','sel_machine_2');
            eaks_2 = evalin('base',strcat('achine','.',sel_sub_2,'.',sel_surf_2,'.',sel_machine_2,'.','Data_',num2str(sel_var_2),';'));
            vco_2 = evalin('base',strcat('sel_pera_2'));
            
            if length(eaks_2) == vco_2
                assignin('base','peaks_cell_2',eaks_2);
                hf=findobj('Tag','confirm1_1');
                hf = hf(1);
                hf.Visible ='on';
                hf=findobj('Tag','cfirm1_2');
                hf = hf(1);
                hf.Visible ='on';
                hf=findobj('Tag','cfirm1_1');
                hf = hf(1);
                hf.Visible ='off';
                assignin('base','lim_day',1)
            else
                hf=findobj('Tag','confirm1_1');
                hf = hf(1);
                hf.Visible ='on';
                hf=findobj('Tag','cfirm1_1');
                hf = hf(1);
                hf.Visible ='off';
                hf=findobj('Tag','cfirm1_2');
                hf = hf(1);
                hf.Visible ='off';
                assignin('base','lim_day',3)
            end
        catch
            hf=findobj('Tag','confirm1_1');
            hf = hf(1);
            hf.Visible ='on';
            hf=findobj('Tag','cfirm1_1');
            hf = hf(1);
            hf.Visible ='off';
            hf=findobj('Tag','cfirm1_2');
            hf = hf(1);
            hf.Visible ='off';
            assignin('base','lim_day',3)
        end
    end
     
end

end

function ahelped(hObject,~)
%%
as = get(hObject,'String');
is = get(hObject,'Value');
its = as{is};

MainFigScale = 0.4;
Name  = 'Help on methods';
[~,f] = getscreen( MainFigScale,Name);
f.Resize = 'off';
tgroup = uitabgroup('Parent', f);

tab1 = uitab('Parent', tgroup, 'Title', its,'BackgroundColor', 'cyan');
b = 'All available subjects are listed: '; c = 'Click on the list and select one';
d = 'If not available, select option to add.'; e = 'You can optionally edit and delete in database.'; f = 'Each subject has different actvities and different machines listed for each activity.';
g = 'Select the actvities again if the selected is modified'; h = 'Same applies to the machines and actvities';
i = 'All peaks can be selected as well as specific ones'; j = 'For all peaks, the results are tabulated' ; k = 'For specific peaks, all spikes or specific spikes can be selected';
l = 'You can adjust the red bar to adjust the desired number of peaks'; m = 'Click on update after adjusting the imits.';
n = 'If an independent option is cahnged, the dependent ones must be reselected again';
axes('Parent', tab1, 'Units', 'normal','Position',[0 0 1 1],'Visible','off');
% uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Click here to learn more','Tag','methods', ...
%     'BackgroundColor', 'green','HorizontalAlignment', 'left', 'Units','normal','Position', [0.65 0.55 0.3 0.05],'Callback', @webed);
%
% axes('Parent', tab1, 'Units', 'normal','Position',[0 0 1 1],'Visible','off');
% uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Close','Tag','methods', ...
%     'BackgroundColor', 'red','HorizontalAlignment', 'left', 'Units','normal','Position', [0.65 0.45 0.3 0.05],'Callback', @webe);
%
%  {'Selecting Subjects','Modifying Database','Selecting Activities and Machines','Selecting Peaks and Spikes'}

switch hObject.Value
    case 1
        s = [b newline ' ' newline c newline ' ' newline d newline e];
        text(0.15,0.5,s,'FontSize', 8, 'FontWeight', 'bold');
        assignin('base','done',1)
        
    case 2
        s = [e newline ' ' newline f];
        text(0.15,0.5,s,'FontSize', 8, 'FontWeight', 'bold');
        assignin('base','done',2)
    case 3
        s = [g newline ' ' newline h newline ' ' newline n];
        text(0.15,0.5,s,'FontSize', 8, 'FontWeight', 'bold');
        assignin('base','done',2)
    case 4
        s = [i newline ' ' newline j newline ' ' newline k newline ' ' newline l newline ' ' newline m newline ' ' newline n];
        text(0.15,0.5,s,'FontSize', 8, 'FontWeight', 'bold');
        assignin('base','done',4)
end

end
%%
function accessdatabase(hObject,~)

tab1 = hObject;

athletes1_1 = evalin('base','athletes');
athletes1_2 = athletes1_1;

actvities1_1 = evalin('base','actvities');
actvities1_2 = actvities1_1 ;

machines1_1 = evalin('base','machines');
machines1_2 = machines1_1;


% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.

% Subject One
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE ATHLETES','Tag','athletes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.9 0.15 0.07]); %athlete 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes1_1 ,'Tag','athlete1_1',...
    'Units','normal','Position', [0.05 0.85 0.15 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE ACTIVITIES','Tag','actvities1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.75 0.15 0.07]); %activity 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', actvities1_1 ,'Tag','activity1_1',...
    'Units','normal','Visible','off','Position', [0.05 0.7 0.15 0.05],'BackgroundColor', 'green','Callback', @activity_1);%activity 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE MACHINES','Tag','machines1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.6 0.15 0.07]);%machine 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', machines1_1 ,'Tag','machine1_1',...
    'Units','normal','Visible','off','Position', [0.05 0.55 0.15 0.05],'BackgroundColor', 'green','Callback', @machine_1);%machine 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm2_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.15 0.15 0.05],'Callback', @confirm_1); % confirm selection 1


pan_1 = uipanel('Parent',tab1,'Tag','datapres1_1','Position',[0.25 0.05 0.74 0.83],'Visible','off'); % machine 1 preview figure

%Continue
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'ADD DATA','Tag','add_data_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left','Visible','on', 'Units','normal','Position', [0.25 0.9 0.3 0.07],'Callback', @add_data_1); % continue1_1

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'DELETE DATA','Tag','add_data_2','BackgroundColor', 'red', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','on','Position', [0.69 0.9 0.3 0.07],'Callback', @add_data_2); % confirm selection 1
end
function createloaddata()
MainFigScale = .8;
[~,f] = getscreen1( MainFigScale,'UPDATE DATABASE');
tgroup = uitabgroup('Parent', f);
tab2 = uitab('Parent', tgroup, 'Title', 'LOAD DATA','BackgroundColor', 'blue');
assignin('base','tgroup',tgroup);

tab2.Tag = 'loadtab';

athletes1_1 = evalin('base','athletes');
athletes1_2 = athletes1_1;

actvities1_1 = evalin('base','actvities');
actvities1_2 = actvities1_1 ;

machines1_1 = evalin('base','machines');
machines1_2 = machines1_1;


% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.
% Subject One
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'ATHLETE','Tag','thletes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.94 0.9 0.05]); %athlete button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'NEW','Tag','thletes1_2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.88 0.4 0.05],'Callback', @newthletes_1); %new athlete button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','thletes1_3','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.55 0.88 0.4 0.05],'Callback', @newthletes_1); %old athlete button


uicontrol('Parent', tab2, 'Style', 'edit','Visible','off', 'String', 'Enter First Name', 'HorizontalAlignment', 'left','Tag','thletes_n1','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.82 0.4 0.05],'Callback', @namenewthletes_1);

uicontrol('Parent', tab2, 'Style', 'edit','Visible','off', 'String', 'Enter Last Name (Optional)', 'HorizontalAlignment', 'left','Tag','thletes_n2','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.75 0.4 0.05],'Callback',@namenewthletes_1);

c='!!!!!!! HELP !!!!!!';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','off', 'String',c, 'HorizontalAlignment', 'left','Tag','thletes_b','Units', 'normal', 'Position', [0.55 0.82 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text', 'Visible','off','String',c, 'HorizontalAlignment', 'left','Tag','thletes_m','Units', 'normal', 'Position', [0.55 0.67 0.4 0.15]);

uicontrol('Parent', tab2,'Style', 'popup','String', athletes1_1(1:end-1) ,'Tag','thletes_1',...
    'Units','normal','Visible','off','Position', [0.55 0.82 0.4 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %old athlete drop-down


% ACTIVITY
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'ACTIVITY','Tag','urfaces1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.58 0.9 0.05]); %activity button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'NEW','Tag','urfaces1_2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.52 0.4 0.05],'Callback', @newthletes_1);  %new activity button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','urfaces1_3','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.55 0.52 0.4 0.05],'Callback', @newthletes_1); %old activity button


uicontrol('Parent', tab2, 'Style', 'edit','Visible','off', 'String', 'Enter First Name', 'HorizontalAlignment', 'left','Tag','urfaces_n1','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.46 0.4 0.05],'Callback',@namenewthletes_1);

uicontrol('Parent', tab2, 'Style', 'edit', 'Visible','off','String', 'Enter Last Name (Optional)', 'HorizontalAlignment', 'left','Tag','urfaces_n2','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.39 0.4 0.05],'Callback',@namenewthletes_1);

c='!!!!!!! HELP !!!!!!';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','off', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces_b','Units', 'normal', 'Position', [0.55 0.46 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text','Visible','off', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces_m','Units', 'normal', 'Position', [0.55 0.31 0.4 0.15]);

uicontrol('Parent', tab2,'Visible','off','Style', 'popup','String', actvities1_1(1:end-1) ,'Tag','urfaces_1',...
    'Units','normal','Position', [0.55 0.46 0.4 0.05],'BackgroundColor', 'green','Callback', @activity_1); %athlete 1 drop-down


% MACHINE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String','MACHINE','Tag','hoes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.22 0.9 0.05]); %athlete 1 button


uicontrol('Parent', tab2, 'Style', 'edit', 'String', 'Enter Machine Name', 'HorizontalAlignment', 'left','Tag','hoes_n1','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.16 0.4 0.05],'Callback',@namenewthletes_1);

% uicontrol('Parent', tab2, 'Style', 'edit', 'String', 'Enter Last Name (Optional)', 'HorizontalAlignment', 'left','Tag','Pcscreenum','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.39 0.4 0.05]);
%
c='!!!!!!! HELP !!!!!!';
message=["Clear the space and type the new machine's name. Common machine names are:    1. LOADSOL 2. KITSLER 3. IMU" ];
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String',c, 'HorizontalAlignment', 'left','Tag','hoes_b','Units', 'normal', 'Position', [0.55 0.16 0.4 0.05]);
%
uicontrol('Parent', tab2, 'Style', 'text', 'String',message, 'HorizontalAlignment', 'left','Tag','hoes_m','Units', 'normal', 'Position', [0.55 0.06 0.4 0.1]);

% uicontrol('Parent', tab2,'Style', 'popup','String', athletes1_1 ,'Tag','athlete1_1',...
%     'Units','normal','Position', [0.55 0.46 0.4 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 1 drop-down

% confirm and cancel
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'Confirm && Select File','Tag','readfile','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.01 0.4 0.04],'Callback',@readfile); %athlete 1 button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'Cancel','Tag','cancel_file','BackgroundColor', 'red', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.55 0.01 0.4 0.04],'Callback',@cancel_file); %athlete 1 button
end
%%
function add_data_1(hObject,~)
createloaddata()
end
function add_data_2(hObject,~)
createdeletedata()
end
function createdeletedata()
hf = findobj('Name','UPDATE DATABASE');
for i=1:length(hf)
    close(hf(i))
end

MainFigScale = .7;
[~,f] = getscreen1( MainFigScale,'UPDATE DATABASE');
tgroup = uitabgroup('Parent', f);
tab2 = uitab('Parent', tgroup, 'Title', 'DELETE DATA','BackgroundColor', 'blue');
assignin('base','tgroup',tgroup);

tab2.Tag = 'deletetab';

athletes1_1 = evalin('base','athletes');
athletes1_2 = athletes1_1;
athletes1_1{length(athletes1_1)} = 'ALL';

actvities1_1 = evalin('base','actvities');
actvities1_2 = actvities1_1 ;
actvities1_1{length(actvities1_1)} = 'ALL';

machines1_1 = evalin('base','machines');
machines1_2 = machines1_1;
machines1_1{length(machines1_1)} = 'ALL';

% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.
% Subject One
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'SELECT ATHLETE','Tag','thletes2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.94 0.9 0.05]); %athlete button


uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','thletes2_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.88 0.4 0.05]); %old athlete button


c='!!!!!!! HELP !!!!!!';
c1='Select the athlete from the list provided. Use ALL option to select all';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','on', 'String',c, 'HorizontalAlignment', 'left','Tag','thletes2_b','Units', 'normal', 'Position', [0.55 0.88 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text', 'Visible','on','String',c1, 'HorizontalAlignment', 'left','Tag','thletes2_m','Units', 'normal', 'Position', [0.55 0.73 0.4 0.15]);

uicontrol('Parent', tab2,'Style', 'popup','String', athletes1_1 ,'Tag','hletes2_1',...
    'Units','normal','Visible','on','Position', [0.05 0.82 0.4 0.05],'BackgroundColor', 'green','Callback', @athlete_2); %old athlete drop-down


% ACTIVITY
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'ACTIVITY','Tag','urfaces2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.58 0.9 0.05]); %activity button


uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','urfaces2_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.52 0.4 0.05]); %old activity button


c='!!!!!!! HELP !!!!!!';
c1='Select the activity from the list provided. Use ALL option to select all';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','on', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces2_b','Units', 'normal', 'Position', [0.55 0.52 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text','Visible','on', 'String',c1, 'HorizontalAlignment', 'left','Tag','urfaces2_m','Units', 'normal', 'Position', [0.55 0.37 0.4 0.15]);

uicontrol('Parent', tab2,'Visible','on','Style', 'popup','String', actvities1_1,'Tag','rfaces2_1',...
    'Units','normal','Position', [0.05 0.46 0.4 0.05],'BackgroundColor', 'green','Callback', @activity_2); %athlete 1 drop-down

% MACHINE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String','MACHINE','Tag','hoes2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.24 0.9 0.05]); %athlete 1 button


uicontrol('Parent', tab2,'Style', 'popup','String', machines1_1,'Tag','oes2_1',...
    'Units','normal','Visible','on','Position', [0.05 0.18 0.4 0.05],'BackgroundColor', 'green','Callback', @machine_2);%machine 2 drop-down

c='!!!!!!! HELP !!!!!!';
c1='Select the machine from the list provided. Use ALL option to select all';
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String',c, 'HorizontalAlignment', 'left','Tag','hoes2_b','Units', 'normal', 'Position', [0.55 0.18 0.4 0.05]);
%
uicontrol('Parent', tab2, 'Style', 'text', 'String',c1, 'HorizontalAlignment', 'left','Tag','hoes2_m','Units', 'normal', 'Position', [0.55 0.07 0.4 0.11]);


% confirm and cancel
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'Confirm && Delete','Tag','readfile2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.01 0.4 0.04],'Callback',@readfile2); %athlete 1 button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'Cancel','Tag','cancel_file2','BackgroundColor', 'red', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.55 0.01 0.4 0.04],'Callback',@cancel_file); %athlete 1 button
% end
end
function readfile2(hObject,~)
% Callback to delete data
opts.Interpreter = 'tex';
opts.Default = 'No';
quest = 'Do you want to permanently delete the specified data?';
answer = questdlg(quest,'Confirm exit',...
    'Yes','No',opts);
if strcmp(answer,'No')
else
    modifydatabase2(hObject) % one for preexiting data
    [icondata,~] = imread('trees.tif');
    msgbox('Data sucessfully deleted in database','Delete Completed','custom',...
        icondata,summer);
    tg = get(hObject,'parent');
    tgP = get(tg ,'parent');
    tgPP = get(tgP  ,'parent');
    close(tgPP)
end

end

function modifydatabase2(hObject,~)
% Modify database, delete
machinen = evalin('base','athlete');

rem_sub_1 = evalin('base','rem_sub_1');
rem_surf_1 = evalin('base','rem_surf_1');
rem_machine_1 = evalin('base','rem_machine_1');

if strcmpi(rem_sub_1,'all')
    warndlg('Please delete one athlete at a time','Deletion Error');
    return
end

if strcmpi(rem_surf_1,'all')
    opts.Interpreter = 'tex';
    opts.Default = 'No';
    quest = 'This will delete all the actvities of the specified athlete. Do you want to continue?';
    answer = questdlg(quest,'Confirm exit',...
        'Yes','No',opts);
    if strcmp(answer,'No')
        return
    else
    end
end


try
    Sw = getfield(machinen,rem_sub_1); % try get athlete
    Sx = getfield(Sw,rem_surf_1);
    Sx = rmfield(Sx,rem_machine_1);
    Sw = setfield(Sw,rem_surf_1,Sx);
    machinen = setfield(machinen,rem_sub_1,Sw);
catch
    try
        Sw = getfield(machinen,rem_sub_1); % try get athlete
        Sw = rmfield(Sw,rem_surf_1);
        machinen = setfield(machinen,rem_sub_1,Sw);
    catch
        try
            machinen = rmfield(athlete,rem_sub_1);
        catch
        end
    end
end

assignin('base','athlete',machinen);
pathed = evalin('base','pathed');
save([strcat(pathed,'\machines.mat')],'machinen');

hf = findobj('Tag','Databasetab');
hf =hf(1);
athl = fieldnames(machinen); % get listed athletes
%% get athletes info for display
athletes = uppertolower(athl,1);
athletes{length(athletes)+1} ='ADD NEW ATHLETE';
assignin('base','athletes',athletes)
accessdatabase(hf);
Analyze();
end

function cancel_file(hObject,~)
tag1 = get(hObject,'Tag');
opts.Interpreter = 'tex';
opts.Default = 'No';
if  strcmp(tag1,'cancel_file2')
    quest = 'Do you want to stop deleting data and exit?';
else
    quest = 'Do you want to stop uploading data and exit?';
end
answer = questdlg(quest,'Confirm exit',...
    'Yes','No',opts);
if strcmp(answer,'No')
    return
else
    tg = get(hObject,'parent');
    tgP = get(tg ,'parent');
    tgPP = get(tgP  ,'parent');
    close(tgPP)
    
    try
        if  strcmp(tag1,'cancel_file2')
            evalin('base','clear rem_sub_1 rem_surf_1 rem_machine_1');
        else
            evalin('base','clear add_sub_1 add_surf_1 add_machine_1');
        end
    catch
    end
end

end

function athlete_2(hObject,~)
% Callback for athlete popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
its = lower(as{is}); % get the selected item


% get database
athlete = evalin('base','athlete');
% get ID to find details from the database structure
its(regexp(its,' '))='_';
elems = {'oes2_1','rfaces2_1','readfile2'};
assignin('base','rem_sub_1',its)
if is < length(as)
    surf_str = fieldnames(getfield(athlete,its));
    [data_out] = uppertolower(surf_str,1); % get string to display in activity buttons
    data_out{length(data_out)+1} ='ALL';
    hf=findobj('Tag','rfaces2_1');
    hf = hf(1);
    hf.String = data_out; % upsate string for actvities
else
    assignin('base','rem_machine_1',its)
    assignin('base','rem_surf_1',its)
end
hf=findobj('Tag','thletes2_m');
hf = hf(1);
hf.String = [as{is} ' SELECTED' ];

for i=1:length(elems)
    %find respective elements depending on the input
    hf=findobj('Tag',elems{i});
    hf = hf(1);
    hf.Visible='Off';
    if is < length(as) && i < length(elems)
        hf.Visible='On';
    end
    
    if i ==length(elems) && is == length(as)
        hf.Visible='On';
    end
end
end

function activity_2(hObject,~)
% Callback for machine activity menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');


its = lower(as{is}); % get the selected item
% get database
athlete = evalin('base','athlete');
its(regexp(its,' '))='_';

elems = {'oes2_1','readfile2'};
if is < length(as)
    try
        sub_i = evalin('base','rem_sub_1');
    catch
        warndlg('Please select an existing athlete first, no record found','Athlete Error');
        return
    end
    
    try
        machine_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        [data_out] = uppertolower(machine_str,1); % get string to display in activity buttons
        data_out{length(data_out)+1} ='ALL';
        hf=findobj('Tag','oes2_1');
        hf=hf(1);
        hf.String = data_out;
        
    catch
        
    end
else
    try
        sub_i = evalin('base','rem_sub_1');
        assignin('base','rem_machine_1',its)
    catch
        warndlg('Please select an existing athlete first, no record found','Athlete Error');
        return
    end
    
end
assignin('base','rem_surf_1',its)
hf=findobj('Tag','urfaces2_m');
hf = hf(1);
hf.String = [as{is} ' SELECTED' ];

for i=1:length(elems)
    %find respective elements depending on the input
    hf=findobj('Tag',elems{i});
    hf = hf(1);
    hf.Visible='Off';
    if is < length(as) && i < length(elems)
        hf.Visible='On';
    end
    
    if i ==length(elems) && is == length(as)
        hf.Visible='On';
    end
end
end

function machine_2(hObject,~)
% Callback for machine popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

its = lower(as{is}); % get the selected item
its(regexp(its,' '))='_';
% get database
athlete = evalin('base','athlete');
assignin('base','rem_machine_1',its);
% get ID to find details from the database structure
hf=findobj('Tag','readfile2');
hf = hf(1);
try
    sub_i = evalin('base','rem_sub_1'); % get subject 1
    surf_i = evalin('base','rem_surf_1');  % get activity
    its(regexp(its,' '))='_';
    hf.Visible = 'on';
catch
    warndlg('Please select an existing athlete and activity first, no record found','Selection Error');
    hf.Visible = 'off';
    return
end


hf=findobj('Tag','hoes2_m');
hf = hf(1);
hf.String = [as{is} ' SELECTED' ];
end

function [dat] = readfile(hObject,~)
paren_obj = get(hObject,'parent'); %tab
paren_obj_2 = get(paren_obj ,'parent'); % tabgroup
paren_obj_3 =  get(paren_obj_2 ,'parent'); % figure
try
    add_sub_1 = evalin('base','add_sub_1 ');
    add_surf_1 = evalin('base','add_surf_1');
    add_machine_1 = evalin('base','add_machine_1');
catch
    warndlg('Incorrect details entered for new data, please check and retry','Data Error');
    return
end

opts.Interpreter = 'tex';
opts.Default = 'NO';
quest = 'Is this a 2-PART file, press YES if true and NO if false. If YES, select the left part of the data at this stage.';
answer = questdlg(quest,'Specify if Data is in 2 files',...
    'YES','NO',opts);

if strcmp(answer,'YES')
    load_state =2;   
else
    load_state = 1; 
end

[filename,pathname] = uigetfile({'*.txt'},'File selector');
if isequal(filename,0)
    helpdlg('No data selected.',...
        'Operation cancelled');
else
    fullpathname = strcat(pathname,filename);
    assignin('base','fullfilepath',fullpathname);
    try
        
        if load_state ==2
            assignin('base','load_cond',1)
            [dath] = readdata(filename);
            opts.Interpreter = 'tex';
            opts.Default = 'OK';
            quest = 'LEFT Part of the data loaded, press OK to load RIGHT part.';
            answer = questdlg(quest,'Load Right Foot Data',...
                'OK','Cancel',opts);
            if strcmp(answer,'Cancel')
                warndlg('Operation cancelled successfuly','Quit Load Data');
                return
            else
                [filename,pathname] = uigetfile({'*.txt'},'File selector');
                if isequal(filename,0)
                helpdlg('No data selected.',...
                    'Operation cancelled');
            else
                fullpathname = strcat(pathname,filename);
                assignin('base','fullfilepath',fullpathname);
            end
            assignin('base','load_cond',2)
            [dat] = readdata(filename);
        end
    else
        [dat] = readdata(filename);
    end
    
     [~,ui] = size(dat);
     if ui>7
         warndlg('More number of factors than expected, please check and retry','Data Error');
     elseif ui<7
         warndlg('Few number of factors than expected, please check and retry','Data Error');
     else
         editdatatable(dat,paren_obj_3);
     end
     
     catch
         warndlg('Incorrect data type, please check and retry','Data Error');
end
end

end

function [data] = readdata(filename)
% filename = 'CMJ.txt';
opts = detectImportOptions(filename);
T = readtable(filename,opts);
VarName = T.Properties.VariableNames;
%%
[~,po] =size(T);
if po>10 || po == 18 || po==4  % get for faulty data

    cr =[];
    lo = [];
    ol1 = [];
    for m = 1:po
        try
            ind = isnan(table2array(T(:,m)));
            if sum(ind) > (length(ind)*0.5)
                cr = [cr,m];
            else
                lo = [lo,T(:,m)];
                ol1 = [ol1,ind];
            end
        catch
            cr = [cr,m];
        end
    end
    T0 = T;
    T0(:,cr) = [];
    ROD = table2array(T0);
    [~,to] = size(ROD);
    % get time
    time =[];
    for i = 1:to
        roda = ROD(:,i);
        rodo = ol1(:,i);
        conda = roda(rodo==0);
        rol  = round(diff(conda),1,'significant');
        if round(mean(rol)*1000) == round(rol(2)*1000) || round(mean(rol)*1000) == round(rol(end-1)*1000)
            time =[time,i];
        end
     
    end
    time = time(1);

    get_right = nanmean(ROD(:,time));
    RODg = ROD(:,time)>get_right; % get time values less than mean
    polu = find(RODg+~isnan(ROD(:,time))==0); % get na in time appearing early
    ROD(polu,:) = [];
    [~,q1] = size(ROD);
    if po ==4
        data = ROD;
        try
            load_cond = evalin('base','load_cond');
            if load_cond == 2
                data_o = evalin('base','temp_data');
                text = [data(:,1),data_o(:,1)];
                Text_1 = isnan(text);
                ccu_time = sum(Text_1 ,1)==0;
                accu_time = text(:,ccu_time(1));
                data = [accu_time,data_o(:,2:end),data(:,2:end)]; 
                data = fillmissing(data,'previous');
            else
                assignin('base','temp_data',data);
            end
        catch
            assignin('base','temp_data',data);
        end
    else
        if q1 == 14 && time ==1
            data = ROD(:,[1,2,4,6,8,10,12]);
        else
            oz = VarName;
            oz(cr) =[];
            data =ROD(:,time);
            for y = 1:q1
                if ~contains(oz(y),"Var")
                    data = [data,ROD(:,y)];
                end
                [~,ml] =size(data);
                if ml ==7
                    return
                end
            end
        end
        data = fillmissing(data,'previous');
    end  
else
    
    % Clear Extra Vars
    VarName = T.Properties.VariableNames;
    ext =[]; % extra padded variable
    Text =[]; % get time varibles
    for i=1:length(VarName)
        if strcmp(VarName{i}(1:5),'Extra')
            ext = [ext;i];
        elseif strcmpi(VarName{i}(1:4),'time')
            Text = [Text;i];
        end
    end
    T(:,ext)=[];
    
    % Missing values
    T0 = T(:,Text); % get time indices in data
    ind = isnan(table2array(T0));
    
    accu_time = sum(ind,1)==0;
    accu_time = Text(accu_time);
    
    num_vars = 1:1:length(T.Properties.VariableNames);
    not_time = setdiff(num_vars , Text);
    
    T_Filled = fillmissing(T,'previous');
    T_Data = [T_Filled(:,not_time),T_Filled(:,accu_time(1))];
    T_data = table2array(T_Data);
    var1 = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
    data = [T_data(:,end),T_data(:,1:end-1)];
end

end

function namenewthletes_1(hObject,~)
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
count = 0;

readbut=findobj('Tag','readfile');
readbut = readbut(1);
readbut.Visible ='off';

if strcmp(tag1,'hoes_n1') &&  ~isempty(as)
    count1 = 0;
    splitinp = split(as);
    for i=1:length(splitinp)
        if strcmpi(splitinp{i},'name') || strcmpi(splitinp{i},'enter')
            count1 = count1+1;
        end
    end
    
    if count1==0
        try
            sub2add = evalin('base','add_sub_1');
            surf2add = evalin('base','add_surf_1');
        catch
            warndlg('Please complete other required fields, incomplete form','Input Error');
            return
        end
        asc = lower(as);
        asc(regexp(asc,' '))='_';
        try
            athlete = evalin('base','athlete');
            machine_str = fieldnames(getfield(getfield(athlete,sub2add),surf2add));
            for i =1:length(machine_str)
                if strcmpi(machine_str{i},asc)
                    count = count+1;
                end
            end
            if count ==0
                readbut.Visible ='on';
                assignin('base','add_machine_1',asc);
            else
                warndlg('This machine already exists for this specified details','Machine Error');
            end
        catch
            readbut.Visible ='on';
            assignin('base','add_machine_1',asc);
        end
    else
        warndlg('Please input valid name, incorrect name encountered','Machine Error');
    end
    return
elseif strcmp(tag1,'hoes_n1') && isempty(as)
    warndlg('Please input valid name, incorrect name encountered','Machine Error');
    return
end


if ~isempty(as) && strcmp(tag1(end),'1') % First names
    hf=findobj('Tag',strcat(tag1(1:end-2),'m'));
    hf = hf(1);
    fh=findobj('Tag',strcat(tag1(1:end-1),'2'));
    fh = fh(1);
    count1 =0;
    splitinp = split(as);
    for i=1:length(splitinp)
        if strcmpi(splitinp{i},'name') || strcmpi(splitinp{i},'enter')
            count1 = count1+1;
        end
    end
    if count1==0
        if ~isempty(fh.String)
            splitinp = split(fh.String);
            for i=1:length(splitinp)
                if strcmpi(splitinp{i},'name') || strcmpi(splitinp{i},'enter')
                    count = count+1;
                end
            end
            if count==0
                hf.String = [upper(as) ' ' upper(fh.String) ' SPECIFIED' ];
            else
                hf.String = [upper(as) ' SPECIFIED' ];
            end
        else
            hf.String = [upper(as) ' SPECIFIED' ];
        end
    else
        warndlg('Please input first name, empty field encountered','Name Error');
        return
    end
elseif ~isempty(as) && strcmp(tag1(end),'2') % second names
    hf=findobj('Tag',strcat(tag1(1:end-2),'m'));
    hf = hf(1);
    fh=findobj('Tag',strcat(tag1(1:end-1),'1'));
    fh = fh(1);
    if isempty(fh)
        warndlg('Please input first name, empty field encountered','Name Error');
        return
    else
        splitinp = split(fh.String);
        for i=1:length(splitinp)
            if strcmpi(splitinp{i},'name') || strcmpi(splitinp{i},'enter')
                count = count+1;
            end
        end
        if count==0
            count1 =0;
            splitinp = split(as);
            for i=1:length(splitinp)
                if strcmpi(splitinp{i},'name') || strcmpi(splitinp{i},'enter')
                    count1 = count1+1;
                end
                if count1==0
                    hf.String = [upper(fh.String) ' ' upper(as) ' SPECIFIED' ];
                else
                    hf.String = [upper(fh.String) ' SPECIFIED' ];
                end
            end
            
        else
            warndlg('Please input first name, empty field encountered','Name Error');
            return
        end
    end
else
    warndlg('Please input first name, empty field encountered','Name Error');
    return
end


sub_str = hf.String;
sub_str =  sub_str(:,1:end-10);
sub_str(regexp(sub_str,' '))='_';
if strcmp(tag1(1),'t')
    assignin('base','add_sub_1',lower(sub_str));
elseif strcmp(tag1(1),'u')
    assignin('base','add_surf_1',lower(sub_str));
end


%elems ={'thletes_n1','thletes_n2','thletes_m','urfaces_n1','urfaces_n2','urfaces_m','hoes1_2','hoes_m'};

end

function newthletes_1(hObject,~)
% Callback for new data popup menu
tag1 = get(hObject,'Tag');
tag0=tag1;
tag0(end-2)=[];
if strcmp(tag1(end),'2') % new info button
    elems ={'1','b','m','n1','n2'};
    message=["Clear the spaces and type the new athlete's name.  Use the 'EXISTING' option if the athlete already exists." ];
    if strcmp(tag0(1),'u')
        message=["Clear the spaces and type the new activity's name.  See sample activity names using the 'EXISTING' option." ];
    end
    for i=1:length(elems)
        ob = strcat(tag0(1:end-1),elems{i}); %find respective elements depending on the input
        hf=findobj('Tag',ob);
        hf = hf(1);
        if i ==1
            hf.Visible='Off';
        else
            hf.Visible='On';
        end
        
        if i==2 ||i==3
            hf.Position(1) = 0.55;
            if i==3
                hf.String=message;
            end
        end
    end
    
    messag=["Clear the space and type the new machine's name. Common machine names are:    1. LOADSOL 2. KITSLER 3. IMU" ];
    
    hf=findobj('Tag','hoes_m');
    hf = hf(1);
    hf.String=messag;
    
elseif strcmp(tag1(end),'3') %old info button
    elems ={'1','b','m','n1','n2'};
    message=["Select existing athlete from the list provided.  Use the 'NEW' option if the athlete does not exist."];
    
    if strcmp(tag0(1),'u')
        try
            athlete = evalin('base','athlete');
            sub_i = evalin('base','add_sub_1');
            machine_str = getfield(athlete,sub_i);
            message=["Select existing activity from the list provided.  Use the 'NEW' option if the activity does not exist."];
        catch
            message=["No actvities found for specified athlete.  Select one of the common entries or use 'NEW' option if the desired activity does not exist."];
        end
    end
    
    for i=1:length(elems)
        ob = strcat(tag0(1:end-1),elems{i}); %find respective elements depending on the input
        hf=findobj('Tag',ob);
        hf = hf(1);
        if i >3
            hf.Visible='Off';
        else
            hf.Visible='On';
        end
        if i==2 ||i==3
            hf.Position(1) = 0.05;
            if i==3
                hf.String=message;
            end
        end
        
    end
end


end

function athlete_1(hObject,~)
% Callback for athlete popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');


if (~strcmp(tag1(end-2),'s')&& is == length(as))
    if strcmp('athlete_1',tag1) || strcmp('athlete_2',tag1)
        tgroup = evalin('base','tgroups');
        hf=findobj('Tag','Databasetab');
        hf = hf(1);
        tgroup.SelectedTab = hf;
        return
    end
    add_data_1(hObject);
    return
end
its = lower(as{is}); % get the selected item

% get database
athlete = evalin('base','athlete');
% get ID to find details from the database structure
its(regexp(its,' '))='_';
surf_str = fieldnames(getfield(athlete,its));
if strcmp(tag1(end-2),'1')
    assignin('base',strcat('sel_sub1_',tag1(end)),its)
    elems = {'actvities1_','activity1_'}; % ACTIVITY SELECTION BUTTONS
elseif strcmp(tag1(end-2),'s')
    assignin('base','add_sub_1',its)
    [data_out] = uppertolower(surf_str,1); % get string to display in activity buttons
    hf=findobj('Tag','urfaces_1');
    hf = hf(1);
    hf.String = data_out; % upsate string for actvities
    hf=findobj('Tag','thletes_m');
    hf = hf(1);
    hf.String = [as{is} ' SELECTED' ];
    return
else
    assignin('base',strcat('sel_sub_',tag1(end)),its)
    elems = {'actvities_','activity_'}; % ACTIVITY SELECTION BUTTONS
end

[data_out] = uppertolower(surf_str,1); % get string to display in activity buttons
data_out{length(data_out)+1} ='ADD NEW ACTIVITY';

% find and display them
for i=1:length(elems)
    ob = strcat(elems{i},tag1(end)); %find respective elements depending on the input
    hf=findobj('Tag',ob);
    hf = hf(1);
    hf.Visible='On';
    if i==2
        hf.String = data_out;
    end
end
end

function activity_1(hObject,~)
% Callback for machine activity menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

if (~strcmp(tag1(end-2),'s') && is == length(as))
    if strcmp('activity_1',tag1) || strcmp('activity_2',tag1)
        tgroup = evalin('base','tgroups');
        hf=findobj('Tag','Databasetab');
        hf = hf(1);
        tgroup.SelectedTab = hf;
        return
    end
    % add new
    add_data_1(hObject);
    try
        sub_i = evalin('base','sel_sub1_1');
        athlete = evalin('base','athlete');
        surf_str = fieldnames(getfield(athlete,sub_i));
        [data_out] = uppertolower(surf_str,1);
        hf = findobj('Tag','thletes_1'); % get athletes drop down
        hf = hf(1);
        
        fh = findobj('Tag','thletes1_3'); %get option of selecting existing
        fh = fh(1);
        
        asc = upper(sub_i); % get the selected subject and convert to the approriate format
        asc(regexp(asc,'_'))=' ';
        vf = findobj('Tag','athlete1_1');
        vf = vf(1);
        ind=find(ismember(vf.String,asc));
        
        assignin('base','n_actvities',data_out);
        assignin('base','add_sub_1',sub_i);
        
        hf.Value = ind;
        newthletes_1(fh); % call function to auto-select existing
        athlete_1(hf); % call function to select athlete
    catch
    end
    return
end
its = lower(as{is}); % get the selected item
% get database
athlete = evalin('base','athlete');
its(regexp(its,' '))='_';

if strcmp(tag1(end-2),'1') % for database display
    sub_i = evalin('base',strcat('sel_sub1_',tag1(end))); % get subject 1
    elems = {'machines1_','machine1_'}; % MACHINE SELECTION BUTTONS
    assignin('base',strcat('sel_surf1_',tag1(end)),its);
    
elseif strcmp(tag1(end-2),'s')
    
    try
        sub_i = evalin('base','add_sub_1');
    catch
        warndlg('Please select an existing athlete first, no record found','Athlete Error');
        return
    end
    
    try
        machine_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        [data_out] = uppertolower(machine_str,1); % get string to display in activity buttons
        hf=findobj('Tag','hoes_m');
        hf = hf(1);
        message='Clear the spaces and type the new machine name.  These machines already exist:';
        ro =[];
        for i =1:length(data_out)
            ro=[ro,'; ',data_out{i}];
        end
        message = [message,ro];
        hf.String = message;
    catch
        
    end
    assignin('base','add_surf_1',its)
    hf=findobj('Tag','urfaces_m');
    hf = hf(1);
    hf.String = [as{is} ' SELECTED' ];
    return
else
    % from main home machine selection
    sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
    elems = {'machines_','machine_'}; % MACHINE SELECTION BUTTONS
    assignin('base',strcat('sel_surf_',tag1(end)),its);
end

% get ID to find details from the database structure
machine_str = fieldnames(getfield(getfield(athlete,sub_i),its));
[data_out] = uppertolower(machine_str,1); % get string to display in machine buttons
data_out{length(data_out)+1} ='ADD NEW MACHINE';
% find and display them
for i=1:length(elems)
    ob = strcat(elems{i},tag1(end)); %find respective elements depending on the input
    hf=findobj('Tag',ob);
    hf = hf(1);
    hf.Visible='On';
    if i==2
        hf.String = data_out;
    end
end
end

function machine_1(hObject,~)
% Callback for machine popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

if is == length(as)
    if strcmp('machine_1',tag1) || strcmp('machine_2',tag1)
        tgroup = evalin('base','tgroups');
        hf=findobj('Tag','Databasetab');
        hf = hf(1);
        tgroup.SelectedTab = hf;
        return
    end
    add_data_1(hObject);
    try
        % get and auto display athlete
        sub_i = evalin('base','sel_sub1_1');
        athlete = evalin('base','athlete');
        surf_str = fieldnames(getfield(athlete,sub_i));
        [data_out] = uppertolower(surf_str,1);
        hf = findobj('Tag','thletes_1'); % get athletes drop down
        hf = hf(1);
        
        fh = findobj('Tag','thletes1_3'); %get option of selecting existing
        fh = fh(1);
        
        asc = upper(sub_i); % get the selected subject and convert to the approriate format
        asc(regexp(asc,'_'))=' ';
        vf = findobj('Tag','athlete1_1');
        vf = vf(1);
        ind=find(ismember(vf.String,asc));
        
        assignin('base','n_actvities',data_out);
        assignin('base','add_sub_1',sub_i);
        
        hf.Value = ind;
        newthletes_1(fh); % call function to auto-select existing
        athlete_1(hf); % call function to select athlete
        
        
        
        % get and auto display activity
        surf_i = evalin('base','sel_surf1_1');
        %machine_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        machine_str = fieldnames(getfield(getfield(athlete,sub_i),surf_i));
        [data_out] = uppertolower(machine_str,1);
        hf = findobj('Tag','urfaces_1'); % get athletes drop down
        hf = hf(1);
        
        fh = findobj('Tag','urfaces1_3'); %get option of selecting existing
        fh = fh(1);
        
        asc = upper(surf_i); % get the selected subject and convert to the approriate format
        asc(regexp(asc,'_'))=' ';
        vf = findobj('Tag','activity1_1');
        vf = vf(1);
        ind=find(ismember(vf.String,asc));
        
        assignin('base','n_machines',data_out);
        assignin('base','add_surf_1',surf_i);
        
        
        hf.Value = ind;
        newthletes_1(fh); % call function to auto-select existing
        activity_1(hf); % call function to select athlete
    catch
    end
    return
end
its = lower(as{is}); % get the selected item
% get database
athlete = evalin('base','athlete');

% get ID to find details from the database structure
if strcmp(tag1(end-2),'1')
    sub_i = evalin('base',strcat('sel_sub1_',tag1(end))); % get subject 1
    surf_i = evalin('base',strcat('sel_surf1_',tag1(end)));  % get activity
    its(regexp(its,' '))='_';
    machine_i = getfield(getfield(getfield(athlete,sub_i),surf_i),its);
    assignin('base',strcat('sel_machine1_',tag1(end)),its);
    assignin('base',strcat('dat_machine1_',tag1(end)),abs(machine_i.Data));
    plots_1(hObject,machine_i.Data)
    return
else
    sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
    surf_i = evalin('base',strcat('sel_surf_',tag1(end)));  % get activity
    its(regexp(its,' '))='_';
    machine_i = getfield(getfield(getfield(athlete,sub_i),surf_i),its);
    assignin('base',strcat('sel_machine_',tag1(end)),its);
    assignin('base',strcat('dat_machine_',tag1(end)),abs(machine_i.Data));
end

elems = {'confirm_','confirm_'}; % MACHINE CONFIRMATION BUTTONS
% find and display them
for i=1:length(elems)
    ob = strcat(elems{i},tag1(end)); %find respective elements depending on the input
    hf=findobj('Tag',ob);
    hf = hf(1);
    hf.Visible='On';
end
end

function plots_1(hObject,dat)
% Callback for variable popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
its = as{is};

elems = 'datapres1_';
hf=findobj('Tag',strcat(elems ,tag1(end)));
pan_1 = hf(1);
subplot(1,1,1,'Parent', pan_1) ;

% fetch correponding machine data
dat = dat(:,1:end-1);
% var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};


sel_machine_1=evalin('base',strcat('sel_machine_' ,tag1(end)));

if  contains(sel_machine_1,'load')
    var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
    var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
else
    var = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
end


% plot figure
for i=1:6
    subplot(3,2,i,'Parent', pan_1) ;
    plot(dat(:,i))
    [w,~] = size(dat);
    xlim([0 1.1*w])
    zoom on
    titl = [its ' ' var{i} ' PREVIEW'];
    title(titl)
end
pan_1.Visible = 'on';
end

function editdatatable(data,source_fig)
% Callback for data preview and edit
% hf = findobj('Tag','loadtab');
% hf = hf(1);
% hf = get(hf,'parent');
% hf = get(hf,'parent');
% hf.Visible='off';
if strcmp(source_fig.Name,'UPDATE DATABASE')
    % get headers for table
    add_sub_1 = evalin('base','add_sub_1 ');
    add_surf_1 = evalin('base','add_surf_1');
    add_machine_1 = evalin('base','add_machine_1');
    assignin('base','tablesource','UPDATE DATABASE')
    close(source_fig);
else
    ori_tag = evalin('base','original_tag'); % for machine 1 or 2
    add_sub_1 = evalin('base',strcat('sel_sub_',ori_tag));
    add_surf_1 = evalin('base',strcat('sel_surf_',ori_tag));
    add_machine_1 = evalin('base',strcat('sel_machine_',ori_tag));
    assignin('base','tablesource','MACHINE')
end

banner = [add_machine_1 ' DATA FOR ' add_surf_1 ' OF ' add_sub_1];
banner = upper(banner);
banner(regexp(banner,'_'))=' ';

if  contains(add_machine_1,'load')
    var1 = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
elseif ~contains(add_machine_1,'kit') && ~contains(add_machine_1,'imu')
    var1 = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
else
    var1 = {'TIME','LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
end

MainFigScale = .6;
[~,f] = getscreen( MainFigScale,'EDIT DATA');
tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'Edit table','BackgroundColor', 'blue');
tab1.Tag = 'tabletab';

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Delete rows','Tag','Deletecolrow', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.74  0.85 0.23 0.05]);

uicontrol('Parent', tab1, 'Style', 'edit', 'String', 'From row','Tag','Deletecolrow1', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.74  0.80 0.11 0.04],'Callback', @deletecolrow);

uicontrol('Parent', tab1, 'Style', 'edit', 'String', 'To row','Tag','Deletecolrow2', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.86  0.80 0.11 0.04],'Callback', @deletecolrow);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm','Tag','Deletecolrow3', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.74  0.74 0.23 0.05],'Callback', @deletecolrow);


uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Switch Columns (Variables)','Tag','switchcolrow', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.74  0.55 0.23 0.05]);


uicontrol('Parent', tab1, 'Style', 'popup', 'String', var1 ,'Tag','switchcolrow1', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.74  0.5 0.11 0.04],'Callback', @switchcolrow);

uicontrol('Parent', tab1, 'Style', 'popup', 'String', var1 ,'Tag','switchcolrow2', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.86  0.5 0.11 0.04],'Callback', @switchcolrow);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm','Tag','switchcolrow3', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.74  0.4 0.23 0.05],'Callback', @switchcolrow);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'OK-Continue >>>','Tag','confcontinue','BackgroundColor','green', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.74 0.05 0.23 0.07],'Callback', @saveediteddata);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Undo All Changes','Tag','confcancel','BackgroundColor','red', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Visible','off','Position', [0.74 0.15 0.23 0.05],'Callback', @cancediteddata);


uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', banner,'Tag','edittablebanner', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.03 0.91 0.94 0.05]);

as = uitable('Parent', tab1,'Units', 'normal','Position',[0.03 0.05 0.7 0.85],...
    'Visible','on','Tag','tabletabdata' );
as.Data = data;
as.ColumnName = var1;
assignin('base','original_data_loaded',data);
end

function cancediteddata(hObject,~)
% Callback for cancel/undo changes data edit
try
    data =  evalin('base','original_data_loaded');
    hf = findobj('Tag','tabletabdata');
    hf= hf(1);
    hf.Data = data;
    hObject.Visible = 'off';
catch
    warndlg('Operation unsuccessful, please retry','Undo Error');
end
end

function confirmz_1(hObject,~)
 
% Callback for FINAL confirmation button
ob_tab= get(hObject,'parent'); % GET PARENT TAB OF OBJECT
tgroup= get(ob_tab,'parent'); % GET TAB GROUP

% See if tab4 exits and close
tab4 = findobj('Title','PEAK PREVIEW');
if ~isempty(tab4)
    try
        
        try
            dat_machine_1 = evalin( 'base', 'dat_machine_1');
            dat_machine_2 = evalin( 'base', 'dat_machine_2');
            sel_var_1 = evalin( 'base', 'sel_var_1');
            sel_var_2 = evalin( 'base', 'sel_var_2');
            sel_surf_1 = evalin( 'base', 'sel_surf_1');
            sel_surf_2 = evalin( 'base', 'sel_surf_2');
            sel_sub_1 = evalin( 'base', 'sel_sub_1');
            sel_sub_2 = evalin( 'base', 'sel_sub_2');
            sel_machine_1 = evalin('base','sel_machine_1');
            sel_machine_2 = evalin('base','sel_machine_2');
            
            var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
            
            list_21 =var;
            sel_machine_1(regexp(sel_machine_1,'_'))=' ';
            sel_machine_2(regexp(sel_machine_2,'_'))=' ';
            
            sel_surf_1(regexp(sel_surf_1,'_'))=' ';
            sel_surf_1(regexp(sel_surf_1,'_'))=' ';
            
            sel_surf_2(regexp(sel_surf_2,'_'))=' ';
            sel_surf_2(regexp(sel_surf_2,'_'))=' ';
            
            sel_sub_2(regexp(sel_sub_2,'_'))=' ';
            sel_sub_1(regexp(sel_sub_1,'_'))=' ';
            
            FirstMachine=['ALL PEAKS OF ' list_21{sel_var_1} ' OF ' upper(sel_machine_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)];
            SecondMachine=['ALL PEAKS OF ' list_21{sel_var_2} ' OF ' upper(sel_machine_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)];
            
        catch
            warndlg('Incorrect selections made, please check and retry','Machine Selection Error');
            return
        end
        
        shud_1 = findobj('Tag','machine_data_prev1_1');
        shud_1 = shud_1(1);
        shud_1.String = FirstMachine;
        shud_2 = findobj('Tag','machine_data_prev2_1');
        shud_2 = shud_2(1);
        shud_2.String = SecondMachine;
    catch
    end
    tgroup.SelectedTab = tab4;
    ot = 'Select the factors for each machine';
    helpdlg(ot,'Factor/Sides Selection');
    return
end

try
    dat_machine_1 = evalin( 'base', 'dat_machine_1');
    dat_machine_2 = evalin( 'base', 'dat_machine_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_machine_1 = evalin('base','sel_machine_1');
    sel_machine_2 = evalin('base','sel_machine_2');
catch
    warndlg('Incorrect selections made, please check and retry','Machine Selection Error');
    return
end

tab4 = uitab('Parent', tgroup, 'Title', 'PEAK PREVIEW','BackgroundColor', 'c');
var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};

if  contains(sel_machine_1,'load')
    var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
elseif ~contains(sel_machine_1,'kit') && ~contains(sel_machine_1,'imu')
    var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
else
    var = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
end

if  contains(sel_machine_2,'load')
    var_k = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
elseif ~contains(sel_machine_2,'kit') && ~contains(sel_machine_2,'imu')
    var_k = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
else
    var_k = {'LEFT X','LEFT Y','LEFT Z','RIGHT X','RIGHT Y','RIGHT Z'};
end

% Spikes
list_5 ={};
num_peaks_1= 15;
num_peaks_2= 15;
for i=1:num_peaks_1
    list_5{i} = num2str(i);
end
list_5{num_peaks_1+1} = 'All';


list_21 =var;
list_21_k =var_k;
sel_machine_1(regexp(sel_machine_1,'_'))=' ';
sel_machine_2(regexp(sel_machine_2,'_'))=' ';

sel_surf_1(regexp(sel_surf_1,'_'))=' ';
sel_surf_1(regexp(sel_surf_1,'_'))=' ';

sel_surf_2(regexp(sel_surf_2,'_'))=' ';
sel_surf_2(regexp(sel_surf_2,'_'))=' ';

sel_sub_2(regexp(sel_sub_2,'_'))=' ';
sel_sub_1(regexp(sel_sub_1,'_'))=' ';

FirstMachine=['ALL PEAKS OF ' list_21{sel_var_1} ' OF ' upper(sel_machine_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)];
SecondMachine=['ALL PEAKS OF ' list_21_k{sel_var_2} ' OF ' upper(sel_machine_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)];

assignin('base','FirstMachine',[list_21{sel_var_1} ' OF ' upper(sel_machine_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)]);
assignin('base','SecondMachine',[list_21_k{sel_var_2} ' OF ' upper(sel_machine_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)]);
% Create and populate tab

% Variable One
dat = [dat_machine_1(:,end),dat_machine_1(:,1:end-1)];


uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', FirstMachine,'Tag','machine_data_prev1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.94 0.96 0.03]);%machine 1 variable  preview of peaks button


 uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Modify Peak','Tag','variables1_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.89 0.1 0.04]);

d1 =  uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables1_6',...
    'Units','normal','Position', [0.02 0.85 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeaker);


uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm','Tag','variables1_9', ...
    'HorizontalAlignment', 'left','Visible','on', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.56 0.1 0.04],'Callback', @selectpeakered);



pan_1 = uipanel('Parent',tab4,'Tag','datapre1_1','Position',[0.15 0.56 0.83 0.37],'Visible','on'); % machine 1 preview figure
% pan1_1 = uipanel('Parent',tab4,'Tag','datapre1_2','Position',[0.02 0.54  0.45 0.37],'Visible','on'); % machine 1 preview figure
% subplot(1,1,1,'Parent', pan_1) ;
% plot(dat(:,2))
% [w,~] = size(dat);
% xlim([0 1.1*w])
% zoom on
% 
% titl = ['SELECTED ' var{1} ' PREVIEW'];
% title(titl)

% subplot(1,1,1,'Parent', pan1_1) ;
% plot(dat(:,2))
% [w,~] = size(dat);
% xlim([0 1.1*w])
% zoom on

% Variable Two
dat = [dat_machine_2(:,end),dat_machine_2(:,1:end-1)];
uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', SecondMachine,'Tag','machine_data_prev2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.49 0.96 0.03]); %machine 2 variable  preview of peaks button

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Modify Peak','Tag','variables2_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.44 0.1 0.04]);  %machine 1 variable  selection of peaks button

d2 = uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables2_6',...
    'Units','normal','Position', [0.02 0.4 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeaker); % %machine 2 variable  selection of peaks pop-up

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm','Tag','variables2_9', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','on','BackgroundColor', 'green','Position', [0.02 0.11 0.1 0.04],'Callback', @selectpeakered); %confim spikes and peaks selection button for 2


pan_2 = uipanel('Parent',tab4,'Tag','datapre2_1','Position',[0.15 0.11 0.83 0.37],'Visible','on'); % all peaks preview
% pan1_2 = uipanel('Parent',tab4,'Tag','datapre2_2','Position',[0.51 0.54  0.45 0.37],'Visible','on'); % spefics preview for peaks and spikes

% subplot(1,1,1,'Parent', pan_2) ;
% plot(dat(:,2))
% [w,~] = size(dat);
% xlim([0 1.1*w])
% zoom on


% titl = ['SELECTED ' var{1} ' PREVIEW'];
% title(titl)

% subplot(1,1,1,'Parent', pan1_2) ;
% plot(dat(:,2))
% [w,~] = size(dat);
% xlim([0 1.1*w])
% zoom on

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm && View Results >>>','Tag','done1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','on','BackgroundColor', 'green','Position', [0.02 0.02 0.96 0.04],'Callback', @confgotofinal); %variable 1 button

tgroup.SelectedTab = tab4;

% ot = 'Select the factors for each machine';
% helpdlg(ot,'Factor/Sides Selection');
elems = [];%a2,a3,a4,a5,a6,a7,a8,a9,a10,a11];
assignin('base','sel_peak_1',1);
assignin('base','sel_peak_2',1);
assignin('base','lim_graph',1);

data_ind =evalin('base','dat_machine_1(:,sel_var_1)');
timer =evalin('base','dat_machine_1(:,end)');
pe_modi = 1;
[region,region_1,region_2,region_3,region_4,bor,region_5] =  metch_data(data_ind,timer,1);
assignin('base',strcat('region_',num2str(pe_modi)),region );
assignin('base',strcat('region_1_',num2str(pe_modi)),region_1 );
assignin('base',strcat('region_2_',num2str(pe_modi)),region_2 );
assignin('base',strcat('region_3_',num2str(pe_modi)),region_3 );
assignin('base',strcat('region_4_',num2str(pe_modi)),region_4 );
assignin('base',strcat('region_5_',num2str(pe_modi)),region_5 );
assignin('base',strcat('bor_',num2str(pe_modi)),bor);
plot_rda(data_ind,timer,pan_1,'datapre1_1');


list_5 ={};
num_peaks_1= length(region);
for i=1:num_peaks_1
    list_5{i} = num2str(i);
end
d1.String = list_5;


data_ind =evalin('base','dat_machine_2(:,sel_var_2)');
timer =evalin('base','dat_machine_2(:,end)');
pe_modi = 2;
[region,region_1,region_2,region_3,region_4,bor,region_5] =  metch_data(data_ind,timer,2);
assignin('base',strcat('region_',num2str(pe_modi)),region );
assignin('base',strcat('region_1_',num2str(pe_modi)),region_1 );
assignin('base',strcat('region_2_',num2str(pe_modi)),region_2 );
assignin('base',strcat('region_3_',num2str(pe_modi)),region_3 );
assignin('base',strcat('region_4_',num2str(pe_modi)),region_4 );
assignin('base',strcat('region_5_',num2str(pe_modi)),region_5 );
assignin('base',strcat('bor_',num2str(pe_modi)),bor);
plot_rda(data_ind,timer,pan_2,'datapre2_1'); 

list_5 ={};
num_peaks_1= length(region);
for i=1:num_peaks_1
    list_5{i} = num2str(i);
end
d2.String = list_5;
end

function confirm1_1(hObject,~)
tag1 = get(hObject,'Tag');
try
    dat_machine_1 = evalin('base', 'dat_machine_1');
    dat_machine_2 = evalin('base', 'dat_machine_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_machine_1 = evalin('base','sel_machine_1');
    sel_machine_2 = evalin('base','sel_machine_2');
catch
    warndlg('Incorrect selections made, please check and retry','Machine Selection Error');
    return
end

if strcmp('cfirm1_1',tag1) 
    % Automatic
    confirmz_1(hObject);
    hObject.Visible = 'on';    
elseif  strcmp('cfirm1_2',tag1)
    % lim_day, 3 = do all, 0 = do none, 1 = do one, 2 do for sub two
    % semi-auto 
    lim_day = evalin('base','lim_day');
    if lim_day  == 2
        assignin('base','pe_modi',2);
    else
        assignin('base','pe_modi',1);
    end
     peakseditor();
else
    assignin('base','lim_day',3);
    assignin('base','pe_modi',1);
    peakseditor();
    hObject.Visible = 'off';
end

return
try
    doo = evalin('base','operation_mode');
    if doo == 2 % manual mode
       peakseditor();
       hObject.Visible = 'off';
    else
       confirmz_1(hObject);
       hObject.Visible = 'on';
    end
catch
    confirmz_1(hObject);
    hObject.Visible = 'on';
end
end

function  peakseditor(~)
% Callback for editing lines on graph 
MainFigScale = .7;
% 
mouseDown = false;
assignin('base','mouseDown',mouseDown)
Name = 'PEAK SPECIFICATIONS';

SC = get(0, 'ScreenSize');
MaxMonitorX = SC(3)/1;
MaxMonitorY = SC(4)/1;

MaxWindowX = round(MaxMonitorX*MainFigScale);
MaxWindowY = round(MaxMonitorY*MainFigScale);
XBorder = (MaxMonitorX-MaxWindowX)/2;
YBorder = (MaxMonitorY-MaxWindowY)/2;       
White = [1  1  1]; 
% White - Selected tab color
f = figure(...
    'Units', 'pixels',...
    'Toolbar', 'figure',...
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'on',...
    'Color', White ,'windowstyle', 'normal','WindowButtonUpFcn',@logo,'WindowButtonMotionFcn', @logos);

tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'PEAKS','BackgroundColor', 'c');

tab1.Tag = 'cethodstab';

 try
     pe_modi = evalin('base','pe_modi');
 catch
     pe_modi  = 1;
     assignin('base','pe_modi', pe_modi);
 end
 
 try
    sel_done_1 = evalin('base',strcat('sel_done_',num2str(pe_modi)));
    la1 = sel_done_1;
catch
    assignin('base',strcat('sel_done_',num2str(pe_modi)),1);
    la1 = 1;
 end

 if pe_modi ==1
     labe = 'First';
     x = evalin('base','dat_machine_1(:,sel_var_1)');
     timer = evalin('base','dat_machine_1(:,end)');
     la2 = evalin('base','sel_pera_1');
 else
     labe = 'Second';
     x = evalin('base','dat_machine_2(:,sel_var_2)');
     timer = evalin('base','dat_machine_2(:,end)');
     la2 = evalin('base','sel_pera_2');
 end
 
 xLimMode = 'auto';
 assignin('base','xLimMode',xLimMode)
 vLineX  = round(length(x)/4);
 x(vLineX);
 
lab0 = ['Peak Setting For ', labe, ' Subject'];
 
lab1 = ['Current Setting for Peak ' num2str(la1 )];

lab2 = ['Total Number of Peaks = ' num2str(la2)];

lab3 = ['First ' num2str(la1-1) ' Peaks Already Set'];
 
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', lab0,'Tag','zuhletes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.94 0.85 0.04]); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', lab1,'Tag','zuhletes_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.88 0.88 0.11 0.05]); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', lab2,'Tag','zuhletes_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.88 0.78 0.11 0.05]); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', lab3,'Tag','zuhletes_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.88 0.68 0.11 0.05]); %athlete 1 button

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm && Preview','Tag','zuhletes_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.88 0.28 0.11 0.05],'Callback',@confppeaks); %athlete 1 button

 ax = axes ( 'parent', tab1, 'position', [0.04 0.06 0.83, 0.87], 'nextplot', 'add' );
 
 plot ( ax, x ,'b-','LineWidth',1 );
 assignin('base','x',x);
 assignin('base','timer',timer);
 ylim = get(ax,'ylim');
 xlim = get(ax,'xlim');
 vLineX2 = round(length(x)/1.5); %randi(length(x));
 vLineX3 = round(length(x)/3); %randi(length(x));
 fr = plot(ax,[x(vLineX3) x(vLineX3)],ylim,'LineStyle','-.','LineWidth',1.5 ,'ButtonDownFcn',@lineCallback );
 fr.Color = [0.8 0.8 0];
 cr = plot(ax,[x(vLineX) x(vLineX)],ylim,'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback );
 cr.Color = 'green';
 colo = cr.Color;
 assignin('base','colo',colo)
 cr1 = plot(ax,[x(vLineX2) x(vLineX2)],ylim,'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback );
 cr1.Color =  'red';
 %cr1.Color
 bh = plot(ax,xlim,[x(vLineX3) x(vLineX3)],'LineStyle','-.','LineWidth',1.5 ,'ButtonDownFcn',@lineCallback2 );
 bh.Color = 'blue';
 
 gh = plot(ax,xlim,[x(vLineX) x(vLineX)],'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback2 );
 gh.Color = 'black';
 %gh.Color
 gh1 = plot(ax,xlim,[x(vLineX2) x(vLineX2)],'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback2 );
 gh1.Color = 'magenta';
end

function [xLimMode] = lineCallback(src,~)
   %src.Color = rand(1,3);
   ax = get(src,'parent');
   xLimMode = get ( ax, 'xlimMode' );
   set ( ax, 'xlimMode', 'manual' );
   mouseDown = true;
   assignin('base','mouseDown',mouseDown);
   assignin('base','colo',src.Color);
end

function [xLimMode] = lineCallback2(src,~)
   %src.Color = rand(1,3);
   ax = get(src,'parent');
   xLimMode = get ( ax, 'ylimMode' );
   set ( ax, 'ylimMode', 'manual' );
   mouseDown = true;
   assignin('base','mouseDown',mouseDown);
   assignin('base','colo',src.Color);
%    src.YData = [1,5,7,8,9,11];
  %src
end

function logose(src,~)
   %src; % callback for small squares when editing th eplots  
   ax = get(src,'children');
%    x =  evalin('base','x');
   po = get(ax,'children');
   try
       ax = get(po{1},'children');
   catch
       ax = get(po(1),'children');
   end
   ax = ax(end);
   po = get (ax,'children');
   mouseDown = evalin('base','mouseDown');
   colo = evalin('base','colo');
  
  if colo(1) == 0 && colo(2) == 0 && colo(3) == 0
      %       % one for third(last),black, get values above this as values for
      % start of peak
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(3),'XData',cp(1,1));
          set(po(3),'YData',cp(2,2));
          assignin('base','B_start', round(cp(1,1)));
   
      end
  elseif colo(1) == 1 && colo(2) == 0 && colo(3) == 0
      %       % one for SECOND, red
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(2),'XData',cp(1,1));
          set(po(2),'YData',cp(2,2));
          assignin('base','B_end', round(cp(1,1)));
   
      end
  else
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(1),'XData',cp(1,1));
          set(po(1),'YData',cp(2,2));
          assignin('base','B_point', round(cp(1,1)));
      end   
  end
  %
end

function logos(src,~)
% Update position of children of figure
   ax = get(src,'children');
%    x =  evalin('base','x');
   po = get(ax,'children');
   try
       ax = get(po{1},'children');
   catch
       ax = get(po(1),'children');
   end
   ax = ax(end);
   po = get (ax,'children');
   mouseDown = evalin('base','mouseDown');
  
  uf = [0 1 0];
  colo = evalin('base','colo');
  if colo(1) == uf(1) && colo(2) == uf(2) && colo(3) == uf(3)
      %       % one for fourth(last),green, get values above this as values for
      % start of peak
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(5),'XData',[cp(1,1) cp(1,1)]);
          assignin('base','p_start', round(cp(1,1)));
      end
  elseif colo(1) == 1 && colo(2) == 0 && colo(3) == 0
        %       % one for before fourth(last),red, get values above this as values for
      % end of peak
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(4),'XData',[cp(1,1) cp(1,1)]);
          assignin('base','p_end', round(cp(1,1)));
      end
  elseif colo(1) == 0.8 && colo(2) == 0.8 && colo(3) == 0  % dashed yellow far right
      
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(6),'XData',[cp(1,1) cp(1,1)]);
          assignin('base','p_endh', round(cp(1,1)));
      end
      
  elseif colo(1) == 0 && colo(2) == 0 && colo(3) == 1 % blue
      
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(3),'YData',[cp(2,2) cp(2,2)]);
          assignin('base','i_endh', round(cp(2,2)));
      end
      
  elseif colo(1) == 0 && colo(2) == 0 && colo(3) == 0
      % one for second to last, black, get values above this as values for
      % peaks
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(2),'YData',[cp(2,2) cp(2,2)]);
          assignin('base','i_end', round(cp(2,2)));
      end
  else
      % one for last, magenta, get values above this as peaks
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(1),'YData',[cp(2,2) cp(2,2)]);
          assignin('base','i_start', round(cp(2,2)));
      end
  end
  
end

function logo(src,~)
ax = get(src,'children');
po = get(ax,'children');
try
    ax = get(po{1},'children');
catch
    ax = get(po(1),'children');
end
ax = ax(end);
% po = get (ax,'children');
xLimMode  = evalin('base','xLimMode');
set ( ax, 'xlimMode', xLimMode );
mouseDown = false;
assignin('base','mouseDown',mouseDown);
end

function confppeaks(hObject,~)
% Confirm position of movements on figure

try
    pe_modi = evalin('base','pe_modi');
catch
    pe_modi  = 1;
    assignin('base','pe_modi', pe_modi);
end

try
    sel_pera_1 = evalin('base',strcat('sel_pera_',num2str(pe_modi)));
catch
    warndlg('Number of Peaks Not Set.','Peak Specification Error');
    return
end

try
    sel_done_1 = evalin('base',strcat('sel_done_',num2str(pe_modi)));
catch
    sel_done_1 = 1;
   assignin('base',strcat('sel_done_',num2str(pe_modi)),sel_done_1 );
end

try
    i_end =  evalin('base','i_end');
    i_start =  evalin('base','i_start');
    p_end = evalin('base','p_end');
    p_start =  evalin('base','p_start');
    i_endh = evalin('base','i_endh');
    p_endh = evalin('base','p_endh');
catch
    warndlg('Please adjust the boundaries and ensure that the Red is to the right of the green line and Black line is below cyan line','Boundary Specification Error');
    return 
end

if ((i_end < i_endh) && (i_endh< i_start)) &&  ((p_endh>p_end) && (p_end > p_start))
    if sel_done_1 ==1
        nate_e = {};
    else
        nate_e  = evalin('base',strcat('peaks_cell_',num2str(pe_modi)));
    end
    nate_e(sel_done_1) = {[ i_end,i_endh,i_start,p_start,p_end,p_endh]};
    assignin('base',strcat('peaks_cell_',num2str(pe_modi)),nate_e);
    hf = findobj('Title', 'PEAKS');
    hf = hf(1);
    gf = get(hf,'parent');
    gf1 = get(gf,'parent');
    gf1.Visible = 'off';  
    %% go on
else
    warndlg('Red line must be to the right of the green line, and Dashed-yellow line must be to the right of the red line. Black line must be below Dashed-blue line, and Dashed-blue line must be above cyan line','Boundary Specification Error');
    return
end
 
% call figure to select other peaks
assignin('base',strcat('sel_done_',num2str(pe_modi)),sel_done_1+1);
timer = evalin('base','timer');
data_ind = evalin('base','x');

MainFigScale = .7;
Name = 'PEAK SPECIFICATION';

SC = get(0, 'ScreenSize');
MaxMonitorX = SC(3)/1;
MaxMonitorY = SC(4)/1;

MaxWindowX = round(MaxMonitorX*MainFigScale);
MaxWindowY = round(MaxMonitorY*MainFigScale);
XBorder = (MaxMonitorX-MaxWindowX)/2;
YBorder = (MaxMonitorY-MaxWindowY)/2;
White = [1  1  1];
% White - Selected tab color
f = figure(...
    'Units', 'pixels',...
    'Toolbar', 'figure',...
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'on',...
    'Color', White );

tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'PREVIEW OF SPECIFIED PEAKS','BackgroundColor', 'c');
[region,region_1,region_2,region_3,region_4,bor,region_5] =  metch_data(data_ind,timer,pe_modi);
assignin('base',strcat('region_',num2str(pe_modi)),region );
assignin('base',strcat('region_1_',num2str(pe_modi)),region_1 );
assignin('base',strcat('region_2_',num2str(pe_modi)),region_2 );
assignin('base',strcat('region_3_',num2str(pe_modi)),region_3 );
assignin('base',strcat('region_4_',num2str(pe_modi)),region_4 );
assignin('base',strcat('region_5_',num2str(pe_modi)),region_5 );
assignin('base',strcat('bor_',num2str(pe_modi)),bor);
plot_reada(data_ind,region,region_1,region_2,region_3,region_4,bor,tab1,region_5)
end
% Previw specified peaks, provide option to cancel or confirm
function plot_reada(data_ind,region,region_1,region_2,region_3,region_4,bor,tab1,region_5)

ax = axes ( 'parent', tab1, 'position', [0.03 0.05 0.87 0.93]);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'OK-Continue >>>','Tag','yuhletes_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.93 0.08 0.05],'BackgroundColor', 'green','Callback',@confp_done); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'NO-Retry >>>','Tag','yuhletes_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.05 0.08 0.05],'BackgroundColor', 'red','Callback',@denyp_done); %athlete 1 button

for i = 1:length(region)
    if i == 1
         plot(data_ind,'b-');
    end
    hold on
    plot(data_ind,'p','MarkerIndices',region{i} ,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',3);
    hold on
    plot(data_ind,'s','MarkerIndices',region_1{i} ,'MarkerEdgeColor','black','MarkerFaceColor','black','MarkerSize',4);
    hold on
    plot(data_ind,'d','MarkerIndices',region_5{i} ,'MarkerEdgeColor','black','MarkerFaceColor','g','MarkerSize',0.7);
    hold on
    plot(data_ind,'p','MarkerIndices',region_2{i},'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',4);
    hold on
    plot(region_3{i}(1),region_3{i}(2),'r*')
    hold on
    plot(region_4{i}(1),region_4{i}(2),'r*')
    hold on
    plot(data_ind,'p','MarkerIndices',bor{i} ,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',4);
    hold on
end
end

function confp_done(hObject,~)
% confirm that previewed edit is fine
bd = gcf;
close(bd);

hf = findobj('Title', 'PEAKS');
hf = hf(1);
gf = get(hf,'parent');
gf1 = get(gf,'parent');
close(gf1);


pe_modi = evalin('base','pe_modi');
sel_done = evalin('base',strcat('sel_done_',num2str(pe_modi)));
sel_pera = evalin('base',strcat('sel_pera_',num2str(pe_modi)));
lim_day = evalin('base','lim_day');


if (sel_done-1) < sel_pera
     peakseditor;   
else
    if lim_day == 1 && pe_modi == 1
        % do for sub 1, 2 fixed already
        opts.Interpreter = 'tex';
        opts.Default = 'Continue';
        quest = 'Peaks Specification Done For All Subjects';
        answer = questdlg(quest,'All Peaks Specifications Done',...
            'Continue',opts);
        if strcmp(answer,'Continue')   
            evalin('base', 'clear pe_modi sel_done_2 sel_done_1');
            assignin('base','prototype',1);
            assignin('base','sototype',2);
            obd = findobj('Tag','cfirm1_1');
            hob = obd(1);
            hob.Visible = 'on';
            confirmz_1(hob);
        end
   
    elseif pe_modi == 1 && lim_day ==3
        opts.Interpreter = 'tex';
        opts.Default = 'Continue';
        quest = 'Peaks Specification Done First Subject, Continue To Specify Peaks For Next Subject';
        answer = questdlg(quest,'Second Subect Peaks Specification',...
            'Continue',opts);
        if strcmp(answer,'Continue')
            %[colo,mouseDown,xLimMode,timer,x]  = peakseditor;
            assignin('base','pe_modi', 2);
            data = evalin('base','dat_machine_2(:,sel_var_2)');
            peakseditor(data);
        end
    else
        opts.Interpreter = 'tex';
        opts.Default = 'Continue';
        quest = 'Peaks Specification Done For All Subjects';
        answer = questdlg(quest,'All Peaks Specifications Done',...
            'Continue',opts);
        if strcmp(answer,'Continue')   
            evalin('base', 'clear pe_modi sel_done_2 sel_done_1');
            assignin('base','prototype',1);
            assignin('base','sototype',2);
            obd = findobj('Tag','cfirm1_1');
            hob = obd(1);
            hob.Visible = 'on';
            confirmz_1(hob);
        end
    end
end
end

function denyp_done(hObject,~)
% Reject that previewed edit is fine
bd = gcf;
close(bd);

hf = findobj('Title', 'PEAKS');
hf = hf(1);
gf = get(hf,'parent');
gf1 = get(gf,'parent');
gf1.Visible = 'on';

pe_modi = evalin('base','pe_modi');
sel_done = evalin('base',strcat('sel_done_',num2str(pe_modi)));
sel_peak = evalin('base',strcat('peaks_cell_',num2str(pe_modi)));
sel_peak(end) =[];
assignin('base',strcat('sel_done_',num2str(pe_modi)),sel_done-1);
assignin('base',strcat('peaks_cell_',num2str(pe_modi)),sel_peak);
end

function plot_rda(data_ind,timer,tab1,tag1)
% display result son peak preview
children = get(tab1, 'children');
delete(children);
cd = subplot(1,1,1,'parent',tab1);
cd.Position = [0.05,0.1,0.93,0.84];
region = evalin('base',strcat('region_',tag1(end-2)));
region_1 = evalin('base',strcat('region_1_',tag1(end-2)));
region_2 = evalin('base',strcat('region_2_',tag1(end-2)));
region_3 = evalin('base',strcat('region_3_',tag1(end-2)));
region_4 = evalin('base',strcat('region_4_',tag1(end-2)));
region_5 = evalin('base',strcat('region_5_',tag1(end-2)));
bor = evalin('base',strcat('bor_',tag1(end-2)));

ind_ts =[];
plot(data_ind,'b-');
hold on
for i = 1:length(region)   
    hold on
    plot(data_ind,'p','MarkerIndices',region{i} ,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',3);
    hold on
    plot(data_ind,'s','MarkerIndices',region_1{i} ,'MarkerEdgeColor','black','MarkerFaceColor','black','MarkerSize',4);
    hold on
    plot(data_ind,'d','MarkerIndices',region_5{i} ,'MarkerEdgeColor','black','MarkerFaceColor','g','MarkerSize',0.7);
    hold on
    plot(data_ind,'p','MarkerIndices',region_2{i},'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',4);
    hold on
    plot(region_3{i}(1),region_3{i}(2),'r*')
    hold on
    plot(region_4{i}(1),region_4{i}(2),'r*')
    hold on
    plot(data_ind,'p','MarkerIndices',bor{i} ,'MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',5);
    hold on
    ind_ts = [ind_ts;region{i}(end);bor{i}];
end


make_tick ={};
for i = 1:length(ind_ts)
    make_tick{i} = timer(ind_ts(i));
end
set(cd,'XTick',ind_ts,'XTickLabel',make_tick,'fontsize',7)
end
%%
function selectpeaker(hObject,~)
% selected peak callback

tag1 = get(hObject,'Tag');
% as = get(hObject,'String');
is = get(hObject,'Value');
assignin('base',strcat('sel_peak_',tag1(end-2)),is);
assignin('base','curlim',tag1(end-2));
end

function selectpeakered(hObject,~)
% confirm action to update spots on peak

tag1 = get(hObject,'Tag');

if strcmp(tag1(end-2),'1')
    no1 = findobj('Tag','datapre1_1');
    tab1 = no1(1);
else
    no1 = findobj('Tag','datapre2_1');
    tab1 = no1(1);
end

sp = evalin('base',strcat('sel_peak_',tag1(end-2)));
regio = evalin('base',strcat('region_',tag1(end-2)));
regio1 = evalin('base',strcat('region_1_',tag1(end-2)));
regio2 = evalin('base',strcat('region_2_',tag1(end-2)));
regio3 = evalin('base',strcat('region_3_',tag1(end-2)));
regio4 = evalin('base',strcat('region_4_',tag1(end-2)));
regio5 = evalin('base',strcat('region_5_',tag1(end-2)));
bo = evalin('base',strcat('bor_',tag1(end-2)));


region = regio{sp};
region_1 = regio1{sp};
region_2 = regio2{sp};
region_3 = regio3{sp};
region_4 = regio4{sp};
region_5 = regio5{sp};
bor = bo{sp};

per  = evalin('base',strcat('dat_machine_',tag1(end-2)));
sel_var_1 = evalin('base',strcat('sel_var_',tag1(end-2)));
data_ind =  per(:,sel_var_1);

% provide interface to move buttons
plot_readarr(data_ind,region,region_1,region_2,region_3,region_4,bor,tab1,region_5)

end

function confgotofinal(hObject,~)
% See if tab5 exits and close

ob_tab= get(hObject,'parent'); % GET PARENT TAB OF OBJECT
tgroup= get(ob_tab,'parent'); % GET TAB GROUP

tab5 = findobj('Title','RESULTS');
if ~isempty(tab5)
    delete(tab5);
end


try
    dat_machine_1 = evalin( 'base', 'dat_machine_1');
    dat_machine_2 = evalin( 'base', 'dat_machine_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_machine_1 = evalin('base','sel_machine_1');
    sel_machine_2 = evalin('base','sel_machine_2');
      
    pe_modi = 1;
    region_1 = evalin('base',strcat('region_',num2str(pe_modi)));
    region_1_1 = evalin('base',strcat('region_1_',num2str(pe_modi)));
    region_2_1 = evalin('base',strcat('region_2_',num2str(pe_modi)));
    region_3_1 = evalin('base',strcat('region_3_',num2str(pe_modi)));
    region_4_1 = evalin('base',strcat('region_4_',num2str(pe_modi)));
    bor_1 = evalin('base',strcat('bor_',num2str(pe_modi)));    
    tag1 = 'po2_r';
    region_2 = evalin('base',strcat('region_',tag1(end-2)));
    region_1_2 = evalin('base',strcat('region_1_',tag1(end-2)));
    region_2_2= evalin('base',strcat('region_2_',tag1(end-2)));
    region_3_2 = evalin('base',strcat('region_3_',tag1(end-2)));
    region_4_2 = evalin('base',strcat('region_4_',tag1(end-2)));
    bor_2 = evalin('base',strcat('bor_',tag1(end-2)));

    
catch
    warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
    return
end

tab5 = uitab('Parent', tgroup, 'Title', 'RESULTS','BackgroundColor', 'cyan');

% var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
% var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
comp_peaks(tab5);

tag1 = tgroup;
assignin('base','tag1',tag1)
children = get(tag1, 'Children');
for i=1:numel(children)
    if isempty(get(children(i), 'Children'))
        delete(children(i));
    end
end

tag1 = findobj('Title','RESULTS');
if ~isempty(tag1)
    tgroup.SelectedTab = tab5;
    uicontrol('Parent', tab5, 'Style', 'pushbutton', 'String', 'Close && Exit >>>','Tag','clone1_1', ...
        'HorizontalAlignment', 'left', 'Units','normal','Visible','on','BackgroundColor', 'red','Position', [0.01 0.01 0.98 0.03],'Callback', @confexit); %variable 1 button
end

evalin('base',strcat('achine','.',sel_sub_1,'.',sel_surf_1,'.',sel_machine_1,'.','Data_',num2str(sel_var_1),' = peaks_cell_1;'));
evalin('base',strcat('achine','.',sel_sub_2,'.',sel_surf_2,'.',sel_machine_2,'.','Data_',num2str(sel_var_2),' = peaks_cell_2;')); 

pathed = evalin('base','pathed');
achine = evalin('base','achine');
save([strcat(pathed,'\chines.mat')],'achine');
end

function confexit(~,~)
opts.Interpreter = 'tex';
opts.Default = 'No';
quest = 'Do you like to close all figures and exit?';
answer = questdlg(quest,'Confirm exit',...
    'Yes','No',opts);
if strcmp(answer,'No')
    return
else
    % Close all other figures other than than 'Home' figure
    Figures = findobj('Type','uitab');
    NFigures = length( Figures );
    for nFigures = 1 : NFigures
        delete(Figures(nFigures));
    end
    %%
    pathed = evalin('base','pathed');
    evalin('base','clear all')
    load('machines.mat'); % load database
    athlete = machinen;
    athl = fieldnames(athlete); % get listed athletes
    assignin('base','pathed',pathed);
    assignin('base','athlete',athlete);
    %% get athletes info for display
    athletes = uppertolower(athl,1);
    athletes{length(athletes)+1} ='ADD NEW ATHLETE';
    assignin('base','athletes',athletes)
    % dummy actvities and machines info
    actvities = {'Activity A','Activity B','Activity C', 'Add New Activity'};
    assignin('base','actvities',actvities)
    machines = {'Machine A', 'Machine B', 'Machine C', 'Add New Machine'};
    assignin('base','machines',machines);
    Analyze()
end
end

function comp_peaks(hObject,~)

tgroup = uitabgroup('Parent', hObject,'SelectionChangedFcn',@resultar);

tab5.Tag = 'resultstab';
tab50 = uitab('Parent', tgroup,'Tag','plottypes1', 'Title', 'Bar Chart','BackgroundColor', 'blue');
tab51 = uitab('Parent', tgroup,'Tag','plottypes2', 'Title', 'Pie Chart','BackgroundColor', 'blue');
tab52 = uitab('Parent', tgroup,'Tag','plottypes3', 'Title', 'Line Plot','BackgroundColor', 'blue');
tab53 = uitab('Parent', tgroup,'Tag','plottypes4', 'Title', 'Area Plot','BackgroundColor', 'blue');
tab54 = uitab('Parent', tgroup,'Tag','plottypes5', 'Title', 'Default','BackgroundColor', 'blue');
figo_p(tab50);
end

function figo_p(tab50,~)
% Callback for peaks
tgroup2 = uitabgroup('Parent', tab50,'SelectionChangedFcn',@resultar1); % sub-tabs for plot types

tab60 = uitab('Parent', tgroup2,'Tag','restypes1', 'Title', 'Flight Time','BackgroundColor', 'blue');
tab61 = uitab('Parent', tgroup2,'Tag','restypes2', 'Title', 'Peak Force','BackgroundColor', 'blue');
tab62 = uitab('Parent', tgroup2,'Tag','restypes3', 'Title', 'Average of Forces','BackgroundColor', 'blue');
tab69 = uitab('Parent', tgroup2,'Tag','restypes4', 'Title', 'Impulse','BackgroundColor', 'blue');
tab63 = uitab('Parent', tgroup2, 'Tag','restypes5', 'Title', 'Power','BackgroundColor', 'blue');
tab64 = uitab('Parent', tgroup2,'Tag','restypes6', 'Title', 'Jump Height','BackgroundColor', 'blue');
tab68 = uitab('Parent', tgroup2, 'Tag','restypes7', 'Title', 'Landing Peak','BackgroundColor', 'blue');

figo1_p(tab60,tab50);
end

function figo1_p(tab60,tab50)
% Callback for peaks continued
pan_1 = uipanel('Parent',tab60,'Tag','resultpres_1','Position',[0.12 0.01 0.86 0.96],'Visible','on'); % shoe 1 preview figure


cg = uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Update Mass','Tag','see_mass_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.93 0.08 0.04]); %athlete 1 button

a1 = uicontrol('Parent', tab60, 'Style', 'edit', 'String', 'Subject-1','Tag','see_mass1_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.87 0.08 0.04],'Callback', @fijhj); %athlete 1 butto

a2 = uicontrol('Parent', tab60, 'Style', 'edit', 'String', 'Subject-2','Tag','see_mass2_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.81 0.08 0.04],'Callback', @fijhj); %athlete 1 butto

uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Jump Height','Tag','see_jump_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.6 0.08 0.04]); %athlete 1 button


c1 = uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Impulse-Momentum','Tag','see_jump_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.54 0.08 0.04],'Callback', @cijia1); %athlete 1 butto

c2 = uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Time in Air','Tag','see_jump_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.48 0.08 0.04],'Callback', @cijia1); %athlete 1 butto


uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Update','Tag','conf_see_jump_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible', 'on','BackgroundColor', 'green','Position', [0.02 0.3 0.08 0.04],'Callback', @fijia); %athlete 1 butto

try

    data_ind_1 =evalin('base','dat_machine_1(:,sel_var_1)');
    timer_1 =evalin('base','dat_machine_1(:,end)');
    pe_modi = 1;
    
    region_1 = evalin('base',strcat('region_',num2str(pe_modi)));
    region_1_1 = evalin('base',strcat('region_1_',num2str(pe_modi)));
    region_2_1 = evalin('base',strcat('region_2_',num2str(pe_modi)));
    region_3_1 = evalin('base',strcat('region_3_',num2str(pe_modi)));
    region_4_1 = evalin('base',strcat('region_4_',num2str(pe_modi)));
    region_5_1 = evalin('base',strcat('region_5_',num2str(pe_modi)));
    bor_1 = evalin('base',strcat('bor_',num2str(pe_modi)));
    
    tag1 = 'po2_r';
    region_2 = evalin('base',strcat('region_',tag1(end-2)));
    region_1_2 = evalin('base',strcat('region_1_',tag1(end-2)));
    region_2_2= evalin('base',strcat('region_2_',tag1(end-2)));
    region_3_2 = evalin('base',strcat('region_3_',tag1(end-2)));
    region_4_2 = evalin('base',strcat('region_4_',tag1(end-2)));
    region_5_2 = evalin('base',strcat('region_5_',tag1(end-2)));
    bor_2 = evalin('base',strcat('bor_',tag1(end-2)));
    data_ind_2 =evalin('base','dat_machine_2(:,sel_var_2)');
    timer_2 =evalin('base','dat_machine_2(:,end)');
    pe_modi = 2;
catch
    warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
    return
end


type = tab50.Tag(end);
type = str2double(type);
caser= tab60.Tag(end);
caser = str2double(caser);

% region= {}; % FOR DIP VALUES, GREEN STARS
% region_1= {}; % FOR IMPULSE, BLACK SQUARES
% region_2= {}; % FOR PEAK(TOP) red stars
% region_3= {}; % FOR JUMP START
% region_4= {}; % FOR JUMP END
% region_5= {}; % LOWER BEFORE LAND FOR JUMP END

[ft_1]  = flight_time(region_3_1,region_4_1,timer_1); % call flight time
[ft_2]  = flight_time(region_3_2,region_4_2,timer_2); % call flight time

[imp_1,~,~,~,~] = impulse(region_1_1,timer_1,data_ind_1); % impulse for 1
[imp_2,~,~,~,~] = impulse(region_1_2,timer_2,data_ind_2); % impulse for 2

[~,peakf_1,avgf_1,~,~] = impulse(region_2_1,timer_1,data_ind_1); % peak force for 1
[~,peakf_2,avgf_2,~,~] = impulse(region_2_2,timer_2,data_ind_2); % peak force for 2

% caser from average forces  = 1
% caser from total forces  = 2

% casered from time in air  = 1
% casered from impulse momentum  = 2

cater = 1;

try
    catered = evalin('base','catered');
catch
    catered =2;
end

if catered == 1
    c2.BackgroundColor = cg.BackgroundColor;
else
    c1.BackgroundColor = cg.BackgroundColor;
end

[power1] = power_1(cater,catered,region_1,region_1_1,region_5_1,region_2_1,timer_1,data_ind_1,region_3_1,region_4_1); % power for 1
[power2] = power_1(cater,catered,region_2,region_1_2,region_5_2,region_2_2,timer_2,data_ind_2,region_3_2,region_4_2);

[j_h_a,mass_1] = jump_height_2(region_1,region_1_1,region_5_1,timer_1,data_ind_1,'1'); % jum height for 1
[j_h_b,mass_2] = jump_height_2(region_2,region_1_2,region_5_2,timer_2,data_ind_2,'2');

mass_1 = round(mass_1,1);
mass_2 = round(mass_2,1);

a1.String = ['Subject-1 (' num2str(mass_1),' kg)'];
a2.String = ['Subject-2 (' num2str(mass_2),' kg)'];

[j_h_1] = jump_height_1(region_3_1,region_4_1,timer_1); % jum height for 1
[j_h_2] = jump_height_1(region_3_2,region_4_2,timer_2);

p_star = catered;
if p_star ==1 % jump height from air
else
    j_h_1 = j_h_a;
    j_h_2 = j_h_b;
end 

[lp_1] = land_peak(bor_1,data_ind_1); % landing peak for force 1
[lp_2] = land_peak(bor_2,data_ind_2);

plots_areas_1(ft_1,ft_2,imp_1,peakf_1,avgf_1,imp_2,peakf_2,avgf_2,power1,power2,j_h_1,j_h_2,lp_1,lp_2,pan_1,type,caser)

assignin('base','cur_tab1',tab60)
assignin('base','cur_tab',tab50)
end
%%
function fijhj(hObject,~)
% Callback for edit mass
as = get(hObject,'String');
tag1 = get(hObject,'Tag');

if ~isempty(as) && ~isnan(str2double(as))
    assignin('base',strcat('mass_',tag1(end-2)),as);
else
    warndlg('Please enter a numeric value','Index Error');
    return
end

end

function none(~,~)
warndlg('This selection is already active, click update to proceed.''Selection Done'); 
end

function cijia1(hObject,~)

hf = findobj('Tag','see_mass_1');
hf =hf(1);

tag1 = get(hObject,'Tag');
if strcmp('2',tag1(end))
    assignin('base','catered',2);
    tab60 = findobj('Tag','see_jump_3');
    for i = 1:length(tab60)
        tab60(i).BackgroundColor = 'green';
        tab60(i).Callback = @cijia1;
    end
    hObject.Callback = @none;
    hObject.BackgroundColor = hf.BackgroundColor;
    
else
    assignin('base','catered',1);
    tab60 = findobj('Tag','see_jump_2');
    hObject.Callback = @none;
    hObject.BackgroundColor = hf.BackgroundColor;
    for i = 1:length(tab60)
        tab60(i).BackgroundColor = 'green';
        tab60(i).Callback = @cijia1;
    end
end

end
%%
function [power] = power_1(caser,casered,region_a,region_b,region_c,region_d,timer_1,data_ind,region_3,region_4)
% caser from average forces  = 1
% caser from total forces  = 2

% casered from time in air  = 1
% casered from impulse momentum  = 2

%region_a, = dip before takeoff like region_1
%region_b, = takeoff impulse, like region_1_1
%region_d, = takeoff peak, like region_2_1
%region_c, = landing_peak, like region_5_1
% region_3 == start, %4 = stop, same as their names
% get flight time

power ={};
[trap_area_1,~,avg_f,~,~] = impulse(region_d,timer_1,data_ind);

if caser == 1
    for_used = avg_f;
else
    for_used = trap_area_1;
end

if casered == 1 % for time in air
    [j_h] = jump_height_1(region_3,region_4,timer_1);
    [ft]  = flight_time(region_3,region_4,timer_1);
  
    for i=1:length(region_a)
        pow = (for_used{i}*j_h{i})/(ft{i});
        power(i) = {pow};
    end
    
else
    [j_h,~] = jump_height_2(region_a,region_b,region_c,timer_1,data_ind);
    [ft]  = flight_time(region_3,region_4,timer_1);
    
    for i=1:length(region_a)
        pow = (for_used{i}*j_h{i})/(ft{i});
        power(i) = {pow};
    end
end
end

function [j_h] = jump_height_1(region_3,region_4,timer_1)
%Time in air jump height
% region_3 start % region_4 end
j_h = {};

% from time in air
gravi =9.81;
[ft]  = flight_time(region_3,region_4,timer_1);

for i = 1:length(ft)
    di = (gravi * (ft{i} * ft{i}));
    j_h(i)  = {round((di/8),3)};
end
end
%%
function [j_h,mass] = jump_height_2(region_a,region_b,region_c,timer_1,data_ind,num)
%Impulse momentum jump height
%region_a, = dip before takeoff like region_1
%region_b, = takeoff peak, like region_1_1
%region_c, = landing_peak, like region_5_1
 
gravi =9.81;
j_h = {};
% impulse A
[trap_area_a,~,~,~,~] = impulse(region_a,timer_1,data_ind);

% impulse B
[trap_area_b,~,~,~,~] = impulse(region_b,timer_1,data_ind);

% impulse C
[trap_area_c,~,~,~,~] = impulse(region_c,timer_1,data_ind);

for i = 1:length(region_a)
    ind = (region_a{1}(1))-1;
    try
        mass = evalin('base',strcat('mass_',num));
        mass = str2double(mass);
    catch
        mass= mode(data_ind(1:ind));
        mass = ((mass*2)/gravi);
    end
    tot_imp = trap_area_b{i} - (trap_area_a{i} + trap_area_c{i});
    d_vel =  tot_imp/mass;
    res_j  = (d_vel*d_vel) / (2* gravi);
    j_h(i) = {res_j};
end
end
%%
function [ft]  = flight_time(region_3,region_4,timer_1)
% get flight time
% region_3 start
% region_4 end
ft = {};
for i = 1:length(region_3)
    difer = diff(timer_1);   
    chn = timer_1(region_4{i}(1)) - timer_1(region_3{i}(1));   
    ft(i) = {chn+difer(2)};  
end
end
%%
function [l_p] = land_peak(bor,data_ind)
% landing peak
l_p ={};
for i = 1:length(bor)      
    l_p(i) = {data_ind(bor{i})};  
end
end

%%
function [trap_area_1,max_f,avg_f,tot_f,norm_f] = impulse(region,timer_1,data_ind)
% Bring out impulse, average force, peak force
% region == takeoff, top forces like region_1_1, (this for peak_force)
% trap_area_1 = impulse
trap_area_1 = {};
max_f = {};
avg_f = {};
tot_f = {};
norm_f = {};

for i = 1:length(region)
    star = region{i}(1);
    ender = region{i}(end);
    
    timers_1 = timer_1(star:ender);
    fo = diff(timers_1);
    timers_e =  (timer_1(ender) - timer_1(star)) + (fo(2));
    assignin('base','timers_e',timers_e)
    dater_1 = data_ind(star:ender);
    area_1 = trapz(timers_1,dater_1);
    trap_area_1(i) = {area_1};
    max_f(i) = {max(dater_1)}; 
    avg_f(i) = {round(mean(dater_1),2)};
    tot_f(i) = {sum(dater_1)};
    norm_f(i) = {sum(dater_1)/timers_e};
end
end

%%
function fijia(hObject,~)

findobj('Tag','resultpres_1');
try 
    tab60 = evalin('base','cur_tab1');
catch

    tab60 = findobj('Tag','restypes1');
    tab60 = tab60(end);
end

try 
    tab50  = evalin('base','cur_tab');
catch
    tab50 = findobj('Tag','plottypes1');
    tab50 = tab50(end);
end

figo1_p(tab60,tab50)
end

function  plots_areas_1(ft_1,ft_2,imp_1,peakf_1,avgf_1,imp_2,peakf_2,avgf_2,power1,power2,j_h_1,j_h_2,lp_1,lp_2,fig,type,caser)

children = get(fig, 'children');
delete(children);

a1 = 1;
b1 = max(length(ft_1),length(ft_2));
vol1 =[];
vol2 =[];
cel = a1-1;
cula = ((b1-a1)+1);
for i=1:cula
    sel_var_i = cel+i;

    if (type ==1) || (type ==2)
        if cula >5 && cula <11
            subplot(2,5,i,'parent',fig);
        elseif cula <6
            subplot(1,cula,i,'parent',fig);
        else
            subplot(3,5,i,'parent',fig);
        end
    elseif type == 3 || type==4
        subplot(1,1,1,'parent',fig);
    elseif type == 5 && i==1
        as1 = uitable('Parent', fig,'Units', 'normal','Position',[0.02  0.05 0.96 0.85],...
            'Visible','on','Tag','tabletabdata2' );
    end
    
    
    try
        sater_1 = ft_1{sel_var_i};
        sater_2 = ft_2{sel_var_i};
        
        if caser ==1
            mean_1 = ft_1{sel_var_i};
            mean_2 = ft_2{sel_var_i};
            b = [mean_1;mean_2];
            
        elseif caser ==2
            sum_1 = peakf_1{sel_var_i};
            sum_2 = peakf_2{sel_var_i};
            b = [sum_1;sum_2];
            
        elseif caser ==3
            std_1 = avgf_1{sel_var_i};
            std_2 = avgf_2{sel_var_i};
            b = [std_1 ;std_2];
  
        elseif caser ==4
            mean_1 = imp_1{sel_var_i};
            mean_2 = imp_2{sel_var_i};
            b = [mean_1;mean_2];
            
        elseif caser ==5
            
            sum_1 = power1{sel_var_i};
            sum_2 = power2{sel_var_i};
            b = [sum_1;sum_2];
            
        elseif caser ==6

            std_1 =  j_h_1{sel_var_i};
            std_2 =  j_h_2{sel_var_i};
            b = [std_1 ;std_2];
            
        elseif caser ==7
            
            mean_1 = lp_1{sel_var_i};
            mean_2 = lp_2{sel_var_i};
            b = [mean_1;mean_2];
            
        elseif caser ==8
       
        end
        
    catch
        try
            % or one
           sater_1 = ft_1{sel_var_i};
   
           if caser ==1
               mean_1 = ft_1{sel_var_i};
               mean_2 = 0;
               b = [mean_1;mean_2];
               
           elseif caser ==2
               sum_1 = peakf_1{sel_var_i};
               sum_2 = 0;
               b = [sum_1;sum_2];
               
           elseif caser ==3
               std_1 = avgf_1{sel_var_i};
               std_2 = 0;
               b = [std_1 ;std_2];
               
           elseif caser ==4
               mean_1 = imp_1{sel_var_i};
               mean_2 = 0;
               b = [mean_1;mean_2];
               
           elseif caser ==5
               
               sum_1 = power1{sel_var_i};
               sum_2 = 0;
               b = [sum_1;sum_2];
               
           elseif caser ==6
               
               std_1 =  j_h_1{sel_var_i};
               std_2 =  0;
               b = [std_1 ;std_2];
               
           elseif caser ==7
               
               mean_1 = lp_1{sel_var_i};
               mean_2 = 0;
               b = [mean_1;mean_2];
               
           elseif caser ==8
               
           end
        catch
            % do for 2

            sater_2 = ft_2{sel_var_i};
            
            if caser ==1
                mean_1 = 0;
                mean_2 = ft_2{sel_var_i};
                b = [mean_1;mean_2];
                
            elseif caser ==2
                sum_1 = 0;
                sum_2 = peakf_2{sel_var_i};
                b = [sum_1;sum_2];
                
            elseif caser ==3
                std_1 = 0;
                std_2 = avgf_2{sel_var_i};
                b = [std_1 ;std_2];
                
            elseif caser ==4
                mean_1 = 0;
                mean_2 = imp_2{sel_var_i};
                b = [mean_1;mean_2];
                
            elseif caser ==5
                
                sum_1 = 0;
                sum_2 = power2{sel_var_i};
                b = [sum_1;sum_2];
                
            elseif caser ==6
                
                std_1 =  0;
                std_2 =  j_h_2{sel_var_i};
                b = [std_1 ;std_2];
                
            elseif caser ==7
                
                mean_1 = 0;
                mean_2 = lp_2{sel_var_i};
                b = [mean_1;mean_2];
                
            elseif caser ==8
                
            end
            
        end
    end
    
    if type ==3 ||  type == 4 || type ==5
        vol1 = [vol1;b(1)];
        vol2 = [vol2;b(2)];
    end
    
    switch type  % bar
        case 1
            b0=bar(b);
            b0.FaceColor = 'flat';
            b0.CData(1) = .9;
            title(num2str(i+cel))
        case 2 % pie
            warning off MATLAB:pie:NonPositiveData
            explode = [1 0];
            labels = {'1','2'};
            b0 = pie(b*1000,explode,labels);
            title(num2str(i+cel))
            
            
            try
                b0(1).FaceColor = 'flat';
                b0(1).CData(1) = .9;
                b0(3).FaceColor = 'flat';
                b0(3).CData(1) = .3;
            catch
                if b(1) ==0
                    b0(1).FaceColor = 'flat';
                    b0(1).CData(1) = .3;
                    
                else
                    b0(1).FaceColor = 'flat';
                    b0(1).CData(1) = .9;
                end
            end
%             b0.CData(1) = .9;
        case 3 % line
            if i ==cula
                vol1(vol1==0)=[];
                vol2(vol2==0)=[];
                plot(vol1,':bs', 'LineWidth',2,'MarkerSize',10)
                hold on
                plot(vol2,'--mo','LineWidth',2,'MarkerSize',10)
                legend({'1', '2'})
                make_tick ={};
                lene = max(length(vol1),length(vol2));
                ind_ts = 1:1:lene;
                for p = 1:lene
                    make_tick{p} = floor(p+cel);
                end
                set(gca,'XTick',ind_ts,'XTickLabel',make_tick,'fontsize',10)
            end
        case 4
            if i == cula
                b=[vol1,vol2];
                area(b)
                legend({'1','2'})
                make_tick ={};
                lene = max(length(vol1),length(vol2));
                ind_ts = 1:1:lene;
                for p = 1:lene
                    make_tick{p} = floor(p+cel);
                end
                set(gca,'XTick',ind_ts,'XTickLabel',make_tick,'fontsize',10)
            end
            
        case 5  
            if i ==cula
              
                lene = max(length(vol1),length(vol2));
                t1 = 1:1:lene;        
                t1 = t1+cel;
                
                fer = [];
                for h = 1:3
                    old = {};
                    if h==1
                        volp = t1;
                    elseif h==2
                        volp = vol1;
                    else
                        volp = vol2;
                    end
                    for z  = 1:length(volp)
                        if volp(z) == 0
                            old(z) = {'NA'};
                        else
                            old(z) = {num2str(volp(z))};
                        end
                        
                    end
                    
                    if h == 1
                        old(length(old)+1) = {'Mean'};
                        old(length(old)+1) = {'Total'};
                        old(length(old)+1) = {'Standard Deviation'};
                    else
                        old(length(old)+1) = {mean(volp)};
                        old(length(old)+1) = {sum(volp)};
                        old(length(old)+1) = {std(volp)};
                    end
                    fer =[fer,old'];
                end
              
               as1.Data = fer;
                sb = {'Peak Number';'1';'2'};
                 as1.ColumnName = sb;
            end                           
    end   
end
end

function resultar (hObject,~)
figo_p(hObject.SelectedTab);
assignin('base','cur_tab',hObject.SelectedTab)
end

function resultar1 (hObject,~)
try
    tg = evalin('base','cur_tab');
catch
    tg = get(hObject,'parent');
    
end
figo1_p(hObject.SelectedTab,tg);
assignin('base','cur_tab1',hObject.SelectedTab)
end
%%
function plot_readarr(data_ind,region,region_1,region_2,region_3,region_4,bor,tab1,region_5)

% provide interface to edit on 'PEAK PREVIEW' page

x= data_ind;
MainFigScale = .7;
% 
mouseDown = false;
assignin('base','mouseDown',mouseDown)
Name = 'EDIT PEAKS';

SC = get(0, 'ScreenSize');
MaxMonitorX = SC(3)/1;
MaxMonitorY = SC(4)/1;

MaxWindowX = round(MaxMonitorX*MainFigScale);
MaxWindowY = round(MaxMonitorY*MainFigScale);
XBorder = (MaxMonitorX-MaxWindowX)/2;
YBorder = (MaxMonitorY-MaxWindowY)/2;       
White = [1  1  1]; 
% White - Selected tab color
f = figure(...
    'Units', 'pixels',...
    'Toolbar', 'figure',...
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'on',...
    'Color', White ,'windowstyle', 'normal','WindowButtonUpFcn',@logo,'WindowButtonMotionFcn', @logose);

tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'PEAK-EDIT','BackgroundColor', 'c');

xLimMode = 'auto';
assignin('base','xLimMode',xLimMode)
%x = cio;% meas(:,1);
%  vLineX = randi(length(x));
vLineX  = round(length(x)/4);
x(vLineX);

curlim = evalin('base','curlim ');
if strcmp(curlim,'1')
    labe = 'First';
    timer = evalin('base','dat_machine_1(:,end)');
    la2 = evalin('base','sel_peak_1');
else
    labe = 'Second';
    timer = evalin('base','dat_machine_2(:,end)');
    la2 = evalin('base','sel_peak_2');
end

lab0 = ['Peak Setting For ', labe, ' Subject'];
 
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', lab0,'Tag','zuhletes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.04 0.94 0.86 0.04]); %athlete 1 button
 
ax = axes ( 'parent', tab1, 'position', [0.04 0.06 0.86, 0.87], 'nextplot', 'add' );


uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'OK-Continue >>>','Tag','yuhletes_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.88 0.08 0.05],'BackgroundColor', 'green','Callback',@confp_done1); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'NO-Cancel >>>','Tag','yuhletes_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.06 0.08 0.05],'BackgroundColor', 'red','Callback',@denyp_done1); %athlete 1 button

% for i = 1:length(region)

plot(ax,data_ind,'b-');
hold on
plot(ax,data_ind,'p','MarkerIndices',region ,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',3);
hold on
plot(ax,data_ind,'s','MarkerIndices',region_1 ,'MarkerEdgeColor','black','MarkerFaceColor','black','MarkerSize',5);
hold on
plot(data_ind,'d','MarkerIndices',region_5,'MarkerEdgeColor','black','MarkerFaceColor','g','MarkerSize',1);
hold on
plot(ax,data_ind,'p','MarkerIndices',region_2,'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',5);
hold on
plot(ax,region_3(1),region_3(2),'ks','ButtonDownFcn',@lineCallback)
hold on
plot(ax,region_4(1),region_4(2),'rs','ButtonDownFcn',@lineCallback)
hold on
plot(ax,bor,data_ind(bor),'gs','ButtonDownFcn',@lineCallback);
hold on


curlim = evalin('base','curlim');
biggle= evalin('base',strcat('peaks_cell_',curlim));
sp = evalin('base',strcat('sel_peak_',curlim));
B_point = biggle{sp}(end)+10000000;
B_end = biggle{sp}(6);
B_start = biggle{sp}(5);

assignin('base','B_start',B_start );
assignin('base','B_end',B_end  );
assignin('base',strcat('B_point'),B_point );
end

function denyp_done1()

dolo = findobj('Name', 'EDIT PEAKS');
for i = 1:length(dolo)
    close(dolo(i));
end

end

function confp_done1(hObject,~)
curlim = evalin('base','curlim');
try
    B_start =  evalin('base','B_start');
    B_end =  evalin('base','B_end');
    B_point = evalin('base','B_point');
    
catch
    warndlg('Please adjust the small squares and ensure that the Black one is to the left of the Red one','Point Specification Error');
    return
end

if (B_end > B_start ) && (B_point > B_end )
    
    biggle= evalin('base',strcat('peaks_cell_',curlim));
    sp = evalin('base',strcat('sel_peak_',curlim));
    biggle{sp}(6) = B_end ;
    biggle{sp}(5) = B_start ;
    assignin('base',strcat('B_point_',curlim,num2str(sp)),B_point );
    assignin('base',strcat('peaks_cell_',curlim),biggle);
    dolo = findobj('Name', 'EDIT PEAKS');
    for i = 1:length(dolo)
        close(dolo(i));
    end
    per  = evalin('base',strcat('dat_machine_',curlim));
    sel_var_1 = evalin('base',strcat('sel_var_',curlim));
    data_ind =  per(:,sel_var_1);
    timer = per(:,end);
    pe_modi = str2double(curlim);
    tab1 = findobj('Tag',strcat('datapre',curlim,'_1'));
    tab1  = tab1(1);
    assignin('base','sicko_mode','on');
    [region,region_1,region_2,region_3,region_4,bor,region_5] =  metch_data(data_ind,timer,pe_modi);
    assignin('base',strcat('region_',num2str(pe_modi)),region );
    assignin('base',strcat('region_1_',num2str(pe_modi)),region_1 );
    assignin('base',strcat('region_2_',num2str(pe_modi)),region_2 );
    assignin('base',strcat('region_3_',num2str(pe_modi)),region_3 );
    assignin('base',strcat('region_4_',num2str(pe_modi)),region_4 );
    assignin('base',strcat('region_5_',num2str(pe_modi)),region_5 );
    assignin('base',strcat('bor_',num2str(pe_modi)),bor);
    plot_rda(data_ind,timer,tab1,strcat('datapre',curlim,'_1'));
    assignin('base','sicko_mode','off');
else
    warndlg('Please adjust the small squares and ensure that the Black one is to the left of the Red one','Point Specification Error');
    return
end
end

function [region,region_1,region_2,region_3,region_4,bor,region_5] =  metch_data(data_ind,timer,pe_modi)
% get areas of interest

biggle= evalin('base',strcat('peaks_cell_',num2str(pe_modi)));
disce = [];
for i = 1:length(biggle)
    disce = [disce;biggle{i}(end)];
end
assignin('base','ind_pea',disce);

region= {}; % FOR DIP VALUES, GREEN STARS
region_1= {}; % FOR IMPULSE, BLACK SQUARES
region_2= {}; % FOR PEAK(TOP) red stars
region_3= {}; % FOR JUMP START
region_4= {}; % FOR JUMP END
region_5= {}; % LOWER BEFORE LAND FOR JUMP END

%
bor = {};

for i = 1:length(disce)
    %%
    dip_s = biggle{i}(4);
    dip_v = biggle{i}(2);
    peaks_dip = data_ind<dip_v;
    peaks_dip = find(peaks_dip, sum(peaks_dip));
    peaks_di = (peaks_dip>dip_s) + (peaks_dip<biggle{i}(5));
    dip_vals = peaks_dip(peaks_di ==2); % dip before start
    good = diff(dip_vals)>45;
    if sum(good) ~= 0
        dem_bles = find(good,1,'first');
        dip_vals = dip_vals(1:dem_bles);
    end
    %% Impulse region
    peaks_imp = data_ind>dip_v;
    peaks_imp = find(peaks_imp, sum(peaks_imp));
    peaks_di = (peaks_imp>dip_vals(end)) + (peaks_imp<biggle{i}(5));
    imp_vals = peaks_imp(peaks_di ==2); % dip before start
    good = diff(imp_vals)>45;
    if sum(good) ~= 0
        dem_bles = find(good,1,'first');
        imp_vals = imp_vals(1:dem_bles);
    end
    %%
      %% Negative Impulse region
    neg_peaks_imp = data_ind<dip_v;
    neg_peaks_imp = find(neg_peaks_imp, sum(neg_peaks_imp));
    neg_peaks_di = (neg_peaks_imp>imp_vals(end)) + (neg_peaks_imp<=(biggle{i}(6)+15));
    neg_vals = neg_peaks_imp(neg_peaks_di ==2); % dip before start
    good = diff(neg_vals)>45;
    if sum(good) ~= 0
        dem_bles = find(good,1,'first');
        neg_vals = imp_vals(1:dem_bles);
    end
    %%
    % values above
    peak_v = biggle{i}(3);
    peak_vald = data_ind>peak_v;
    peak_vald = find(peak_vald, sum(peak_vald));
    peaks_di = (peak_vald >dip_s) + (peak_vald<biggle{i}(6));
    peak_vals = peak_vald(peaks_di ==2);
    good = diff(peak_vals)>15;
    if sum(good) ~= 0
        dem_bles = find(good,1,'first');
        peak_vals  = peak_vals(1:dem_bles);
    end
    %% vals for flight time
    ft_s = biggle{i}(5); % start
    ft_e = biggle{i}(6); % end
    put_e = biggle{i}(1);
    try
        sicko_mode =  evalin('base','sicko_mode');
        if strcmp(sicko_mode ,'on')
             
%             sp = evalin('base',strcat('sel_peak_',num2str(pe_modi)));
%             assignin('base',strcat('B_point_',num2str(pe_modi),num2str(sp)))
            land_e = evalin('base',strcat('B_point_',num2str(pe_modi),num2str(i)));
            if land_e > 10000000
                %% landing peak
                land_v = biggle{i}(6);
                land_peak = data_ind>0;
                land_peak  = find(land_peak , sum(land_peak));
                land_pea = (land_peak>land_v);
                land_vald = land_peak(land_pea);
                land_e = data_ind(land_vald(1:100)) == max(data_ind(land_vald(1:100)));
                dem_bles = find(land_e,1,'first');
                land_e = land_vald(dem_bles);
            end
        else
            %% landing peak
            land_v = biggle{i}(6);
            land_peak = data_ind>0;
            land_peak  = find(land_peak , sum(land_peak));
            land_pea = (land_peak>land_v);
            land_vald = land_peak(land_pea);
            land_e = data_ind(land_vald(1:100)) == max(data_ind(land_vald(1:100)));
            dem_bles = find(land_e,1,'first');
            land_e = land_vald(dem_bles);
        end
    catch
        
        %% landing peak
        land_v = biggle{i}(6);
        land_peak = data_ind>0;
        land_peak  = find(land_peak , sum(land_peak));
        land_pea = (land_peak>land_v);
        land_vald = land_peak(land_pea);
        land_e = data_ind(land_vald(1:100)) == max(data_ind(land_vald(1:100)));
        dem_bles = find(land_e,1,'first');
        land_e = land_vald(dem_bles);
    end

    bor(i) = {land_e};
    region(i) = {dip_vals};
    region_1(i) = {imp_vals};
    region_2(i) = {peak_vals};
    region_2(i) = {peak_vals};
    region_3(i) = {[ft_s,put_e ]};
    region_4(i) = {[ft_e,put_e ]};
    region_5(i) = {neg_vals};
end

end

function saveediteddata(hObject,~)
% Callback for completing data edit
tg = get(hObject,'parent'); %tab
tgp = get(tg,'parent'); %tabgroup
tgpp = get(tgp,'parent'); %figure
% % do, ask if to database or just this session.
% % for when not edit from database.

hf = findobj('Tag','tabletabdata');
hf= hf(1);
data = hf.Data;

data_source = evalin('base','tablesource'); % whetedatabase or analyze
if strcmp(data_source ,'MACHINE')
    original_tag=evalin('base','original_tag');
    data_r = [data(:,2:end),data(:,1)];
    assignin('base',strcat('dat_machine_',original_tag),data_r);
    hf = findobj('Tag',strcat('machine_data_tab_',original_tag));
    data_table = hf(1);
    data_table.Data = data;
    opts.Interpreter = 'tex';
    opts.Default = 'No';
    quest = 'This edited data is only for this session. Do you like to save it to and update the database?';
    answer = questdlg(quest,'Edit Database',...
        'Yes','No',opts);
    if strcmp(answer,'No')
    else
        modifydatabase(data,1) % one for preexiting data
        [icondata,~] = imread('trees.tif');
        msgbox('Data sucessfully updated in database','Update Completed','custom',...
            icondata,summer);
    end
    
else
    [icondata,~] = imread('trees.tif');
    modifydatabase(data,2) %two for data from txt file
    msgbox('Data sucessfully added to database','Operation Completed','custom',...
        icondata,summer);
    assignin('base','edited_data',data);
end

close(tgpp)
end

function modifydatabase(data,con)
% Modify database
machinen = evalin('base','athlete');
if con == 1
    % get tag  for edited, (1 or 2)
    original_tag = evalin('base','original_tag');
    add_sub_1 = evalin('base',strcat('sel_sub_',original_tag));
    add_surf_1 = evalin('base',strcat('sel_surf_',original_tag));
    add_machine_1 = evalin('base',strcat('sel_machine_',original_tag));
    %     surf_1 = evalin('base','rem_surf_1');
    %     machine_1 =  evalin('base','rem_machine_1');
else
    add_sub_1 = evalin('base','add_sub_1');
    add_surf_1 = evalin('base','add_surf_1');
    add_machine_1 = evalin('base','add_machine_1');
    
end


try
    Sw = getfield(machinen,add_sub_1); % try get athlete
catch
    machinen = setfield(machinen,add_sub_1,struct());
    Sw = getfield(machinen,add_sub_1);
end

try
    Sx = getfield(Sw,add_surf_1);
    
catch
    Sw = setfield(Sw,add_surf_1,struct());
    Sx = getfield(Sw,add_surf_1);
end

try
    Sy = getfield(Sx,add_machine_1); % try get athlete
catch
    Sx = setfield(Sx,add_machine_1,struct());
    Sy = getfield(Sx,add_machine_1);
end
dat_machine_1 = [data(:,2:end),data(:,1)];
Sy.Data = dat_machine_1;

% machinen = setfield(machinen,add_sub_1);
%%
Sx = setfield(Sx,add_machine_1,Sy);
Sw = setfield(Sw,add_surf_1,Sx);
machinen = setfield(machinen,add_sub_1,Sw);
assignin('base','athlete',machinen);
pathed = evalin('base','pathed');
save([strcat(pathed,'\machines.mat')],'machinen');
if con ==2
    hf = findobj('Tag','Databasetab');
    hf =hf(1);
    athl = fieldnames(machinen); % get listed athletes
    %% get athletes info for display
    athletes = uppertolower(athl,1);
    athletes{length(athletes)+1} ='ADD NEW ATHLETE';
    assignin('base','athletes',athletes)
    accessdatabase(hf);
    Analyze();
    evalin('base','clear add_sub_1 add_surf_1 add_machine_1');
end
end

function switchcolrow(hObject,~)
% Callback for switching columns
tag1 = get(hObject,'Tag');
if strcmp(tag1(end),'3')
    try
        fr =  evalin('base','switch_col_1');
        sr =  evalin('base','switch_col_2');
        hf = findobj('Tag','tabletabdata');
        hf= hf(1);
        data = hf.Data;
        data(:,[fr,sr]) = data(:,[sr,fr]);
        hf.Data = data;
        fh = findobj('Tag','confcancel');
        fh= fh(1);
        fh.Visible = 'on';
    catch
        warndlg('Please select the two columns to switch and retry','Column Error');
    end
    return
end

as = get(hObject,'String');
is = get(hObject,'Value');
its = as{is};
assignin('base',strcat('switch_col_',tag1(end)),is)
end

function deletecolrow(hObject,~)
% Callback for deleting rows
tag1 = get(hObject,'Tag');
as = get(hObject,'String');

if strcmp(tag1(end),'3')  % check if it is te confirm button
    try
        fr =  evalin('base','del_row_1');
        sr =  evalin('base','del_row_2');
        hf = findobj('Tag','tabletabdata');
        hf= hf(1);
        data = hf.Data;
        data(fr:sr,:) = [];
        hf.Data = data;
        fh = findobj('Tag','confcancel');
        fh= fh(1);
        fh.Visible = 'on';
    catch
        warndlg('Please complete the required fields and retry','Index Error');
    end
    return
end


if ~isempty(as) && ~isnan(str2double(as)) % for the edit inputs
    hf = findobj('Tag','tabletabdata'); % get table data
    hf= hf(1);
    data = hf.Data;
    
    % check if input value is not beyond data indices
    [dl,~] = size(data);
    if str2double(as)<=dl
        assignin('base',strcat('del_row_',tag1(end)),str2double(as));
        try
            fr =  evalin('base','del_row_1');
            sr =  evalin('base','del_row_2');
            if fr<=sr
            else
                warndlg('First row value cannot be greater than second, please check and retry','Index Error');
                return
            end
        catch
        end
    else
        warndlg('Specified value is greater than the data row indices, please check and retry','Index Error');
        return
    end
else
    warndlg('Incorrect row number specified (value must be numeric), please check and retry','Index Error');
end
end

function [data_out] = uppertolower(data_in,status)
% status to convert from upper to lower
%data_in, data_out = input, output
data_out ={};
for i=1:length(data_in)
    op = data_in{i};
    if status == 1
        op(regexp(op,'_'))=' ';
        data_out{i} = upper(op);
    else
        op(regexp(op,' '))='_';
        data_out{i} = lower(op);
    end
end
data_out = sort(data_out);
end

function[PanelWidth,f] = getscreen(MainFigScale,Name)
SC = get(0, 'ScreenSize');
MaxMonitorX = SC(3)/1;
MaxMonitorY = SC(4)/1;

MaxWindowX = round(MaxMonitorX*MainFigScale);
MaxWindowY = round(MaxMonitorY*MainFigScale);
XBorder = (MaxMonitorX-MaxWindowX)/2;
YBorder = (MaxMonitorY-MaxWindowY)/2;
TabOffset = 0;              % This value offsets the tabs inside the figure.
PanelWidth = MaxWindowX-2*TabOffset+4;

White = [1  1  1];            % White - Selected tab color
f = figure(...
    'Units', 'pixels',...
    'Toolbar', 'none',...
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'off',...
    'Color', White);
end

function[PanelWidth,f] = getscreen1(MainFigScale,Name)
SC = get(0, 'ScreenSize');
MaxMonitorX = SC(3)/2;
MaxMonitorY = SC(4)/1;

MaxWindowX = round(MaxMonitorX*MainFigScale);
MaxWindowY = round(MaxMonitorY*MainFigScale);
XBorder = (MaxMonitorX-MaxWindowX)/2;
YBorder = (MaxMonitorY-MaxWindowY)/2;
TabOffset = 0;              % This value offsets the tabs inside the figure.
PanelWidth = MaxWindowX-2*TabOffset+4;

White = [1  1  1];            % White - Selected tab color
f = figure(...
    'Units', 'pixels',...
    'Toolbar', 'none',...
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'off',...
    'Color', White);
end