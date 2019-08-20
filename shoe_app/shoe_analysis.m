function shoe_analysis()
%%
try
    files = matlab.apputil.getInstalledAppInfo;
    [path,~,~] = fileparts(files(1).location);
    pathed = strcat(path,'\shoe_analytics\code');
    limit = '27-July-2029 19:30:00'  ;
    if datetime('now')> limit
        pol = [strcat(pathed,'\athletes.mat')];
        delete(pol)
    end
    addpath(pathed);
    load('athletes.mat')
catch
    warndlg('Trial Period Has Expired, Contact "karimprinceaddo@yahoo.com" to purchase full license','License Error');
    return
end
% get athletes info for di22splay
athlete = athleten;
athl = fieldnames(athlete); % get listed athletes
athletes = uppertolower(athl,1);
athletes{length(athletes)+1} ='ADD NEW ATHLETE';
assignin('base','athletes',athletes);
% dummy surfaces and shoes info
assignin('base','sototype',2);
surfaces = {'Surface A','Surface B','Surface C', 'Add New Surface'};
shoes = {'Shoe A', 'Shoe B', 'Shoe C', 'Add New Shoe'};
assignin('base','surfaces',surfaces);
assignin('base','shoes',shoes);
assignin('base','athlete',athlete);
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
tab1 = uitab('Parent', tgroup, 'Title', 'ANALYZE','BackgroundColor', 'blue');
tab2 = uitab('Parent', tgroup, 'Title', 'DATABASE','BackgroundColor', 'blue');
assignin('base','tgroups',tgroup);

tab1.Tag = 'Methodstab';
tab2.Tag = 'Databasetab';

athletes_1 = evalin('base','athletes');
athletes_2 = athletes_1;

surfaces_1 = evalin('base','surfaces');
surfaces_2 = surfaces_1 ;

shoes_1 = evalin('base','shoes');
shoes_2 = shoes_1;


% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.

% Subject One
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'First Subject','Tag','athletes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.1 0.9 0.2 0.07]); %athlete 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes_1 ,'Tag','athlete_1',...
    'Units','normal','Position', [0.1 0.85 0.2 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Surface','Tag','surfaces_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.75 0.2 0.07]); %surface 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', surfaces_1 ,'Tag','surface_1',...
    'Units','normal','Visible','off','Position', [0.1 0.7 0.2 0.05],'BackgroundColor', 'green','Callback', @surface_1);%surface 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Shoe','Tag','shoes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.6 0.2 0.07]);%shoe 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', shoes_1 ,'Tag','shoe_1',...
    'Units','normal','Visible','off','Position', [0.1 0.55 0.2 0.05],'BackgroundColor', 'green','Callback', @shoe_1);%shoe 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.1 0.13 0.2 0.07],'Callback', @confirm_1); % confirm selection 1


% Subject Two
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Second Subject','Tag','athletes_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.4 0.9 0.2 0.07]); %athlete 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes_2,'Tag','athlete_2',...
    'Units','normal','Position', [0.4 (0.85) 0.2 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Surface','Tag','surfaces_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.75 0.2 0.07]); %surface 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', surfaces_2 ,'Tag','surface_2',...
    'Units','normal','Visible','off','Position', [0.4 0.7 0.2 0.05],'BackgroundColor', 'green','Callback', @surface_1);%surface 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Select Shoe','Tag','shoes_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.6 0.2 0.07]);%shoe 2 button
uicontrol('Parent', tab1,'Style', 'popup','String', shoes_2 ,'Tag','shoe_2',...
    'Units','normal','Visible','off','Position', [0.4 0.55 0.2 0.05],'BackgroundColor', 'green','Callback', @shoe_1);%shoe 2 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm_2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.4 0.13 0.2 0.07],'Callback', @confirm_1); % confirm selection 2

% Help
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Click here for help', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position',  [0.7 0.9 0.2 0.07]);
uicontrol('Parent', tab1,'Style', 'popup','String', {'Selecting Subjects','Modifying Database','Selecting Surfaces and Shoes','Selecting Peaks and Spikes'},...
    'Units','normal','Position', [0.7 (0.85) 0.2 0.05],'BackgroundColor', 'green','Callback', @ahelped);

%Continue
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Continue (Manually) >>>','Tag','continue_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.7 0.13 0.2 0.03],'Callback', @continue_1); % continue_1


%Continue
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Continue (Automatically) >>>','Tag','continueg_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.7 0.17 0.2 0.03],'Callback', @continue_1); % continue_1


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
        dat=evalin( 'base', strcat('dat_shoe_1'));
        dat=evalin( 'base', strcat('dat_shoe_2'));
        hf = findobj('Tag',ob);
        hf = hf(1);
        hf.Visible='On';
        hf = findobj('Tag','continueg_1');
        hf = hf(1);
        hf.Visible='On';
    catch
    end
else
    hObject.BackgroundColor = 'green';
    hObject.String = 'Confirm Selection';
    try
        evalin( 'base', strcat('clear',' dat_shoe_',tag1(end)));
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
tab3 = findobj('Title','SHOE PREVIEW');
if ~isempty(tab3)  
    try
        dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
        dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
        dat = [dat_shoe_1(:,end),dat_shoe_1(:,1:end-1)];
        dat0 = [dat_shoe_2(:,end),dat_shoe_2(:,1:end-1)];
        uitable1 = findobj('Tag','shoe_data_tab_1');
        uitable1 = uitable1(1);
        uitable2 = findobj('Tag','shoe_data_tab_2');
        uitable2 = uitable2(1);
        uitable1.Data = dat;
        uitable2.Data = dat0;
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
    dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
    dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
catch
    warndlg('Incorrect selections made, please check and retry','Shoe Selection Error');
    return
end

% Create and populate tab
tab3 = uitab('Parent', tgroup, 'Title', 'SHOE PREVIEW','BackgroundColor', 'blue');
var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};

% Variable One
dat = [dat_shoe_1(:,end),dat_shoe_1(:,1:end-1)];
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'First Shoe','Tag','variables_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.03 0.9 0.1 0.05]); %variable 1 button
uicontrol('Parent', tab3,'Style', 'popup','String', var ,'Tag','variable_1',...
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
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'First Shoe Data','Tag','shoe_data_prev_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.14 0.9 0.34 0.05]); %shoe 1 preview button
uitable('Parent', tab3,'Units','normal','Position',[0.14 0.6 0.34  0.3],'Visible','on','Tag','shoe_data_tab_1','Data',dat,'ColumnName',var1 ); %shoe 1 preview  table
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Edit Shoe Data','Tag','shoe_data_edit_1','BackgroundColor','green','Visible','on', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.14 0.56 0.34 0.04],'Callback', @gotoeditdata); %shoe 1 edit  button

pan_1 = uipanel('Parent',tab3,'Tag','datapres_1','Position',[0.03 0.1 0.45 0.4],'Visible','off'); % shoe 1 preview figure
subplot(1,1,1,'Parent', pan_1) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on
titl = ['SELECTED ' var{1} ' PREVIEW'];
title(titl)

% Variable Two
dat0 = [dat_shoe_2(:,end),dat_shoe_2(:,1:end-1)];
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Second Shoe','Tag','variables_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.52 0.9 0.1 0.05]); %avariable  2 button
uicontrol('Parent', tab3,'Style', 'popup','String', var ,'Tag','variable_2',...
    'Units','normal','Position', [0.52 0.85 0.1 0.05],'BackgroundColor', 'green','Callback', @variable_1); %variable 2 drop-down


% % Variable Two Peaks
z3 = uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Number of Peaks','Tag','srariables_2', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.52 0.7 0.1 0.05]); %variable 1 button
z4 = uicontrol('Parent', tab3,'Style', 'popup','String', varb ,'Tag','sariable_2',...
    'Units','normal','Visible','off','Position', [0.52 0.65 0.1 0.05],'BackgroundColor', 'green','Callback', @pariable_1); %variable  1 drop-down


uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Second Shoe Data','Tag','shoe_data_prev_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.63 0.9 0.34 0.05]); %%shoe 1 preview button
uitable('Parent', tab3,'Units','normal','Position',[0.63 0.6 0.34  0.3],'Visible','on','Tag','shoe_data_tab_2','Data',dat0,'ColumnName',var1); %shoe 2 preview  table
uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Edit Shoe Data','Tag','shoe_data_edit_2','BackgroundColor','green','Visible','on', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.63 0.56 0.34 0.04],'Callback', @gotoeditdata); %shoe 2 edit  button

pan_2 = uipanel('Parent',tab3,'Tag','datapres_2','Position',[0.52 0.1 0.45 0.4],'Visible','off'); % shoe 2 preview figure

uicontrol('Parent', tab3, 'Style', 'pushbutton', 'String', 'Confirm && Continue >>>','Tag','confirm1_1','BackgroundColor','green','Visible','off', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.03 0.02 0.94 0.04],'Callback', @confirm1_1);

tgroup.SelectedTab = tab3;

ot = 'Select the factors for each shoe';
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
dat = evalin('base',strcat('dat_shoe_',tag1(end)));
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


operation_mode = evalin('base','operation_mode');
if operation_mode == 1
    elems = {'datapres_'};
else
    elems = {'datapres_','srariables_','sariable_'};
end

for i=1:length(elems)
    hf=findobj('Tag',strcat(elems{i} ,tag1(end)));
    if i ==1
        pan_1 = hf(1);
        subplot(1,1,1,'Parent', pan_1) ;
    else
        pod = hf(1);
        pod.Visible = 'on';
    end
end
% fetch correponding shoe data
dat=evalin( 'base', strcat('dat_shoe_',tag1(end)));
dat = dat(:,1:end-1);
% plot figure
subplot(1,1,1,'Parent', pan_1) ;
plot(dat(:,is))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on
pan_1.Visible = 'on';
var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
titl = ['SELECTED ' var{is} ' PREVIEW'];
title(titl)

elems = 'datapres_';
operation_mode = evalin('base','operation_mode');
if operation_mode == 1
    var_ind = str2double(tag1(end));
    if var_ind ==1
        va_ind =2;
    else
        va_ind =1;
    end
    hf=findobj('Tag',strcat(elems ,num2str(va_ind)));
    pan_ = hf(1);
    if strcmp(pan_.Visible,'on')
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
    end
end

% var_ind = str2double(tag1(end));
% if var_ind ==1
%     va_ind =2;
% else
%     va_ind =1;
% end
% hf=findobj('Tag',strcat(elems ,num2str(va_ind)));
% pan_ = hf(1);
% if strcmp(pan_.Visible,'on')
%     hf=findobj('Tag','confirm1_1');
%     hf = hf(1);
%     hf.Visible ='on';
% end
assignin( 'base', strcat('sel_var_',tag1(end)),is)
return

%confirm1_1
if is == length(as)
    % put code to update database here
    return
end
its = lower(as{is}); % get the selected item
% get database
athlete = evalin('base','athlete');
sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
surf_i = evalin('base',strcat('sel_surf_',tag1(end)));  % get surface

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
    vco = evalin('base',strcat('sel_pera_1'));
    vco = evalin('base',strcat('sel_pera_2'));
    var_ind = str2double(tag1(end));
    if var_ind ==1
        va_ind =2;
    else
        va_ind =1;
    end
    hf=findobj('Tag',strcat(elems ,num2str(va_ind)));
    pan_ = hf(1);
    if strcmp(pan_.Visible,'on')
        hf=findobj('Tag','confirm1_1');
        hf = hf(1);
        hf.Visible ='on';
    end
catch
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
d = 'If not available, select option to add.'; e = 'You can optionally edit and delete in database.'; f = 'Each subject has different surfaces and different shoes listed for each surface.';
g = 'Select the surfaces again if the selected is modified'; h = 'Same applies to the shoes and surfaces';
i = 'All peaks can be selected as well as specific ones'; j = 'For all peaks, the results are tabulated' ; k = 'For specific peaks, all spikes or specific spikes can be selected';
l = 'You can adjust the red bar to adjust the desired number of peaks'; m = 'Click on update after adjusting the imits.';
n = 'If an independent option is cahnged, the dependent ones must be reselected again';
axes('Parent', tab1, 'Units', 'normal','Position',[0 0 1 1],'Visible','off');

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

surfaces1_1 = evalin('base','surfaces');
surfaces1_2 = surfaces1_1 ;

shoes1_1 = evalin('base','shoes');
shoes1_2 = shoes1_1;

% Add Components to Tab
% Tabs contain user interface components such as labels, buttons, and edit boxes. To add a component to a tab, create the component and set its parent to the tab.

% Subject One
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE ATHLETES','Tag','athletes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.9 0.15 0.07]); %athlete 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', athletes1_1 ,'Tag','athlete1_1',...
    'Units','normal','Position', [0.05 0.85 0.15 0.05],'BackgroundColor', 'green','Callback', @athlete_1); %athlete 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE SURFACES','Tag','surfaces1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.75 0.15 0.07]); %surface 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', surfaces1_1 ,'Tag','surface1_1',...
    'Units','normal','Visible','off','Position', [0.05 0.7 0.15 0.05],'BackgroundColor', 'green','Callback', @surface_1);%surface 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'AVAILABLE SHOES','Tag','shoes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.6 0.15 0.07]);%shoe 1 button
uicontrol('Parent', tab1,'Style', 'popup','String', shoes1_1 ,'Tag','shoe1_1',...
    'Units','normal','Visible','off','Position', [0.05 0.55 0.15 0.05],'BackgroundColor', 'green','Callback', @shoe_1);%shoe 1 drop-down

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Confirm Selection','Tag','confirm2_1','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','Position', [0.05 0.15 0.15 0.05],'Callback', @confirm_1); % confirm selection 1

pan_1 = uipanel('Parent',tab1,'Tag','datapres1_1','Position',[0.25 0.05 0.74 0.83],'Visible','off'); % shoe 1 preview figure

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

surfaces1_1 = evalin('base','surfaces');
surfaces1_2 = surfaces1_1 ;

shoes1_1 = evalin('base','shoes');
shoes1_2 = shoes1_1;


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


% SURFACE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'SURFACE','Tag','urfaces1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.58 0.9 0.05]); %surface button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'NEW','Tag','urfaces1_2','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.52 0.4 0.05],'Callback', @newthletes_1);  %new surface button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','urfaces1_3','BackgroundColor', 'green', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.55 0.52 0.4 0.05],'Callback', @newthletes_1); %old surface button


uicontrol('Parent', tab2, 'Style', 'edit','Visible','off', 'String', 'Enter First Name', 'HorizontalAlignment', 'left','Tag','urfaces_n1','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.46 0.4 0.05],'Callback',@namenewthletes_1);

uicontrol('Parent', tab2, 'Style', 'edit', 'Visible','off','String', 'Enter Last Name (Optional)', 'HorizontalAlignment', 'left','Tag','urfaces_n2','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.39 0.4 0.05],'Callback',@namenewthletes_1);

c='!!!!!!! HELP !!!!!!';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','off', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces_b','Units', 'normal', 'Position', [0.55 0.46 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text','Visible','off', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces_m','Units', 'normal', 'Position', [0.55 0.31 0.4 0.15]);

uicontrol('Parent', tab2,'Visible','off','Style', 'popup','String', surfaces1_1(1:end-1) ,'Tag','urfaces_1',...
    'Units','normal','Position', [0.55 0.46 0.4 0.05],'BackgroundColor', 'green','Callback', @surface_1); %athlete 1 drop-down


% SHOE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String','SHOE','Tag','hoes1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.22 0.9 0.05]); %athlete 1 button


uicontrol('Parent', tab2, 'Style', 'edit', 'String', 'Enter Shoe Name', 'HorizontalAlignment', 'left','Tag','hoes_n1','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.16 0.4 0.05],'Callback',@namenewthletes_1);

% uicontrol('Parent', tab2, 'Style', 'edit', 'String', 'Enter Last Name (Optional)', 'HorizontalAlignment', 'left','Tag','Pcscreenum','BackgroundColor', 'green','Units', 'normal', 'Position', [0.05 0.39 0.4 0.05]);
%
c='!!!!!!! HELP !!!!!!';
message=["Clear the space and type the new shoe's name. Common shoe names are:    1. TRAINERS 2. SPIKE" ];
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String',c, 'HorizontalAlignment', 'left','Tag','hoes_b','Units', 'normal', 'Position', [0.55 0.16 0.4 0.05]);
%
uicontrol('Parent', tab2, 'Style', 'text', 'String',message, 'HorizontalAlignment', 'left','Tag','hoes_m','Units', 'normal', 'Position', [0.55 0.06 0.4 0.1]);

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

surfaces1_1 = evalin('base','surfaces');
surfaces1_2 = surfaces1_1 ;
surfaces1_1{length(surfaces1_1)} = 'ALL';

shoes1_1 = evalin('base','shoes');
shoes1_2 = shoes1_1;
shoes1_1{length(shoes1_1)} = 'ALL';

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

% SURFACE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'SURFACE','Tag','urfaces2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.58 0.9 0.05]); %surface button

uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String', 'EXISTING','Tag','urfaces2_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.52 0.4 0.05]); %old surface button

c='!!!!!!! HELP !!!!!!';
c1='Select the surface from the list provided. Use ALL option to select all';
uicontrol('Parent', tab2, 'Style', 'pushbutton','Visible','on', 'String',c, 'HorizontalAlignment', 'left','Tag','urfaces2_b','Units', 'normal', 'Position', [0.55 0.52 0.4 0.05]);

uicontrol('Parent', tab2, 'Style', 'text','Visible','on', 'String',c1, 'HorizontalAlignment', 'left','Tag','urfaces2_m','Units', 'normal', 'Position', [0.55 0.37 0.4 0.15]);

uicontrol('Parent', tab2,'Visible','on','Style', 'popup','String', surfaces1_1,'Tag','rfaces2_1',...
    'Units','normal','Position', [0.05 0.46 0.4 0.05],'BackgroundColor', 'green','Callback', @surface_2); %athlete 1 drop-down

% SHOE
uicontrol('Parent', tab2, 'Style', 'pushbutton', 'String','SHOE','Tag','hoes2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.05 0.24 0.9 0.05]); %athlete 1 button

uicontrol('Parent', tab2,'Style', 'popup','String', shoes1_1,'Tag','oes2_1',...
    'Units','normal','Visible','on','Position', [0.05 0.18 0.4 0.05],'BackgroundColor', 'green','Callback', @shoe_2);%shoe 2 drop-down

c='!!!!!!! HELP !!!!!!';
c1='Select the shoe from the list provided. Use ALL option to select all';
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
athleten = evalin('base','athlete');

rem_sub_1 = evalin('base','rem_sub_1');
rem_surf_1 = evalin('base','rem_surf_1');
rem_shoe_1 = evalin('base','rem_shoe_1');

if strcmpi(rem_sub_1,'all')
    warndlg('Please delete one athlete at a time','Deletion Error');
    return
end

if strcmpi(rem_surf_1,'all')
    opts.Interpreter = 'tex';
    opts.Default = 'No';
    quest = 'This will delete all the surfaces of the specified athlete. Do you want to continue?';
    answer = questdlg(quest,'Confirm exit',...
        'Yes','No',opts);
    if strcmp(answer,'No')
        return
    else
    end
end

try
    Sw = getfield(athleten,rem_sub_1); % try get athlete
    Sx = getfield(Sw,rem_surf_1);
    Sx = rmfield(Sx,rem_shoe_1);
    Sw = setfield(Sw,rem_surf_1,Sx);
    athleten = setfield(athleten,rem_sub_1,Sw);
catch
    try
        Sw = getfield(athleten,rem_sub_1); % try get athlete
        Sw = rmfield(Sw,rem_surf_1);
        athleten = setfield(athleten,rem_sub_1,Sw);
    catch
        try
            athleten = rmfield(athlete,rem_sub_1);
        catch
        end
    end
end

assignin('base','athlete',athleten);
pathed = evalin('base','pathed');
save([strcat(pathed,'\athletes.mat')],'athleten');

hf = findobj('Tag','Databasetab');
hf =hf(1);
athl = fieldnames(athleten); % get listed athletes
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
            evalin('base','clear rem_sub_1 rem_surf_1 rem_shoe_1');
        else
            evalin('base','clear add_sub_1 add_surf_1 add_shoe_1');
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
    [data_out] = uppertolower(surf_str,1); % get string to display in surface buttons
    data_out{length(data_out)+1} ='ALL';
    hf=findobj('Tag','rfaces2_1');
    hf = hf(1);
    hf.String = data_out; % upsate string for surfaces
else
    assignin('base','rem_shoe_1',its)
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

function surface_2(hObject,~)
% Callback for shoe surface menu
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
        shoe_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        [data_out] = uppertolower(shoe_str,1); % get string to display in surface buttons
        data_out{length(data_out)+1} ='ALL';
        hf=findobj('Tag','oes2_1');
        hf=hf(1);
        hf.String = data_out;
        
    catch
        
    end
else
    try
        sub_i = evalin('base','rem_sub_1');
        assignin('base','rem_shoe_1',its)
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

function shoe_2(hObject,~)
% Callback for shoe popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

its = lower(as{is}); % get the selected item
its(regexp(its,' '))='_';
% get database
athlete = evalin('base','athlete');
assignin('base','rem_shoe_1',its);
% get ID to find details from the database structure
hf=findobj('Tag','readfile2');
hf = hf(1);
try
    sub_i = evalin('base','rem_sub_1'); % get subject 1
    surf_i = evalin('base','rem_surf_1');  % get surface
    its(regexp(its,' '))='_';
    hf.Visible = 'on';
catch
    warndlg('Please select an existing athlete and surface first, no record found','Selection Error');
    hf.Visible = 'off';
    return
end

hf=findobj('Tag','hoes2_m');
hf = hf(1);
hf.String = [as{is} ' SELECTED' ];
end

function [dat,var1,T_data] = readfile(hObject,~)
paren_obj = get(hObject,'parent'); %tab
paren_obj_2 = get(paren_obj ,'parent'); % tabgroup
paren_obj_3 =  get(paren_obj_2 ,'parent'); % figure
try
    add_sub_1 = evalin('base','add_sub_1 ');
    add_surf_1 = evalin('base','add_surf_1');
    add_shoe_1 = evalin('base','add_shoe_1');
catch
    warndlg('Incorrect details entered for new data, please check and retry','Data Error');
    return
end

[filename,pathname] = uigetfile({'*.txt'},'File selector');
if isequal(filename,0)
    helpdlg('No data selected.',...
        'Operation cancelled');
else
    fullpathname = strcat(pathname,filename);
    assignin('base','fullfilepath',fullpathname);
    try
        [dat,var1,T_data] = readdata(filename); % T_data goes to database, dat for display
        editdatatable(dat,paren_obj_3);
    catch
        warndlg('Incorrect data type, please check and retry','Data Error');
    end
end
end

function [dat,var1,T_data] = readdata(filename)
%filename = 'Barry Indoor Shoe_19-07-09  05-11-47-556.txt';
opts = detectImportOptions(filename);
T = readtable(filename,opts);
%% Clear Extra Vars
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

% Order as headed by varnames
var1 = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
dat = [T_data(:,end),T_data(:,1:end-1)];
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
            shoe_str = fieldnames(getfield(getfield(athlete,sub2add),surf2add));
            for i =1:length(shoe_str)
                if strcmpi(shoe_str{i},asc)
                    count = count+1;
                end
            end
            if count ==0
                readbut.Visible ='on';
                assignin('base','add_shoe_1',asc);
            else
                warndlg('This shoe already exists for this specified details','Shoe Error');
            end
        catch
            readbut.Visible ='on';
            assignin('base','add_shoe_1',asc);
        end
    else
        warndlg('Please input valid name, incorrect name encountered','Shoe Error');
    end
    return
elseif strcmp(tag1,'hoes_n1') && isempty(as)
    warndlg('Please input valid name, incorrect name encountered','Shoe Error');
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
        message=["Clear the spaces and type the new surface's name.  See sample surface names using the 'EXISTING' option." ];
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
    
    messag=["Clear the space and type the new shoe's name. Common shoe names are:    1. TRAINERS 2. SPIKE" ];
    
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
            shoe_str = getfield(athlete,sub_i);
            message=["Select existing surface from the list provided.  Use the 'NEW' option if the surface does not exist."];
        catch
            message=["No surfaces found for specified athlete.  Select one of the common entries or use 'NEW' option if the desired surface does not exist."];
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
    elems = {'surfaces1_','surface1_'}; % SURFACE SELECTION BUTTONS
elseif strcmp(tag1(end-2),'s')
    assignin('base','add_sub_1',its)
    [data_out] = uppertolower(surf_str,1); % get string to display in surface buttons
    hf=findobj('Tag','urfaces_1');
    hf = hf(1);
    hf.String = data_out; % upsate string for surfaces
    hf=findobj('Tag','thletes_m');
    hf = hf(1);
    hf.String = [as{is} ' SELECTED' ];
    return
else
    assignin('base',strcat('sel_sub_',tag1(end)),its)
    elems = {'surfaces_','surface_'}; % SURFACE SELECTION BUTTONS
end

[data_out] = uppertolower(surf_str,1); % get string to display in surface buttons
data_out{length(data_out)+1} ='ADD NEW SURFACE';

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

function surface_1(hObject,~)
% Callback for shoe surface menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

if (~strcmp(tag1(end-2),'s') && is == length(as))
    if strcmp('surface_1',tag1) || strcmp('surface_2',tag1)
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
        
        assignin('base','n_surfaces',data_out);
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
    elems = {'shoes1_','shoe1_'}; % SHOE SELECTION BUTTONS
    assignin('base',strcat('sel_surf1_',tag1(end)),its);
    
elseif strcmp(tag1(end-2),'s')
    
    try
        sub_i = evalin('base','add_sub_1');
    catch
        warndlg('Please select an existing athlete first, no record found','Athlete Error');
        return
    end
    
    try
        shoe_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        [data_out] = uppertolower(shoe_str,1); % get string to display in surface buttons
        hf=findobj('Tag','hoes_m');
        hf = hf(1);
        message='Clear the spaces and type the new shoe name.  These shoes already exist:';
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
    % from main home shoe selection
    sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
    elems = {'shoes_','shoe_'}; % SHOE SELECTION BUTTONS
    assignin('base',strcat('sel_surf_',tag1(end)),its);
end

% get ID to find details from the database structure
shoe_str = fieldnames(getfield(getfield(athlete,sub_i),its));
[data_out] = uppertolower(shoe_str,1); % get string to display in shoe buttons
data_out{length(data_out)+1} ='ADD NEW SHOE';
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


function shoe_1(hObject,~)
% Callback for shoe popup menu
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');

if is == length(as)
    if strcmp('shoe_1',tag1) || strcmp('shoe_2',tag1)
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
        
        assignin('base','n_surfaces',data_out);
        assignin('base','add_sub_1',sub_i);
        
        hf.Value = ind;
        newthletes_1(fh); % call function to auto-select existing
        athlete_1(hf); % call function to select athlete
        
        % get and auto display surface
        surf_i = evalin('base','sel_surf1_1');
        %shoe_str = fieldnames(getfield(getfield(athlete,sub_i),its));
        shoe_str = fieldnames(getfield(getfield(athlete,sub_i),surf_i));
        [data_out] = uppertolower(shoe_str,1);
        hf = findobj('Tag','urfaces_1'); % get athletes drop down
        hf = hf(1);
        
        fh = findobj('Tag','urfaces1_3'); %get option of selecting existing
        fh = fh(1);
        
        asc = upper(surf_i); % get the selected subject and convert to the approriate format
        asc(regexp(asc,'_'))=' ';
        vf = findobj('Tag','surface1_1');
        vf = vf(1);
        ind=find(ismember(vf.String,asc));
        
        assignin('base','n_shoes',data_out);
        assignin('base','add_surf_1',surf_i);
        
        
        hf.Value = ind;
        newthletes_1(fh); % call function to auto-select existing
        surface_1(hf); % call function to select athlete
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
    surf_i = evalin('base',strcat('sel_surf1_',tag1(end)));  % get surface
    its(regexp(its,' '))='_';
    shoe_i = getfield(getfield(getfield(athlete,sub_i),surf_i),its);
    assignin('base',strcat('sel_shoe1_',tag1(end)),its);
    assignin('base',strcat('dat_shoe1_',tag1(end)),shoe_i.Data);
    plots_1(hObject,shoe_i.Data)
    return
else
    sub_i = evalin('base',strcat('sel_sub_',tag1(end))); % get subject 1
    surf_i = evalin('base',strcat('sel_surf_',tag1(end)));  % get surface
    its(regexp(its,' '))='_';
    shoe_i = getfield(getfield(getfield(athlete,sub_i),surf_i),its);
    assignin('base',strcat('sel_shoe_',tag1(end)),its);
    assignin('base',strcat('dat_shoe_',tag1(end)),shoe_i.Data);
end

elems = {'confirm_','confirm_'}; % SHOE CONFIRMATION BUTTONS
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

% fetch correponding shoe data
dat = dat(:,1:end-1);
var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
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
if strcmp(source_fig.Name,'UPDATE DATABASE')
    % get headers for table
    add_sub_1 = evalin('base','add_sub_1 ');
    add_surf_1 = evalin('base','add_surf_1');
    add_shoe_1 = evalin('base','add_shoe_1');
    assignin('base','tablesource','UPDATE DATABASE')
    close(source_fig);
else
    ori_tag = evalin('base','original_tag'); % for shoe 1 or 2
    add_sub_1 = evalin('base',strcat('sel_sub_',ori_tag));
    add_surf_1 = evalin('base',strcat('sel_surf_',ori_tag));
    add_shoe_1 = evalin('base',strcat('sel_shoe_',ori_tag));
    assignin('base','tablesource','SHOE')
end

banner = [add_shoe_1 ' DATA FOR ' add_surf_1 ' OF ' add_sub_1];
banner = upper(banner);
banner(regexp(banner,'_'))=' ';


var1 = {'TIME','LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
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
            dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
            dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
            sel_var_1 = evalin( 'base', 'sel_var_1');
            sel_var_2 = evalin( 'base', 'sel_var_2');
            sel_surf_1 = evalin( 'base', 'sel_surf_1');
            sel_surf_2 = evalin( 'base', 'sel_surf_2');
            sel_sub_1 = evalin( 'base', 'sel_sub_1');
            sel_sub_2 = evalin( 'base', 'sel_sub_2');
            sel_shoe_1 = evalin('base','sel_shoe_1');
            sel_shoe_2 = evalin('base','sel_shoe_2');
            
            var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
            var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};
            
            list_21 =var;
            sel_shoe_1(regexp(sel_shoe_1,'_'))=' ';
            sel_shoe_2(regexp(sel_shoe_2,'_'))=' ';
            
            sel_surf_1(regexp(sel_surf_1,'_'))=' ';
            sel_surf_1(regexp(sel_surf_1,'_'))=' ';
            
            sel_surf_2(regexp(sel_surf_2,'_'))=' ';
            sel_surf_2(regexp(sel_surf_2,'_'))=' ';
            
            sel_sub_2(regexp(sel_sub_2,'_'))=' ';
            sel_sub_1(regexp(sel_sub_1,'_'))=' ';
            
            FirstShoe=['ALL PEAKS OF ' list_21{sel_var_1} ' OF ' upper(sel_shoe_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)];
            SecondShoe=['ALL PEAKS OF ' list_21{sel_var_2} ' OF ' upper(sel_shoe_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)];
            
        catch
            warndlg('Incorrect selections made, please check and retry','Shoe Selection Error');
            return
        end
        
        shud_1 = findobj('Tag','shoe_data_prev1_1');
        shud_1 = shud_1(1);
        shud_1.String = FirstShoe;
        shud_2 = findobj('Tag','shoe_data_prev2_1');
        shud_2 = shud_2(1);
        shud_2.String = SecondShoe;
    catch
    end
    tgroup.SelectedTab = tab4;
    ot = 'Select the factors for each shoe';
    helpdlg(ot,'Factor/Sides Selection');
    return
end

try
    dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
    dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_shoe_1 = evalin('base','sel_shoe_1');
    sel_shoe_2 = evalin('base','sel_shoe_2');
catch
    warndlg('Incorrect selections made, please check and retry','Shoe Selection Error');
    return
end

tab4 = uitab('Parent', tgroup, 'Title', 'PEAK PREVIEW','BackgroundColor', 'blue');
var = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
var1 = {'TIME','L-H','L-F','L','R-F','R-H','R'};

% Spikes
list_5 ={};
num_peaks_1= 15;
num_peaks_2= 15;
for i=1:num_peaks_1
    list_5{i} = num2str(i);
end
list_5{num_peaks_1+1} = 'All';


list_21 =var;
sel_shoe_1(regexp(sel_shoe_1,'_'))=' ';
sel_shoe_2(regexp(sel_shoe_2,'_'))=' ';

sel_surf_1(regexp(sel_surf_1,'_'))=' ';
sel_surf_1(regexp(sel_surf_1,'_'))=' ';

sel_surf_2(regexp(sel_surf_2,'_'))=' ';
sel_surf_2(regexp(sel_surf_2,'_'))=' ';

sel_sub_2(regexp(sel_sub_2,'_'))=' ';
sel_sub_1(regexp(sel_sub_1,'_'))=' ';

FirstShoe=['ALL PEAKS OF ' list_21{sel_var_1} ' OF ' upper(sel_shoe_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)];
SecondShoe=['ALL PEAKS OF ' list_21{sel_var_2} ' OF ' upper(sel_shoe_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)];

assignin('base','FirstShoe',[list_21{sel_var_1} ' OF ' upper(sel_shoe_1) ' OF ' upper(sel_surf_1) ' OF ' upper(sel_sub_1)]);
assignin('base','SecondShoe',[list_21{sel_var_2} ' OF ' upper(sel_shoe_2) ' OF ' upper(sel_surf_2) ' OF ' upper(sel_sub_2)]);
% Create and populate tab

% Variable One
dat = [dat_shoe_1(:,end),dat_shoe_1(:,1:end-1)];


uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', FirstShoe,'Tag','shoe_data_prev1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.92 0.45 0.04]);%shoe 1 variable  preview of peaks button

a2 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move up','Tag','variables1_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.87 0.1 0.03],'Callback',@movelims); %move peak limits up button

a3 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move down','Tag','variables1_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.83 0.1 0.03],'Callback',@movelims);

% new
a4 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move up (+)','Tag','variables1_v2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.73 0.1 0.03],'Callback',@movelims2); %move peak limits up button

a5 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move down (-)','Tag','variables1_v3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.69 0.1 0.03],'Callback',@movelims2);
%new end


a6 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Update','Tag','variables1_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.6 0.1 0.04],'Callback',@confmovelims);


 uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Select Peak','Tag','variables1_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.48 0.1 0.04]);

 uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables1_6',...
    'Units','normal','Position', [0.02 0.44 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeaker);


 uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Spikes of Interest','Tag','variables1_10', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.02 0.34 0.1 0.04]);

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'From', 'HorizontalAlignment', 'left','Tag','variables1_11','BackgroundColor', 'green','Units', 'normal', 'Position', [0.02 0.3 0.04 0.04],'Callback', @peakinterest);

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'To', 'HorizontalAlignment', 'left','Tag','variables1_12','BackgroundColor', 'green','Units', 'normal', 'Position', [0.07 0.3 0.05 0.04],'Callback',@peakinterest);


list_6 = {'First X','Last X','Middle X','All'};
uicontrol('Parent', tab4,'Style', 'popup','String', list_6 ,'Tag','variables1_13',...
    'Units','normal','Visible','off','Position', [0.02 0.3 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeakareas); %shoe 2 variable  selection of spikes of peaks pop-up

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'Enter X', 'HorizontalAlignment', 'left','Tag','variables1_14','BackgroundColor', 'green','Units', 'normal', 'Position', [0.02 0.25 0.1 0.04],'Callback',@selectpeakareas);


uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Select Spike','Tag','variables1_7', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.02 0.2 0.1 0.04]);

uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables1_8',...
    'Units','normal','Visible','off','Position', [0.02 0.16 0.1 0.04],'BackgroundColor', 'green','Callback', @selectspikes);

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm','Tag','variables1_9', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.1 0.1 0.04],'Callback', @gotofinal);




pan_1 = uipanel('Parent',tab4,'Tag','datapre1_1','Position',[0.13 0.16 0.34 0.37],'Visible','off'); % shoe 1 preview figure
pan1_1 = uipanel('Parent',tab4,'Tag','datapre1_2','Position',[0.13 0.54 0.34 0.37],'Visible','on'); % shoe 1 preview figure
subplot(1,1,1,'Parent', pan_1) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on

titl = ['SELECTED ' var{1} ' PREVIEW'];
title(titl)

subplot(1,1,1,'Parent', pan1_1) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on

% Variable Two
dat = [dat_shoe_2(:,end),dat_shoe_2(:,1:end-1)];
uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', SecondShoe,'Tag','shoe_data_prev2_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.51 0.92 0.45 0.04]); %shoe 2 variable  preview of peaks button

a7 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move up','Tag','variables2_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.51 0.87 0.1 0.03],'BackgroundColor', 'green','Callback',@movelims); %move peak limits up button

a8 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move down','Tag','variables2_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.51 0.83 0.1 0.03],'BackgroundColor', 'green','Callback',@movelims); %move peak limits down button

% new
a9 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move up (+)','Tag','variables2_v2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.51 0.73 0.1 0.03],'Callback',@movelims2); %move peak limits up button

a10 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Move down (-)','Tag','variables2_v3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.51 0.69 0.1 0.03],'Callback',@movelims2);
%new end


a11 = uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Update','Tag','variables2_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.51 0.6 0.1 0.04],'Callback',@confmovelims); %update peak limits button

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Select Peak','Tag','variables2_5', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.51 0.48 0.1 0.04]);  %shoe 1 variable  selection of peaks button

uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables2_6',...
    'Units','normal','Position', [0.51 0.44 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeaker); % %shoe 2 variable  selection of peaks pop-up


uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Spikes of Interest','Tag','variables2_10', ...
    'HorizontalAlignment', 'left','Visible','off', 'Units','normal','Position', [0.51 0.34 0.1 0.04]);

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'From', 'HorizontalAlignment', 'left','Tag','variables2_11','BackgroundColor', 'green','Units', 'normal', 'Position', [0.51 0.3 0.04 0.04],'Callback', @peakinterest);

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'To', 'HorizontalAlignment', 'left','Tag','variables2_12','BackgroundColor', 'green','Units', 'normal', 'Position', [0.56 0.3 0.05 0.04],'Callback',@peakinterest);


list_6 = {'First X','Last X','Middle X','All'};
uicontrol('Parent', tab4,'Style', 'popup','String', list_6 ,'Tag','variables2_13',...
    'Units','normal','Visible','off','Position', [0.51 0.3 0.1 0.04],'BackgroundColor', 'green','Callback', @selectpeakareas); %shoe 2 variable  selection of spikes of peaks pop-up

uicontrol('Parent', tab4, 'Style', 'edit','Visible','off', 'String', 'Enter X', 'HorizontalAlignment', 'left','Tag','variables2_14','BackgroundColor', 'green','Units', 'normal', 'Position', [0.51 0.25 0.1 0.04],'Callback',@selectpeakareas);

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Select Spike','Tag','variables2_7', ...
    'HorizontalAlignment', 'left', 'Visible','off','Units','normal','Position', [0.51 0.2 0.1 0.04]); %shoe 1 variable  selection of spikes of peaks button

uicontrol('Parent', tab4,'Style', 'popup','String', list_5 ,'Tag','variables2_8',...
    'Units','normal','Visible','off','Position', [0.51 0.16 0.1 0.04],'BackgroundColor', 'green','Callback', @selectspikes); %shoe 2 variable  selection of spikes of peaks pop-up

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm','Tag','variables2_9', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','BackgroundColor', 'green','Position', [0.51 0.1 0.1 0.04],'Callback', @gotofinal); %confim spikes and peaks selection button for 2


pan_2 = uipanel('Parent',tab4,'Tag','datapre2_1','Position',[0.62 0.16 0.34 0.37],'Visible','off'); % all peaks preview
pan1_2 = uipanel('Parent',tab4,'Tag','datapre2_2','Position',[0.62 0.54 0.34 0.37],'Visible','on'); % spefics preview for peaks and spikes

subplot(1,1,1,'Parent', pan_2) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on


titl = ['SELECTED ' var{1} ' PREVIEW'];
title(titl)

subplot(1,1,1,'Parent', pan1_2) ;
plot(dat(:,2))
[w,~] = size(dat);
xlim([0 1.1*w])
zoom on

uicontrol('Parent', tab4, 'Style', 'pushbutton', 'String', 'Confirm && View Results >>>','Tag','done1_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible','off','BackgroundColor', 'green','Position', [0.02 0.05 0.94 0.04],'Callback', @confgotofinal); %variable 1 button

tgroup.SelectedTab = tab4;

% ot = 'Select the factors for each shoe';
% helpdlg(ot,'Factor/Sides Selection');
 elems = [a2,a3,a4,a5,a6,a7,a8,a9,a10,a11];
try
    doo = evalin('base','operation_mode');
    if doo == 2 % manual mode
        prototype = evalin('base', 'prototype');
       
        if prototype == 1
            
            for i = 1:length(elems)
                elems(i).Visible ='off';
                
            end
            pan1_1.Position = [0.02 0.54  0.45 0.37];
            pan1_2.Position = [0.51 0.54  0.45 0.37];
        else
            for i = 1:length(elems)
                elems(i).Visible = 'on';
                
            end
            pan1_1.Position = [0.13 0.54 0.34 0.37];
            pan1_2.Position = [0.62 0.54 0.34 0.37];
        end
    else
        for i = 1:length(elems)
            elems(i).Visible = 'on';
            
        end
        pan1_1.Position = [0.13 0.54 0.34 0.37];
        pan1_2.Position = [0.62 0.54 0.34 0.37];
    end
catch
    for i = 1:length(elems)
        elems(i).Visible = 'on';
        
    end
    pan1_1.Position = [0.13 0.54 0.34 0.37];
    pan1_2.Position = [0.62 0.54 0.34 0.37];
end


assignin('base','sel_peak_1',1);
assignin('base','sel_peak_2',1);
assignin('base','lim_graph',1);

selectpeaked(1,pan1_1);
selectpeaked(2,pan1_2);
 
end

function confirm1_1(hObject,~)


try
    dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
    dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_shoe_1 = evalin('base','sel_shoe_1');
    sel_shoe_2 = evalin('base','sel_shoe_2');
catch
    warndlg('Incorrect selections made, please check and retry','Shoe Selection Error');
    return
end

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
     x = evalin('base','dat_shoe_1(:,sel_var_1)');
     timer = evalin('base','dat_shoe_1(:,end)');
     la2 = evalin('base','sel_pera_1');
 else
     labe = 'Second';
     x = evalin('base','dat_shoe_2(:,sel_var_2)');
     timer = evalin('base','dat_shoe_2(:,end)');
     la2 = evalin('base','sel_pera_2');
 end
 
 xLimMode = 'auto';
 assignin('base','xLimMode',xLimMode)
 %x = cio;% meas(:,1);
 %  vLineX = randi(length(x));
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
 cr = plot(ax,[x(vLineX) x(vLineX)],ylim,'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback );
 cr.Color = 'green';
 colo = cr.Color;
 assignin('base','colo',colo)
 cr1 = plot(ax,[x(vLineX2) x(vLineX2)],ylim,'LineWidth',1.5 ,'ButtonDownFcn',@lineCallback );
 cr1.Color =  'red';
 %cr1.Color
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
%    src.YData = [1,5,7,8,9,11];
  %src
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

function logos(src,~)
   %src;
   
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
          set(po(4),'XData',[cp(1,1) cp(1,1)]);
          assignin('base','p_start', round(cp(1,1)));
%           x(round(cp(1)))
          %           cp(1,1) % x index
      end
  elseif colo(1) == 1 && colo(2) == 0 && colo(3) == 0
        %       % one for before fourth(last),red, get values above this as values for
      % end of peak
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(3),'XData',[cp(1,1) cp(1,1)]);
          assignin('base','p_end', round(cp(1,1)));
%           x(round(cp(1)))
          %           cp(1,1) % x index
      end
  elseif colo(1) == 0 && colo(2) == 0 && colo(3) == 0
      % one for second to last, black, get values above this as values for
      % peaks
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(2),'YData',[cp(2,2) cp(2,2)]);
          assignin('base','i_end', round(cp(2,2)));
          %           y(round(cp(2)))
          %           cp(2,2) %y value)
      end
  else
      % one for last, magenta, get values above this as peaks
      if mouseDown
          cp = get(ax,'CurrentPoint');
          set(po(1),'YData',[cp(2,2) cp(2,2)]);
          assignin('base','i_start', round(cp(2,2)));
          %           y(round(cp(2)))
          %           cp(2,2) %y value
      end
  end
  
end

function logo(src,~)
% co =get(0,'PointerLocation');
% cp = get(src,'CurrentPoint');

ax = get(src,'children');
po = get(ax,'children');
try
    ax = get(po{1},'children');
catch
    ax = get(po(1),'children');
end
ax = ax(end);
po = get (ax,'children');
xLimMode  = evalin('base','xLimMode');
set ( ax, 'xlimMode', xLimMode );
mouseDown = false;
assignin('base','mouseDown',mouseDown);

end

function confppeaks(hObject,~)
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
catch
    warndlg('Please adjust the boundaries and ensure that the Red is to the right of the green line and Black line is below cyan line','Boundary Specification Error');
    return 
end
if i_end < i_start &&  p_end>p_start
    if sel_done_1 ==1
        nate_e = {};
    else
        nate_e  = evalin('base',strcat('peaks_cell_',num2str(pe_modi)));
    end
    nate_e(sel_done_1) = {[ i_end,i_start,p_start,p_end]};
    assignin('base',strcat('peaks_cell_',num2str(pe_modi)),nate_e);
    hf = findobj('Title', 'PEAKS');
    hf = hf(1);
    gf = get(hf,'parent');
    gf1 = get(gf,'parent');
    gf1.Visible = 'off';
    %% go on
else
    warndlg('Red line must be to the right of the green line. Black line must be below cyan line','Boundary Specification Error');
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
[~,~,~,~,ind_peaks]  =  metch_data(data_ind,timer,pe_modi);
plot_reada(data_ind,ind_peaks,tab1)
end

%%
function [region,region_1,region_2,region_3,vecs] =  metch_data(data_ind,timer,pe_modi)
% get areas of interest
%peaks = data_ind > (mean(data_ind)+(3*(std(data_ind))));

biggle= evalin('base',strcat('peaks_cell_',num2str(pe_modi)));
disce = [];
for i = 1:length(biggle)
    disce = [disce;biggle{i}(end)];
end
assignin('base','ind_pea',disce);

region= {};
region_1= {};
region_2= {};
region_3= {};
% ind_peaks1 =  find(peaks1, sum(peaks1));
% con_in_groups = ind_peaks1(diff(ind_peaks1)==1);
%%
bor = {};

for i = 1:length(disce)
    ind_pea = disce;
    peaks = data_ind>biggle{i}(2);
    ind_peaks = find(peaks, sum(peaks));
    con_in_groups = ind_peaks(diff(ind_peaks)==1);
    ind_peaks = con_in_groups ;
    con_out_groups = [con_in_groups(1);con_in_groups(diff(con_in_groups)>5);con_in_groups(end)];
    peaks1 = data_ind>biggle{i}(1);
    ind_peaks1 =  find(peaks1, sum(peaks1));
    con_in_groups = ind_peaks1(diff(ind_peaks1)==1);
    if  i ==1
        % prior
        b = con_in_groups(con_in_groups<biggle{i}(3));
        b = flip(b);
        try 
            b = b(1:15);
        catch
        end
        b1 = b(diff(b)>-3);
        bota= [];
        for t = 1:length(b1)
            if abs(b1(t) - biggle{i}(3)) < 15
                bota = [bota;b1(t)];
            end
        end
        
        if ~isempty(b1) && abs(b(1)-biggle{i}(3))<3
            pre = bota(end);
        else
            pre = biggle{i}(3);
        end
        
        %post
        b = con_in_groups>ind_pea(1) ;
        try
            b1 = con_in_groups<ind_pea(2) ;
        catch  
            b1 = con_in_groups<con_in_groups(end) ;
        end
        b2 = con_in_groups(b+b1 == 2);
        try 
            b2 = b2(1:15);
        catch
        end
        b = b2(diff(b2)<3);
        
        bota= [];
        for t = 1:length(b)
            if abs(b(t) - ind_pea(i)) < 15
                bota = [bota;b(t)];
            end
        end
        if ~isempty(b) && abs(b2(1)-ind_pea(i))<3
            post = bota(end);
        else
            post = ind_pea(i);
        end
   
    elseif i>1&& i<length(ind_pea)
        
        cita = biggle{i}(3);
        b3 = con_in_groups<cita ;
        b4 = con_in_groups>ind_pea(i-1) ;
        b = con_in_groups(b3+b4 == 2);
        b2 = flip(b);
        try 
            b2 = b2(1:15);
        catch
        end
        
        b = b2(diff(b2)>-3);
        bota= [];
        for t = 1:length(b)
            if abs(cita  - b(t)) < 15
                bota = [bota;b(t)];
            end
        end
        
        if ~isempty(b) && abs(b2(1)-cita)<3
            pre = bota(end);
        else
            pre = cita;
        end
        
        % post
        cita = biggle{i+1}(3); % beginnig of a peak
        
        b3 = con_in_groups>ind_pea(i) ;
        b4 = con_in_groups<cita ;
        b2 = con_in_groups(b3+b4 == 2); 
        try
            b2 = b2(1:15);
        catch
        end
        b = b2(diff(b2)<3);
        bota= [];
        for t = 1:length(b)
            if abs(b(t) - ind_pea(i)) < 15
                bota = [bota;b(t)];
            end
        end
        if ~isempty(b) && abs(b2(1)-ind_pea(i))<3
            post = bota(end);
        else
            post = ind_pea(i);
        end
   
    else
        %prior
        
        cita = biggle{i}(3);
        
        b3 = con_in_groups<cita ;
        b4 = con_in_groups>ind_pea(i-1) ;
        b = con_in_groups(b3+b4 == 2);
        b2 = flip(b);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)>-3);
        
        bota= [];
        for t = 1:length(b1)
            if abs(b1(t) - cita ) < 15
                bota = [bota;b1(t)];
            end
        end
        
        if ~isempty(b1) && abs(b2(1)-cita)<3
            pre = bota(end);
        else
            pre = cita;
        end
        
        %post

        cita = ind_pea(i);
        
        cil = con_in_groups>ind_pea(i);
        b2 = con_in_groups(cil);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)<3);
        
        bota= [];
        for t = 1:length(b1)
            if abs(b1(t) - cita ) < 15
                bota = [bota;b1(t)];
            end
        end

        if ~isempty(b1)  && abs(b2(1)-cita)<3
            post = bota(end);
        else
            post = ind_pea(i);
        end
    end    
    bor{i} = [pre;post];
end
%
vecs = [];
for i =1:length(bor)
    az = find(con_in_groups<=bor{i}(1),1,'last');
    az1 = find(con_in_groups<=bor{i}(2),1,'last');
    con_in_groupa = con_in_groups(az:az1);
    roter_1= [con_in_groupa(1);con_in_groupa(diff(con_in_groupa)>5);con_in_groupa(end)];
    
    try
        sototype = evalin('base','sototype');
    catch
         sototype  = 2;      
    end
    
    if sototype ==1
   
        try
            try
                cur_l=evalin('base','cur_lim');
            catch
                warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
                return
            end
            try
                try
                    cur_l=evalin('base','cur_lim');
                    lim_graph = evalin('base','lim_graph');
                    cond_peaks=evalin('base',strcat('cond_peaks',cur_l));
                    peak_spec=evalin('base',strcat('peak_spec',cur_l));
                    avail= evalin('base',strcat('avai_spik_',cur_l));
                    if lim_graph == 1
                        if str2double(peak_spec)>avail
                            warndlg('Please select a value less or equal to the maximum available','Index Error');
                            return
                        end
                        if cond_peaks==1
                            v1 = 1;
                            v2 = str2double(peak_spec);
                        elseif cond_peaks==2
                            v2 = length(roter_1);
                            v1 = (length(roter_1)-str2double(peak_spec));
                        elseif cond_peaks==3
                            des_roter_1 = length(roter_1)-((str2double(peak_spec))+1);
                            v1 = ceil(des_roter_1/2)+1;
                            v2 = length(roter_1)-(floor(des_roter_1/2));
                        else
                            v1 = 1;
                            v2 = avail+1;
                        end
                        des_roter_1 = roter_1(v1:v2);
                    else
                        try
                            des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                            des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                            des_roter_1 = roter_1((des_spike_1):(des_spike_2+1));
                        catch
                            des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                            des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                            des_roter_1 = roter_1(des_spike_1:(des_spike_2));
                        end
                    end
                catch
                    try
                        des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                        des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                        des_roter_1 = roter_1((des_spike_1):(des_spike_2+1));
                    catch
                        des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                        des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                        des_roter_1 = roter_1(des_spike_1:(des_spike_2));
                    end
                    
                end
            catch
                if (length(roter_1)>=10) && (length(roter_1)<16)
                    des_roter_1 = roter_1 ;
                else
                    des_roter_1 = length(roter_1)-16;
                    des_roter_1 = roter_1(ceil(des_roter_1/2)+1:end-floor(des_roter_1/2));
                end
            end
        catch
            if (length(roter_1)>=10) && (length(roter_1)<16)
                des_roter_1 = roter_1 ;
            else
                des_roter_1 = length(roter_1)-16;
                des_roter_1 = roter_1(ceil(des_roter_1/2)+1:end-floor(des_roter_1/2));
            end
        end
  
    else
        try
            try
                cur_l=evalin('base','cur_lim');
            catch
                pe_modi = evalin('base','pe_modi');
                cur_l = num2str(pe_modi);
            end
        catch
            warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
            return
        end
        des_roter_1 = roter_1 ;
    end

   
    vecs =[vecs;con_in_groupa];
    %
    oer= {};
    doer= {};
    doerer= {};
    des_roter_1 = unique(des_roter_1);
    for j = 2:length(des_roter_1)
        a1=con_in_groups>des_roter_1(j-1);
        a2=con_in_groups<=des_roter_1(j);
        ed = a1==a2; edw = con_in_groups(find(ed, sum(ed)));
        ed0 = edw(end)+1;
        ed = [edw;ed0];
        oer(j-1)={data_ind(ed)};
        doer(j-1)= {ed};
        doerer(j-1)= {timer(ed)};
    end
    region(i) = {oer};
    region_1(i) = {doer};
    region_2(i) = {doerer};
    region_3(i) = {roter_1};
end
assignin('base','ind_peaks',vecs)
end

function plot_reada(data_ind,ind_peaks,tab1)

ax = axes ( 'parent', tab1, 'position', [0.03 0.05 0.87 0.93]);

uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'OK-Continue >>>','Tag','yuhletes_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.93 0.08 0.05],'BackgroundColor', 'green','Callback',@confp_done); %athlete 1 button
uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'NO-Retry >>>','Tag','yuhletes_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.91 0.05 0.08 0.05],'BackgroundColor', 'red','Callback',@denyp_done); %athlete 1 button
plot(data_ind,'-p','MarkerIndices',ind_peaks,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',3);

end


function confp_done(hObject,~)
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
if (sel_done -1) < sel_pera
     peakseditor;
    
else
    if pe_modi == 1
        opts.Interpreter = 'tex';
        opts.Default = 'Continue';
        quest = 'Peaks Specification Done First Subject, Continue To Specify Peaks For Next Subject';
        answer = questdlg(quest,'Second Subect Peaks Specification',...
            'Continue',opts);
        if strcmp(answer,'Continue')
            %             [colo,mouseDown,xLimMode,timer,x]  = peakseditor;
            assignin('base','pe_modi', 2);
            data = evalin('base','dat_shoe_2(:,sel_var_2)');
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
            obd = findobj('Tag','confirm1_1');
            hob = obd(1);
            hob.Visible = 'on';
            confirmz_1(hob);
        end
    end
end


end

function denyp_done(hObject,~)
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


%
function confgotofinal(hObject,~)
% See if tab5 exits and close

ob_tab= get(hObject,'parent'); % GET PARENT TAB OF OBJECT
tgroup= get(ob_tab,'parent'); % GET TAB GROUP

tab5 = findobj('Title','RESULTS');
if ~isempty(tab5)
    delete(tab5);
end
tab6 = findobj('Title','RESULTS-2');
if ~isempty(tab6)
    delete(tab6);
end

try
    dat_shoe_1 = evalin( 'base', 'dat_shoe_1');
    dat_shoe_2 = evalin( 'base', 'dat_shoe_2');
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    sel_surf_1 = evalin( 'base', 'sel_surf_1');
    sel_surf_2 = evalin( 'base', 'sel_surf_2');
    sel_sub_1 = evalin( 'base', 'sel_sub_1');
    sel_sub_2 = evalin( 'base', 'sel_sub_2');
    sel_shoe_1 = evalin('base','sel_shoe_1');
    sel_shoe_2 = evalin('base','sel_shoe_2');
    sel_spike_1 = evalin('base','sel_spike_1');
    sel_spike_2 = evalin('base','sel_spike_2');
    sel_peak_1 = evalin('base','sel_peak_1');
    sel_peak_2 = evalin('base','sel_peak_2');
    num_peaks_1 = evalin('base','num_peaks_1');
    num_peaks_2 = evalin('base','num_peaks_2');
    res = evalin('base','res_1');
    res_2 = evalin('base','res_2');
    rester = evalin('base','rester_1');
    rester_2 = evalin('base','rester_2');
    trap_area = evalin('base','trap_area_1');
    trap_area_2 = evalin('base','trap_area_2');
    SecondShoe = evalin( 'base','SecondShoe');
    FirstShoe = evalin( 'base','FirstShoe');
    
catch
    warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
    return
end

tab5 = uitab('Parent', tgroup, 'Title', 'RESULTS','BackgroundColor', 'cyan');
tab6 = uitab('Parent', tgroup, 'Title', 'RESULTS-2','BackgroundColor', 'cyan');

pullresult(tab5,tab6);

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
else
    tgroup.SelectedTab = tab6;
    uicontrol('Parent', tab6, 'Style', 'pushbutton', 'String', 'Close && Exit >>>','Tag','clone1_1', ...
        'HorizontalAlignment', 'left', 'Units','normal','Visible','on','BackgroundColor', 'red','Position', [0.01 0.01 0.98 0.03],'Callback', @confexit); %variable 1 button
end
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
    load('athletes.mat'); % load database
    athlete = athleten;
    athl = fieldnames(athlete); % get listed athletes
    assignin('base','pathed',pathed);
    assignin('base','athlete',athlete);
    %% get athletes info for display
    athletes = uppertolower(athl,1);
    athletes{length(athletes)+1} ='ADD NEW ATHLETE';
    assignin('base','athletes',athletes)
    % dummy surfaces and shoes info
    surfaces = {'Surface A','Surface B','Surface C', 'Add New Surface'};
    assignin('base','surfaces',surfaces)
    shoes = {'Shoe A', 'Shoe B', 'Shoe C', 'Add New Shoe'};
    assignin('base','shoes',shoes);
    Analyze()
end
end

function pullresult(fig_1,fig_2)

sel_var_1 = evalin( 'base', 'sel_var_1');
sel_var_2 = evalin( 'base', 'sel_var_2');
sel_spike_1 = evalin('base','sel_spike_1');
sel_spike_2 = evalin('base','sel_spike_2');
sel_peak_1 = evalin('base','sel_peak_1');
sel_peak_2 = evalin('base','sel_peak_2');
num_peaks_1 = evalin('base','num_peaks_1');
num_peaks_2 = evalin('base','num_peaks_2');
res = evalin('base','res_1');
res_2 = evalin('base','res_2');
rester = evalin('base','rester_1');
rester_2 = evalin('base','rester_2');
trap_area = evalin('base','trap_area_1');
trap_area_2 = evalin('base','trap_area_2');
SecondShoe = evalin( 'base','SecondShoe');
FirstShoe = evalin( 'base','FirstShoe');

if (sel_peak_1 > num_peaks_1) && (sel_peak_2 > num_peaks_2)
    comp_peaks(fig_1)
    return
    
else
    try
        lev1= str2double(evalin('base',strcat('des_spike_11')));
        lev2 = str2double(evalin('base',strcat('des_spike_12')));
        le1= str2double(evalin('base',strcat('des_spike_21')));
        le2 = str2double(evalin('base',strcat('des_spike_22')));
        difer1 = (lev2 - lev1)+2;
        difer2 = (le2 - le1)+2;
        if (sel_spike_1==difer1) && (sel_spike_2== difer2)
            comp_spikes(fig_1)
            return
        else
        end
    catch
    end
    goter = [sel_spike_1,sel_spike_2];
    gote = [sel_var_1,sel_var_2];
    got = [sel_peak_1,sel_peak_2];
    
    for o=1:length(goter)
        if isempty(get(fig_1, 'Children'))
            pang_1 = fig_1;
        else
            pang_1 = fig_2;
        end
        sel_spike_k = goter(o);
        sel_var_k = gote(o);
        sel_peak_k = got(o);
        try
            lev1= str2double(evalin('base',strcat('des_spike_',num2str(o),'1')));
            lev2 = str2double(evalin('base',strcat('des_spike_',num2str(o),'2')));
            difer = (lev2 - lev1)+2;
        catch
        end
        try
            if sel_spike_k<difer
                if o == 1
                    dat = res{sel_var_k}{sel_peak_k};
                else
                    dat = res_2{sel_var_k}{sel_peak_k};
                end
                if sel_spike_k> length(dat)
                    sel_spike_k = length(dat);
                end
                
                if o == 1
                    dater = res{sel_var_k}{sel_peak_k}{sel_spike_k};
                    timers = rester{sel_var_k}{sel_peak_k}{sel_spike_k};
                else
                    dater = res_2{sel_var_k}{sel_peak_k}{sel_spike_k};
                    timers = rester_2{sel_var_k}{sel_peak_k}{sel_spike_k};
                end
                area_1 = trapz(timers,dater)*100;
                if sel_spike_1<difer && sel_spike_2<difer
                    subplot(2,1,o,'parent',pang_1)
                end
                subplot(1,1,1,'parent',pang_1)
                area(timers,dater,'FaceColor',[0.75 0.55 0]);
                %             title(['Area covered = ' num2str(area_1) ])
                avg_fr = round(mean(dater));
                tot_fr = round(sum(dater));
                std_fr = round(std(dater),1);
                diff_ti = (timers(end)-timers(1)) + 0.01;
                
                if o == 1
                    titl = ['AREA = ' num2str(area_1) '; FORCE: Total = ' num2str(tot_fr) ' Mean: ' num2str(avg_fr) ' STD: ' num2str(std_fr) '; CONTACT TIME = ' num2str(diff_ti) ' BY SPIKE ' num2str(sel_spike_1) ' OF PEAK ' num2str(sel_peak_k) ' OF ' FirstShoe] ;% ' by Spike ' num2str(sel_spike_k) ' of ' list_11{sel_shoe_1} ': ' list_21{sel_var_k} ': Peak ' num2str(sel_peak_k)])
                    uicontrol('Parent', pang_1, 'Style', 'pushbutton', 'String', upper(titl),'Tag','plut1', ...
                        'HorizontalAlignment', 'left', 'Units','normal','Visible','on','Position', [0.05 0.95 0.9 0.04]); %surface 1 button
                else
                    titl =['AREA = ' num2str(area_1) '; FORCE: Total = ' num2str(tot_fr) ' Mean: ' num2str(avg_fr) '; CONTACT TIME = ' num2str(diff_ti) ' BY SPIKE ' num2str(sel_spike_2) ' OF PEAK '  num2str(sel_peak_k) ' OF ' SecondShoe];% ' by Spike ' num2str(sel_spike_k) ' of ' list_11{sel_shoe_2} ': ' list_21{sel_var_k} ': Peak ' num2str(sel_peak_k)])
                    uicontrol('Parent', pang_1, 'Style', 'pushbutton', 'String', upper(titl),'Tag','plut1', ...
                        'HorizontalAlignment', 'left', 'Units','normal','Visible','on','Position', [0.05 0.95 0.9 0.04]); %surface 1 button
                end
                
                xlim([min(timers )*0.999995 max(timers )*1.000005])
                xlabel('Time')
                ylabel('Readings')
            elseif sel_spike_k==difer
                if o == 1
                    plot_areas(sel_var_k,res,sel_spike_k,sel_peak_k,rester,FirstShoe,fig_1,fig_2)
                else
                    plot_areas(sel_var_k,res_2,sel_spike_k,sel_peak_k,rester_2,SecondShoe,fig_1,fig_2)
                end
            end
        catch
        end
    end
    gote = [sel_var_1,sel_var_2];
    got = [sel_peak_1,sel_peak_2];
    for o = 1:length(gote)
        sel_var_k = gote(o);
        sel_peak_k = got(o);
        if o == 1
            dat = res{sel_var_k};
        else
            dat = res_2{sel_var_k};
        end
        if sel_peak_k>length(dat)
            if o == 1
                [speaked_1,sb,sum_1,mean_1,std_1,sum_2,mean_2,std_2,sum_3,mean_3,sum_4,mean_4,sum_5,mean_5]= tablevalues(trap_area,sel_var_k,rester,res);
                %[speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1,rester,res);
                [speaked_2,~,sum_12,mean_12,std_12,sum_22,mean_22,std_22,sum_32,mean_32,sum_42,mean_42,sum_52,mean_52] = tablevalues(trap_area,sel_var_k,rester,res);
                
            else
                [speaked_1,sb,sum_1,mean_1,std_1,sum_2,mean_2,std_2,sum_3,mean_3,sum_4,mean_4,sum_5,mean_5] = tablevalues(trap_area_2,sel_var_2,rester_2,res_2);
                %[speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1,rester,res);
                [speaked_2,~,sum_12,mean_12,std_12,sum_22,mean_22,std_22,sum_32,mean_32,sum_42,mean_42,sum_52,mean_52] = tablevalues(trap_area_2,sel_var_2,rester_2,res_2);   
            end
            
            if o == 1
                FirstShoes=['ALL PEAKS OF ' FirstShoe];%' list_21{sel_var_1} ' of ' list_11{sel_shoe_1}];
                SecondShoes=['ALL PEAKS OF '  FirstShoe]; % ' list_21{sel_var_2} ' of ' list_11{sel_shoe_1}];
            else
                FirstShoes=['ALL PEAKS OF '  SecondShoe];% list_21{sel_var_1} ' of ' list_11{sel_shoe_2}];
                SecondShoes=['ALL PEAKS OF '  SecondShoe];% list_21{sel_var_2} ' of ' list_11{sel_shoe_2}];
            end
            dat_1 = res{sel_var_1};
            dat_2 = res_2{sel_var_2};
            if sel_peak_1>length(dat_1) && sel_peak_2>length(dat_2)
                
                editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_12,mean_1,mean_12,FirstShoes,SecondShoes,1,fig_1,fig_2)
                return
            else
                if o ==2
                    FirstShoes = SecondShoes;
                    sum_1 =sum_2;
                    mean_1=mean_2;
                    speaked_1= speaked_2;
                end
                editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_12,mean_1,mean_12,FirstShoes,SecondShoes,0,fig_1,fig_2)
            end
        else
        end
    end
end
end

function comp_spikes(hObject,~)

tgroup = uitabgroup('Parent', hObject,'SelectionChangedFcn',@resultar); % sub tab-  plot types

% assignin('base','tgroups',tgroup);
% tab5.Tag = 'resultstab';
tab50 = uitab('Parent', tgroup,'Tag','plottypes1', 'Title', 'Bar Chart','BackgroundColor', 'blue');
tab51 = uitab('Parent', tgroup,'Tag','plottypes2', 'Title', 'Pie Chart','BackgroundColor', 'blue');
tab52 = uitab('Parent', tgroup,'Tag','plottypes3', 'Title', 'Line Plot','BackgroundColor', 'blue');
tab53 = uitab('Parent', tgroup,'Tag','plottypes4', 'Title', 'Area Plot','BackgroundColor', 'blue');
tab54 = uitab('Parent', tgroup, 'Tag','plottypes5','Title', 'Graphs','BackgroundColor', 'blue');
tab55 = uitab('Parent', tgroup,'Tag','plottypes6', 'Title', 'Default','BackgroundColor', 'blue');
figo(tab50);
end
%%
function comp_peaks(hObject,~)

tgroup = uitabgroup('Parent', hObject,'SelectionChangedFcn',@resultar_p);

tab5.Tag = 'resultstab';
tab50 = uitab('Parent', tgroup,'Tag','plottypes1', 'Title', 'Bar Chart','BackgroundColor', 'blue');
tab51 = uitab('Parent', tgroup,'Tag','plottypes2', 'Title', 'Pie Chart','BackgroundColor', 'blue');
tab52 = uitab('Parent', tgroup,'Tag','plottypes3', 'Title', 'Line Plot','BackgroundColor', 'blue');
tab53 = uitab('Parent', tgroup,'Tag','plottypes4', 'Title', 'Area Plot','BackgroundColor', 'blue');
tab54 = uitab('Parent', tgroup,'Tag','plottypes5', 'Title', 'Default','BackgroundColor', 'blue');
figo_p(tab50);
end

function figo(tab50,~)
% Callback for spikes
tgroup2 = uitabgroup('Parent', tab50,'SelectionChangedFcn',@resultar1); % sub-tabs for plot types

tab60 = uitab('Parent', tgroup2,'Tag','restypes1', 'Title', 'Area','BackgroundColor', 'blue');
tab69 = uitab('Parent', tgroup2,'Tag','restypes6', 'Title', 'Maximum Force','BackgroundColor', 'blue');
tab61 = uitab('Parent', tgroup2,'Tag','restypes2', 'Title', 'Total Force','BackgroundColor', 'blue');
tab62 = uitab('Parent', tgroup2,'Tag','restypes3', 'Title', 'Average Force','BackgroundColor', 'blue');
tab63 = uitab('Parent', tgroup2, 'Tag','restypes4', 'Title', 'Forces Standard Deviation','BackgroundColor', 'blue');
tab64 = uitab('Parent', tgroup2,'Tag','restypes5', 'Title', 'Contact Time','BackgroundColor', 'blue');

figo1(tab60,tab50);

end

function figo1(tab60,tab50)
% Callback for spikes continued
uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Select Spikes','Tag','see_spikes_1', ...
    'HorizontalAlignment', 'left', 'Units','normal','Position', [0.02 0.93 0.08 0.04]); %athlete 1 button

uicontrol('Parent', tab60, 'Style', 'edit', 'String', 'From','Tag','see_spikes_2', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.86 0.08 0.04],'Callback', @fijia1); %athlete 1 butto


onl = uicontrol('Parent', tab60, 'Style', 'edit', 'String', 'lim','Tag','see_spikes_3', ...
    'HorizontalAlignment', 'left', 'Units','normal','BackgroundColor', 'green','Position', [0.02 0.8 0.08 0.03],'Callback', @fijia1); %athlete 1 butto


uicontrol('Parent', tab60, 'Style', 'pushbutton', 'String', 'Update','Tag','conf_see_spikes_4', ...
    'HorizontalAlignment', 'left', 'Units','normal','Visible', 'off','BackgroundColor', 'green','Position', [0.02 0.7 0.08 0.03],'Callback', @fijia); %athlete 1 butto


pan_1 = uipanel('Parent',tab60,'Tag','resultpres_1','Position',[0.11 0.01 0.88 0.96],'Visible','on'); % shoe 1 preview figure

try
    
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    
    sel_spike_1 = evalin('base','sel_spike_1');
    sel_spike_2 = evalin('base','sel_spike_2');
    sel_peak_1 = evalin('base','sel_peak_1');
    sel_peak_2 = evalin('base','sel_peak_2');
    
    res_1 = evalin('base','res_1');
    res_2 = evalin('base','res_2');
    rester_1 = evalin('base','rester_1');
    rester_2 = evalin('base','rester_2');
    
catch
    warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
    return
end

shoename_1 = 1;
shoename_2 =2;
type = tab50.Tag(end);
type = str2double(type);
caser= tab60.Tag(end);
caser = str2double(caser);

try
    s_spike_2 = str2double(evalin('base','s_spike_2'));
    s_spike_3 = str2double(evalin('base','s_spike_3'));
catch
    op = length(res_1{sel_var_1}{sel_peak_1});
    ope =  length(res_2{sel_var_2}{sel_peak_2});
    s_spike_3 = max(op,ope);
    s_spike_2 = 1;
end

op = length(res_1{sel_var_1}{sel_peak_1});
ope =  length(res_2{sel_var_2}{sel_peak_2});
nuno = max(op,ope);

if (s_spike_3>nuno)
    s_spike_3 = max(op,ope);
end

if (s_spike_2>nuno) || (s_spike_2>nuno)
    s_spike_2 =1 ;
end

str= ['To (Max =' num2str(nuno) ')'];

onl.String = str;

if (s_spike_3-s_spike_2)>14 && type~=6
    s_spike_3 = s_spike_2+14;
end

if s_spike_3<s_spike_2
    s_spike_3 = s_spike_2+1;
end
plots_areas(s_spike_2,s_spike_3,sel_var_1,sel_var_2,res_1,res_2,sel_spike_1,sel_spike_2,sel_peak_1,sel_peak_2,rester_1,rester_2,shoename_1,shoename_2,pan_1,type,caser)
assignin('base','cur_tab1',tab60)
assignin('base','cur_tab',tab50)
end

%%
function figo_p(tab50,~)
% Callback for peaks
tgroup2 = uitabgroup('Parent', tab50,'SelectionChangedFcn',@resultar1_p); % sub-tabs for plot types

tab60 = uitab('Parent', tgroup2,'Tag','restypes1', 'Title', 'Average Area','BackgroundColor', 'blue');
tab61 = uitab('Parent', tgroup2,'Tag','restypes2', 'Title', 'Total Area','BackgroundColor', 'blue');
tab62 = uitab('Parent', tgroup2,'Tag','restypes3', 'Title', 'Areas Standard deviation','BackgroundColor', 'blue');
tab69 = uitab('Parent', tgroup2,'Tag','restypes10', 'Title', 'Maximum Force','BackgroundColor', 'blue');
tab63 = uitab('Parent', tgroup2, 'Tag','restypes4', 'Title', 'Average Force','BackgroundColor', 'blue');
tab64 = uitab('Parent', tgroup2,'Tag','restypes5', 'Title', 'Total Force','BackgroundColor', 'blue');
tab65 = uitab('Parent', tgroup2,'Tag','restypes6', 'Title', 'Forces Standard deviation','BackgroundColor', 'blue');

tab67 = uitab('Parent', tgroup2,'Tag','restypes8', 'Title', 'Average Contact Time','BackgroundColor', 'blue');
tab66 = uitab('Parent', tgroup2,'Tag','restypes7', 'Title', 'Total Contact Time','BackgroundColor', 'blue');
tab68 = uitab('Parent', tgroup2, 'Tag','restypes9', 'Title', 'Contact Times Standard Deviation','BackgroundColor', 'blue');
figo1_p(tab60,tab50);
end

function figo1_p(tab60,tab50)
% Callback for peaks continued
pan_1 = uipanel('Parent',tab60,'Tag','resultpres_1','Position',[0.01 0.01 0.98 0.98],'Visible','on'); % shoe 1 preview figure

try
    sel_var_1 = evalin( 'base', 'sel_var_1');
    sel_var_2 = evalin( 'base', 'sel_var_2');
    res_1 = evalin('base','res_1');
    res_2 = evalin('base','res_2');
    rester_1 = evalin('base','rester_1');
    rester_2 = evalin('base','rester_2');
    trap_area_1 = evalin('base','trap_area_1');
    trap_area_2 = evalin('base','trap_area_2');
catch
    warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
    return
end

type = tab50.Tag(end);
type = str2double(type);
caser= tab60.Tag(end);
caser = str2double(caser);

plots_areas_1(trap_area_1,trap_area_2,sel_var_1,sel_var_2,res_1,res_2,rester_1,rester_2,pan_1,type,caser)

assignin('base','cur_tab1',tab60)
assignin('base','cur_tab',tab50)
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

figo1(tab60,tab50)
end

function fijia1(hObject,~)
% callback for user defined range of spikes
tag1 = get(hObject,'Tag');
as = get(hObject,'String');

if ~isempty(as) && ~isnan(str2double(as))
    assignin('base', strcat('s_spike_',tag1(end)),as);
else
    warndlg('Please enter a numeric value','Index Error');
    return
end

if strcmp(tag1(end),'3')  % check if it is te confirm button
    try
        fr =  evalin('base','s_spike_2');
        fr1 =  evalin('base','des_spike_11');
        fr2 =  evalin('base','des_spike_12');
        fr3 =  evalin('base','des_spike_21');
        fr4 =  evalin('base','des_spike_22');
        z1 = str2double(fr2) - str2double(fr1);
        z2 = str2double(fr4) - str2double(fr3);
        z1 = z1+1;
        z2 = z2+1;
        %         sr1=evalin('base','avai_spikes_1');
        %         sr2=evalin('base','avai_spikes_2');
        %         sr1 = max(sr1-1,sr2-1);
        sr1 = max(z1,z2);
        assignin('base','redo_spikes',sr1);
        sr = as;
        if str2double(sr)>sr1
            warndlg('Please select a value less or equal to the maximum available','Index Error');
            return
        end
        if str2double(fr)<str2double(sr)
            
            hf=findobj('Tag','conf_see_spikes_4');
            for i = 1:length(hf)
                hf(i).Visible = 'on';
            end
        else
            
            hf=findobj('Tag','conf_see_spikes_4');
            
            for i = 1:length(hf)
                hf(i).Visible = 'off';
            end
            warndlg('Please complete the required fields correctly and retry','Specification Error');
            
        end
        
    catch e
        %         fprintf(1,'The identifier was:\n%s',e.identifier);
        %         fprintf(1,'There was an error! The message was:\n%s',e.message);
        warndlg('Please complete the required fields and retry','Specification Error');
        hf=findobj('Tag','conf_see_spikes_4');
        hf =hf(1);
        hf.Visible = 'off';
    end
    return
end

end

function  plots_areas(a1,b1,sel_var_1,sel_var_2,res_1,res_2,sel_spike_1,sel_spike_2,sel_peak_1,sel_peak_2,rester_1,rester_2,shoename_1,shoename_2,fig,type,caser)

% children = get(fig, 'children');
% children
% delete(children);

if  sel_peak_1<=length(res_1{sel_var_1})
    dat_1 = res_1{sel_var_1}{sel_peak_1};
    ker_1 = sel_spike_1-1;
end

if  sel_peak_2<=length(res_2{sel_var_2})
    dat_2 = res_2{sel_var_2}{sel_peak_2};
    ker_2 = sel_spike_2-1;
end


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
    elseif type ==5 && i==1
        fi1 = uipanel('Parent',fig,'Tag','graphtpres_1','Position',[0.02 0.52 0.99 0.47],'Visible','on'); % shoe 1 preview figure
        fi2 = uipanel('Parent',fig,'Tag','graphtpres_2','Position',[0.02 0.02 0.99 0.47],'Visible','on'); % shoe 1 preview figure
    elseif type == 3 || type==4
        subplot(1,1,1,'parent',fig);
    elseif type == 6
        as1 = uitable('Parent', fig,'Units', 'normal','Position',[0.02  0.05 0.96 0.85],...
            'Visible','on','Tag','tabletabdata2' );
    end
    
    try
        dater_1 = res_1{sel_var_1}{sel_peak_1}{sel_var_i};
        timers_1 = rester_1{sel_var_1}{sel_peak_1}{sel_var_i};
        dater_2 = res_2{sel_var_2}{sel_peak_2}{sel_var_i};
        timers_2 = rester_2{sel_var_2}{sel_peak_2}{sel_var_i};
        
        switch caser
            case 1
                area_1 = trapz(timers_1,dater_1)*100;
                area_2 = trapz(timers_2,dater_2)*100;
                b = [area_1;area_2];
            case 2
                tot_fr_1 = round(sum(dater_1));
                tot_fr_2 = round(sum(dater_2));
                b = [tot_fr_1;tot_fr_2];
            case 3
                avg_fr_1 = round(mean(dater_1));
                avg_fr_2 = round(mean(dater_2));
                b = [avg_fr_1;avg_fr_2];
            case 4
                std_fr_1 = round(std(dater_1));
                std_fr_2 = round(std(dater_2));
                b = [std_fr_1;std_fr_2];
            case 5
                diff_ti_1 = (timers_1(end)-timers_1(1)) + 0.01;
                diff_ti_2 = (timers_2(end)-timers_2(1)) + 0.01;
                b = [diff_ti_1;diff_ti_2 ];
            case 6
                tot_fr_1 = max(dater_1);
                tot_fr_2 = max(dater_2);
                b = [tot_fr_1;tot_fr_2];          
        end
        
    catch
        try
            dater_1 = res_1{sel_var_1}{sel_peak_1}{sel_var_i};
            timers_1 = rester_1{sel_var_1}{sel_peak_1}{sel_var_i};
            
            switch caser
                case 1
                    area_1 = trapz(timers_1,dater_1)*100;
                    b = [area_1;0];
                case 2
                    tot_fr_1 = round(sum(dater_1));
                    b = [tot_fr_1;0];
                case 3
                    avg_fr_1 = round(mean(dater_1));
                    b = [avg_fr_1;0];
                case 4
                    std_fr_1 = round(std(dater_1));
                    b = [std_fr_1;0];
                case 5
                    diff_ti_1 = (timers_1(end)-timers_1(1)) + 0.01;
                    b = [diff_ti_1;0];
                case 6
                    avg_fr_1 = max(dater_1);
                    b = [avg_fr_1;0];
            end
        catch
            dater_2 = res_2{sel_var_2}{sel_peak_2}{sel_var_i};
            timers_2 = rester_2{sel_var_2}{sel_peak_2}{sel_var_i};
            
            switch caser
                case 1
                    area_2 = trapz(timers_2,dater_2)*100;
                    b = [0;area_2];
                case 2
                    tot_fr_2 = round(sum(dater_2));
                    b = [0;tot_fr_2];
                case 3
                    avg_fr_2 = round(mean(dater_2));
                    b = [0;avg_fr_2];
                case 4
                    std_fr_2 = round(std(dater_2));
                    b = [0;std_fr_2];
                case 5
                    diff_ti_2 = (timers_2(end)-timers_2(1)) + 0.01;
                    b = [0;diff_ti_2 ];
                case 6
                    avg_fr_2 = max(dater_2);
                    b = [avg_fr_2;0];
            end
            
        end
    end
    
    if type ==3 ||  type == 4 || type ==6
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
                b0(1).FaceColor = [.1 0.5 0.9];
                b0(3).FaceColor = [.0 0.5 0.2];
            catch
                if b(1) ==0
                    b0(1).FaceColor = [.0 0.5 0.2];
                else
                    b0(1).FaceColor = [.1 0.5 0.9];
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
            if cula >5 && cula <11
                subplot(2,5,i,'parent',fi1);
            elseif cula <6
                subplot(1,cula,i,'parent',fi1);
            else
                subplot(3,5,i,'parent',fi1);
            end
            area(timers_1,dater_1,'FaceColor',[0.75 0.55 0]);
            
            if i==1
                title(['ONE: ',num2str(i+cel)])
            else
                title(num2str(i+cel))
            end
            
            if cula >5 && cula <11
                subplot(2,5,i,'parent',fi2);
            elseif cula <6
                subplot(1,5,i,'parent',fi2);
            else
                subplot(3,5,i,'parent',fi2);
            end
            area(timers_2,dater_2,'FaceColor',[0.75 0.55 0]);
            
            if i==1
                title(['TWO: ',num2str(i+cel)])
            else
                title(num2str(i+cel))
            end
            
        case 6
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
                sb = {'Spike Number';'1';'2'};
                as1.ColumnName = sb;
            end
            
    end
    
end

end

function resultar (hObject,~)
figo(hObject.SelectedTab);
assignin('base','cur_tab',hObject.SelectedTab)
end

function resultar_p (hObject,~)
figo_p(hObject.SelectedTab);
assignin('base','cur_tab',hObject.SelectedTab)
end

function resultar1_p (hObject,~)
try
    tg = evalin('base','cur_tab');
catch
    tg = get(hObject,'parent');
end
figo1_p(hObject.SelectedTab,tg);
assignin('base','cur_tab1',hObject.SelectedTab)
end

function resultar1 (hObject,~)
try
    tg = evalin('base','cur_tab');
catch
    tg = get(hObject,'parent');
end
figo1(hObject.SelectedTab,tg);
assignin('base','cur_tab1',hObject.SelectedTab)
end

%%
function  plot_areas(sel_var_1,res,sel_spike_1,sel_peak_1,rester,shoename,fig_1,fig_2)
if isempty(get(fig_1, 'Children'))
    fig = fig_1;
else
    fig = fig_2;
end

tot_frs=[];
std_tis=[];
diff_tis=[];
std_frs=[];
avg_frs =[];
traps = [];
if  sel_peak_1<=length(res{sel_var_1})
    dat = res{sel_var_1}{sel_peak_1};
    ker = sel_spike_1-1;
    ker_1 = ceil(sqrt(ker));
    if ceil(sqrt(ker)) == round(sqrt(ker))
        
        ker_2 = ker_1;
    else
        ker_2 = round(sqrt(ker));
    end
    
    for i = 1:ker
        sel_var_i = i;
        if sel_var_i>length(dat)
            sel_var_i = length(dat);
        end
        subplot(ker_2,ker_1,i,'parent',fig);
        dater = res{sel_var_1}{sel_peak_1}{sel_var_i};
        timers = rester{sel_var_1}{sel_peak_1}{sel_var_i};
        area(timers,dater,'FaceColor',[0.75 0.55 0]);
        area_1 = trapz(timers,dater)*100;
        
        avg_fr = round(mean(dater));
        tot_fr = round(sum(dater));
        std_fr = round(std(dater),1);
        
        diff_ti = (timers(end)-timers(1)) + 0.01;
        
        title(['S-' num2str(sel_var_i) ' area: ' num2str(area_1) ' AF: ' num2str(avg_fr) newline 'SF: ' num2str(std_fr)  ' TF: ' num2str(tot_fr) '  ' 'CT: ' num2str(diff_ti)])
        
        tot_frs=[tot_frs;tot_fr];
        avg_frs = [avg_frs;avg_fr];
        %std_tis=[std_tis;std_ti];
        diff_tis=[diff_tis;diff_ti];
        std_frs=[std_frs;std_fr];
        traps= [traps;area_1];
    end
    suptitl = [shoename ': Peak ' num2str(sel_peak_1) ': Areas; T = ' num2str(sum(traps)) ', M = ' num2str(round(mean(traps))) ', S = ' num2str(round(std(traps),1)) '. Tot Forces; T = ' num2str(round(sum(tot_frs))) ', M = ' num2str(round(mean(tot_frs))) ', S = ' num2str(round(std(tot_frs),1)) '. Avg Forces; T = ' num2str(round(sum(avg_frs))) ', M = ' num2str(round(mean(avg_frs))) ', S = ' num2str(round(std(avg_frs),1)) '. Con Times; T = ' num2str(sum(diff_tis)) ', M = ' num2str(mean(diff_tis)) ', S = ' num2str(std(diff_tis)) ];
    uicontrol('Parent', fig, 'Style', 'pushbutton', 'String', upper(suptitl),'Tag','plut1', ...
        'HorizontalAlignment', 'left', 'Units','normal','Visible','on','Position', [0.01 0.95 0.98 0.04]); %surface 1 button
  end

end

function  plots_areas_1(trap_area_1,trap_area_2,sel_var_1,sel_var_2,res_1,res_2,rester_1,rester_2,fig,type,caser)
% children = get(fig, 'children');
% children
% delete(children);
dat_1 = res_1{sel_var_1};
dat_2 = res_2{sel_var_2};

a1 = 1;
b1 = max(length(dat_1),length(dat_2));
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
        sater_1 = trap_area_1{sel_var_1}{sel_var_i};
        sater_2 = trap_area_2{sel_var_2}{sel_var_i};
        dater_1 = res_1{sel_var_1}{sel_var_i};
        dater_2 = res_2{sel_var_2}{sel_var_i};
        timers_1 = rester_1{sel_var_1}{sel_var_i};
        timers_2 = rester_2{sel_var_2}{sel_var_i};
        
        if caser == 1 || caser == 2 || caser == 3
            if caser ==1
                mean_1 = round(mean(sater_1));
                mean_2 = round(mean(sater_2));
                b = [mean_1;mean_2];
            elseif caser ==2
                sum_1 = round(sum(sater_1));
                sum_2 = round(sum(sater_2));
                b = [sum_1;sum_2];
            else
                std_1 = round(std(sater_1),2);
                std_2 = round(std(sater_2),2);
                b = [std_1 ;std_2];
            end
            
        elseif caser == 4 || caser == 5 || caser == 6 || caser == 0
            dut_1=[];
            dout_1=[];
            daout_1=[];
            dut_2=[];
            dout_2=[];
            daout_2=[];
            dcout_1=[];
            dcout_2=[];
            for k =1 :length(dater_1)
                daters = dater_1{k};
                dut_1 = [dut_1;mean(daters)];
                dout_1=[dout_1;sum(daters)];
                daout_1=[daout_1;std(daters)];
                dcout_1=[dcout_1;max(daters)];
            end
            
            for k =1 :length(dater_2)
                daters = dater_2{k};
                dut_2 = [dut_2;mean(daters)];
                dout_2=[dout_2;sum(daters)];
                daout_2=[daout_2;std(daters)];
                dcout_2=[dcout_2;max(daters)];
            end
            
            if caser == 0
                dater_1 = dut_1 ;
                dater_2 = dut_2;
                mean_1 = max(dater_1);
                mean_2 = max(dater_2);
                b = [mean_1;mean_2];
            elseif caser ==4
                dater_1 = dut_1 ;
                dater_2 = dut_2;
                mean_1 = round(mean(dater_1));
                mean_2 = round(mean(dater_2));
                b = [mean_1;mean_2];
            elseif caser ==5
                dater_1 = dout_1 ;
                dater_2 = dout_2;
                sum_1 = round(sum(dater_1));
                sum_2 = round(sum(dater_2));
                b = [sum_1;sum_2];
            else
                dater_1 = daout_1 ;
                dater_2 = daout_2;
                std_1 = round(std(dater_1),2);
                std_2 = round(std(dater_2),2);
                b = [std_1 ;std_2];
            end
        elseif caser == 7 || caser == 8 || caser == 9
 
            diff_ti ={};
            for j=1:length(timers_1)
                t1 = timers_1{j}(end);
                t2 = timers_1{j}(1);
                diff_ti{j} = (t1 - t2)+0.01;
        
            end
            time_1 = diff_ti;
            
            diff_ti ={};
            for j=1:length(timers_2)
                t1 = timers_2{j}(end);
                t2 = timers_2{j}(1);
                diff_ti{j} = (t1 - t2)+0.01;
                
            end
            time_2 = diff_ti;
            
            if caser ==8
                mean_1 = mean(cell2mat(time_1));
                mean_2 = mean(cell2mat(time_2));
                b = [mean_1;mean_2];
            elseif caser ==7
                sum_1 = sum(cell2mat(time_1));
                sum_2 = sum(cell2mat(time_2));
                b = [sum_1;sum_2];
            else
                std_1 = std(cell2mat(time_1));
                std_2 = std(cell2mat(time_2));
                b = [std_1 ;std_2];
            end
        end
    catch
        try
            sater_1 = trap_area_1{sel_var_1}{sel_var_i};
            dater_1 = res_1{sel_var_1}{sel_var_i};
            timers_1 = rester_1{sel_var_1}{sel_var_i};
            
            if caser == 1 || caser == 2 || caser == 3
                if caser ==1
                    mean_1 = round(mean(sater_1));
                    mean_2 = 0;
                    b = [mean_1;mean_2];
                elseif caser ==2
                    sum_1 = round(sum(sater_1));
                    sum_2 = 0;
                    b = [sum_1;sum_2];
                else
                    std_1 = round(std(sater_1),2);
                    std_2 = 0;
                    b = [std_1 ;std_2];
                end
                
            elseif caser == 4 || caser == 5 || caser == 6 || caser == 0
                
                dut_1=[];
                dout_1=[];
                daout_1=[];
                dcout_1=[];
                for k =1 :length(dater_1)
                    daters = dater_1{k};
                    dut_1 = [dut_1;mean(daters)];
                    dout_1=[dout_1;sum(daters)];
                    daout_1=[daout_1;std(daters)];
                    dcout_1=[dcout_1;max(daters)];
                end
                
                if caser == 0
                    dater_1 = dcout_1 ;
                    mean_1 = max(dater_1);
                    mean_2 = 0;
                    b = [mean_1;mean_2];
                elseif caser ==4
                    dater_1 = dut_1 ;
                    mean_1 = round(mean(dater_1));
                    mean_2 = 0;
                    b = [mean_1;mean_2];
                elseif caser ==5
                    dater_1 = dout_1 ;
                    sum_1 = round(sum(dater_1));
                    sum_2 = 0;
                    b = [sum_1;sum_2];
                else
                    dater_1 = daout_1 ;
                    std_1 = round(std(dater_1),2);
                    std_2 = 0;
                    b = [std_1 ;std_2];
                end
            elseif caser == 7 || caser == 8 || caser == 9
                diff_ti ={};
                for j=1:length(timers_1)
                    t1 = timers_1{j}(end);
                    t2 = timers_1{j}(1);
                    diff_ti{j} = (t1 - t2)+0.01;
                end
                time_1 = diff_ti;
                
                if caser ==8
                    mean_1 = mean(cell2mat(time_1));
                    mean_2 = 0;
                    b = [mean_1;mean_2];
                elseif caser ==7
                    sum_1 = sum(cell2mat(time_1));
                    sum_2 = 0;
                    b = [sum_1;sum_2];
                else
                    std_1 = std(cell2mat(time_1));
                    std_2 = 0;
                    b = [std_1 ;std_2];
                end
                
            end
        catch
            sater_2 = trap_area_2{sel_var_2}{sel_var_i};
            dater_2 = res_2{sel_var_2}{sel_var_i};
            timers_2 = rester_2{sel_var_2}{sel_var_i};
            
            
            if caser == 1 || caser == 2 || caser == 3
                if caser ==1
                    mean_1 = 0;
                    mean_2 = round(mean(sater_2));
                    b = [mean_1;mean_2];
                elseif caser ==2
                    sum_1 = 0;
                    sum_2 = round(sum(sater_2));
                    b = [sum_1;sum_2];
                else
                    std_1 = 0;
                    std_2 = round(std(sater_2),2);
                    b = [std_1 ;std_2];
                end
                
            elseif caser == 4 || caser == 5 || caser == 6 || caser == 0
                dut_2=[];
                dout_2=[];
                daout_2=[];
                dcout_2 = [];
                
                for k =1 :length(dater_2)
                    daters = dater_2{k};
                    dut_2 = [dut_2;mean(daters)];
                    dout_2=[dout_2;sum(daters)];
                    daout_2=[daout_2;std(daters)];
                    dcout_2=[dcout_2;max(daters)];
                end
                
                if caser == 0
                    dater_2 = dcout_2;
                    mean_1 = 0;
                    mean_2 = max(mean(dater_2));
                    b = [mean_1;mean_2];
                elseif caser ==4
                    dater_2 = dut_2 ;
                    mean_1 = 0;
                    mean_2 = round(mean(dater_2));
                    b = [mean_1;mean_2];
                elseif caser ==5
                    dater_2 = dout_2 ;
                    sum_1 = 0;
                    sum_2 = round(sum(dater_2));
                    b = [sum_1;sum_2];
                else
                    dater_2 = daout_2 ;
                    std_1 = 0;
                    std_2 = round(std(dater_2),2);
                    b = [std_1 ;std_2];
                end
            elseif caser == 7 || caser == 8 || caser == 9
                
                diff_ti ={};
                for j=1:length(timers_2)
                    t1 = timers_2{j}(end);
                    t2 = timers_2{j}(1);
                    diff_ti{j} = (t1 - t2)+0.01;
                end
                time_2 = diff_ti;
                
                if caser ==8
                    mean_1 = 0;
                    mean_2 = mean(cell2mat(time_2));
                    b = [mean_1;mean_2];
                elseif caser ==7
                    sum_1 = 0;
                    sum_2 = sum(cell2mat(time_2));
                    b = [sum_1;sum_2];
                else
                    std_1 = 0;
                    std_2 = std(cell2mat(time_2));
                    b = [std_1 ;std_2];
                end
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
                b0(1).FaceColor = [.1 0.5 0.9];
                b0(3).FaceColor = [.0 0.5 0.2];
                
            catch
                if b(1) ==0
                    b0(1).FaceColor = [.0 0.5 0.2];
                    
                else
                    b0(1).FaceColor = [.1 0.5 0.9];
                end
            end

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



function editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,state,fig_1,fig_2)

if isempty(get(fig_1, 'Children'))
    tab1 = fig_1;
else
    tab1 = fig_2;
end


a = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', FirstShoe,'Tag','Transpose', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.02  0.9 0.47 0.05]);

a1 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Second Shoe','Tag','Deletecolrow', ...
    'HorizontalAlignment', 'left','Units', 'normal', 'Position', [0.51  0.9 0.47 0.05]);

as = uitable('Parent', tab1,'Units', 'normal','Position',[0.02  0.15 0.47 0.75],...
    'Visible','on','Tag','tabletabdata1' );

as1 = uitable('Parent', tab1,'Units', 'normal','Position',[0.51  0.15 0.47 0.75],...
    'Visible','on','Tag','tabletabdata2' );

as.Data = speaked_1;
as.ColumnName = sb;

as1.Data = speaked_2;
as1.ColumnName =sb;
a1.String = SecondShoe;

if state ==0
    as1.Visible = 'off';
    a1.Visible = 'off';
    as.Position =  [0.15  0.15 0.7 0.75];
    a.Position =  [0.15  0.9 0.7 0.05];
end

end

function [pera,b,sum_1,mean_1,std_1,sum_2,mean_2,std_2,sum_3,mean_3,sum_4,mean_4,sum_5,mean_5] = tablevalues(trap_area,sel_var_k,rester,res)

sout=[];
sater = trap_area{sel_var_k};
for i =1 :length(sater)
    saters = sater{i};
    sout = [sout;saters];
end
oe = sout;

mean_z = mean(oe,2);
std_z = round(mean(oe,2),2);
mean_1 = mean(mean_z);
sum_z = sum(oe,2);
sum_1 = sum(sum_z);
std_1 = std(std_z);
t1 = 1:1:length(mean_z);
peaked_1 = [t1',mean_z , sum_z,std_z];
b = {'Peak Number';'Area: Mean';'Area: Total';'Area: Std'};

daters =[];
dout=[];
dout1=[];
dout2=[];
dater = res{sel_var_k};
for i =1 :length(dater)
    daters = dater{i};
    dateo =[];
    for j=1:length(daters)
        dateo = [dateo;daters{j}];
    end
    daout = mean(dateo);
    dtout = sum(dateo);
    dsout = round(std(dateo),1);
    
    dout=[dout;daout];
    dout1 = [dout1;dtout];
    dout2 = [dout2;dsout];
end

timers = rester{sel_var_k};
tout = [];
for i =1 :length(timers)
    timer  = timers{i};
    timeo =[];
    for j=1:length(timer)
        t1 = timer{j}(end);
        t2 = timer{j}(1);
        diff_ti{j} = (t1 - t2)+0.01;
    end
    tout = [tout;cell2mat(diff_ti)];
end
mean_y = mean(tout,2);
mean_2 = mean(mean_y);
[aim,~]= size(tout);
std_y  = [];
for zo = 1:aim
    std_y  = [std_y;std(tout(zo,:))];
end
std_2 = std(std_y);
sum_y = sum(tout,2);
sum_2 = sum(sum_y);
peaked_2 = [mean_y , sum_y,std_y];
b2 = {'Cont. Time: Mean';'Cont. Time: Total';'Cont. Time: Std'};

mean_x = mean(dout,2); % force mean
mean_3 = mean(mean_x);
std_x  = std(dout);
sum_x = sum(dout,2);
sum_3 = sum(sum_x);
peaked_3 = mean_x ;

b3 = {'Average Force'};

mean_w = mean(dout1,2); % area total
mean_4 = mean(mean_w);
std_w  = std(dout1);
sum_w = sum(dout1,2);
sum_4 = sum(sum_w);
peaked_4 = mean_w ;
b4 = {'Total Force'};


mean_v = mean(dout2,2); % force std
mean_5 = mean(mean_v);
std_v  = std(dout2);
sum_v = sum(dout2,2);
sum_5 = sum(sum_v);
peaked_5 = mean_v;
b5 = {'Std. Force'};
b=[b;b2;b3;b4;b5];
pera =[peaked_1,peaked_2,peaked_3,peaked_4,peaked_5];
end

function cur_lim  = movelims2(hObject,~)
% Callbact to set the threshold 2
tag1 = get(hObject,'Tag');
try
    ur_lim = evalin('base',strcat('ur_lim_',tag1(end-3)));
catch
    ur_lim= 10;
end

try
    if strcmp(tag1(end),'2')
        if ur_lim< 20
            ur_lim =  ur_lim+ 2.5;
        else
            ur_lim =  ur_lim + 5;
        end
    elseif strcmp(tag1(end),'3') && ur_lim>3
        if ur_lim > 20
            ur_lim =  ur_lim - 5;
        else
            ur_lim =  ur_lim - 2.5;
        end
        
    end
catch
    
end

try
    cur_lim = evalin('base',strcat('cur_lim_',tag1(end-3)));
    if ur_lim >= curlim
        ur_lim = curlim-1;
    end
catch
    
end

assignin('base',strcat('ur_lim_',tag1(end-3)),ur_lim );
end

function cur_lim  = movelims(hObject,~)
% Callbact to set the threshold
tag1 = get(hObject,'Tag');
try
    cur_lim = evalin('base',strcat('cur_lim_',tag1(end-2)));
catch
    cur_lim= 99.5;
end
ED=  [1,10,20,30,40,50,72.5,75,77.5,80,82.5,85,86,88,90,91,92,93,93.5,94,94.5,95,95.5,96,96.25,96.5,96.7,96.85,97,97.25,97.5,97.75,98,98.25,98.5,99,99.1,99.2,99.3,99.4,99.5,99.55,99.6,99.7,99.8,99.9,99.95,99.97,99.99];
result = find(ED==cur_lim);
try
    if strcmp(tag1(end),'2')
        cur_lim = ED(result+1);
    else
        cur_lim = ED(result-1);
    end
catch
    cur_lim = ED(result);
end
assignin('base',strcat('cur_lim_',tag1(end-2)),cur_lim);
end

function confmovelims(hObject,~)
% Callback to update the limts
tag1 = get(hObject,'Tag');
hf=findobj('Tag',strcat('datapre',tag1(end-2),'_2'));
hf =hf(1);
selectpeaked(str2double(tag1(end-2)),hf);
end

function selectspikes(hObject,~)
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
assignin('base',strcat('sel_spike_',tag1(end-2)),is);
hf=findobj('Tag',strcat('variables',tag1(end-2),'_9'));
hf=hf(1);
hf.Visible = 'on';

if is == length(as)
    hf=findobj('Tag',strcat('datapre',tag1(end-2),'_1'));
    hf =hf(1);
    assignin('base','lim_spike',1);
    sel_var_1 = evalin('base',strcat('sel_var_',tag1(end-2)));
    sel_peak_1 = evalin('base',strcat('sel_peak_',tag1(end-2)));
    des_indices = evalin('base',strcat('rest_',tag1(end-2)));
    des_o = des_indices{sel_var_1}{sel_peak_1};
    assignin('base',strcat('des_ind1_',tag1(end-2)),des_o{1}(1)); % selected spikes start
    assignin('base',strcat('des_inde_',tag1(end-2)),des_o{end}(end)); % slecetd spikes end
    selectpeaked(str2double(tag1(end-2)),hf)
else
    hf=findobj('Tag',strcat('datapre',tag1(end-2),'_1'));
    hf =hf(1);
    assignin('base','lim_spike',2)
    selectpeaked(str2double(tag1(end-2)),hf);
    sel_var_1 = evalin('base',strcat('sel_var_',tag1(end-2)));
    sel_peak_1 = evalin('base',strcat('sel_peak_',tag1(end-2)));
    des_indices = evalin('base',strcat('rest_',tag1(end-2)));
    try
        des_ind = des_indices{sel_var_1}{sel_peak_1}{is};
    catch
        des_o = length(des_indices{sel_var_1}{sel_peak_1});
        des_ind = des_indices{sel_var_1}{sel_peak_1}{des_o};
    end
    des_o = des_indices{sel_var_1}{sel_peak_1};
    assignin('base',strcat('des_ind1_',tag1(end-2)),des_o{1}(1)); % selected spikes start
    assignin('base',strcat('des_inde_',tag1(end-2)),des_o{end}(end)); % slecetd spikes end
    assignin('base',strcat('des_inv1_',tag1(end-2)),des_ind);
    hf=findobj('Tag',strcat('datapre',tag1(end-2),'_1'));
    hf =hf(1);
    selectpeaked(str2double(tag1(end-2)),hf);
end

end

function gotofinal(hObject,~)
try
    sk1 = evalin('base','sel_spike_1');
    sk2 = evalin('base','sel_spike_2');
    hf=findobj('Tag','done1_1');
    hf = hf(1);
    hf.Visible = 'on';
catch
    hf=findobj('Tag','done1_1');
    hf = hf(1);
    hf.Visible = 'off';
    
end
end

function peakinterest(hObject,~)
% callback for user defined range of spikes
tag1 = get(hObject,'Tag');
as = get(hObject,'String');

if ~isempty(as) && ~isnan(str2double(as))
    assignin('base',strcat('des_spike_',tag1(end-3),tag1(end)),as);
else
    warndlg('Please enter a numeric value','Index Error');
    return
end

if strcmp(tag1(end),'2')  % check if it is te confirm button
    try
        fr =  evalin('base',strcat('des_spike_',tag1(end-3),'1'));
        sr =  evalin('base',strcat('des_spike_',tag1(end-3),'2'));
        sr1=evalin('base',strcat('avai_spikes_',tag1(end-3)));
        if str2double(sr)>sr1
            warndlg('Please select a value less or equal to the maximum available','Index Error');
            return
        end
        
        if str2double(fr)<=str2double(sr)
            hf=findobj('Tag',strcat('variables',tag1(end-3),'_7'));
            hf =hf(1);
            gf=findobj('Tag',strcat('variables',tag1(end-3),'_8'));
            gf =gf(1);
            gf.Value =1;
            hf.Visible = 'on';
            list_5 ={};
            fin = (str2double(sr)-str2double(fr))+1;
            for i=1:fin
                list_5{i} = num2str(i);
            end
            list_5{length(list_5)+1} = 'All';
            gf.String = list_5;
            gf.Visible = 'on';
        end
        
    catch e
        warndlg('Please complete the required fields and retry','Specification Error');
    end
    return
end

end

function selectpeakareas(hObject,~)
% Callback for all peak areas, spikes
tag1 = get(hObject,'Tag');
as = get(hObject,'String');

if strcmp(tag1(end),'3')
    is = get(hObject,'Value');
    assignin('base',strcat('cond_peaks',tag1(end-3)),is);
    if is ==4
        assignin('base',strcat('peak_spec',tag1(end-3)),'20');
    end
    try
        peak_spec=evalin('base',strcat('peak_spec',tag1(end-3)));
        cond_peaks = is;
    catch
        return
    end
else
    if ~isempty(as) && ~isnan(str2double(as))
        assignin('base',strcat('peak_spec',tag1(end-3)),as);
        try
            cond_peaks=evalin('base',strcat('cond_peaks',tag1(end-3)));
        catch
            
            return
        end
    else
        warndlg('Please enter a numeric value','Index Error');
        return
    end
end

peak_spec=evalin('base',strcat('peak_spec',tag1(end-3)));
avail= evalin('base',strcat('avai_spik_',tag1(end-3)));
if str2double(peak_spec)>avail
    if cond_peaks==4
    else
        warndlg('Please select a value less or equal to the maximum available','Index Error');
        return
    end
end

if cond_peaks==1
    v1 = 1;
    v2 = str2double(peak_spec);
elseif cond_peaks==2
    v2 = avail;
    v1 = (avail-str2double(peak_spec))+1;
elseif cond_peaks==3
    des_roter_1 = avail-str2double(peak_spec);
    v1 = ceil(des_roter_1/2)+1;
    v2 = avail-(floor(des_roter_1/2));
else
    v1 = 1;
    v2 = avail+1;
end
assignin('base',strcat('des_spike_',tag1(end-3),'1'),num2str(v1));
assignin('base',strcat('des_spike_',tag1(end-3),'2'),num2str(v2));

hf=findobj('Tag',strcat('datapre',tag1(end-3),'_1'));
hf =hf(1);
assignin('base','lim_graph',1)
hf.Visible='on';
selectpeaked(str2double(tag1(end-3)),hf)
af=findobj('Tag',strcat('variables',tag1(end-3),'_9'));
af =af(1);
af.Visible = 'on';
assignin('base',strcat('sel_spike_',tag1(end-3)),16);
end

function selectpeaker(hObject,~)
tag1 = get(hObject,'Tag');
as = get(hObject,'String');
is = get(hObject,'Value');
assignin('base',strcat('sel_peak_',tag1(end-2)),is);
assignin('base',strcat('sototype'),1);

num_peaks= evalin('base',strcat('num_peaks_',tag1(end-2)));
hf=findobj('Tag',strcat('variables',tag1(end-2),'_10'));
hf =hf(1);
gf=findobj('Tag',strcat('variables',tag1(end-2),'_11')); % from
gf =gf(1);
ff=findobj('Tag',strcat('variables',tag1(end-2),'_12')); % To
ff =ff(1);
ef=findobj('Tag',strcat('variables',tag1(end-2),'_13'));
ef =ef(1);
df=findobj('Tag',strcat('variables',tag1(end-2),'_14'));
df =df(1);
cf=findobj('Tag',strcat('variables',tag1(end-2),'_7'));
cf =cf(1);
bf=findobj('Tag',strcat('variables',tag1(end-2),'_8'));
bf =bf(1);
af=findobj('Tag',strcat('variables',tag1(end-2),'_9'));
af =af(1);
af.Visible = 'off';
assignin('base','lim_spike',1);
if is > num_peaks
    hf.Visible = 'off';
    gf.Visible = 'off';
    ff.Visible = 'off';
    ef.Visible = 'on';
    df.Visible = 'on';
    cf.Visible = 'off';
    bf.Visible = 'off';
    hf=findobj('Tag',strcat('datapre',tag1(end-2),'_1'));
    hf =hf(1);
    assignin('base','lim_graph',1)
    hf.Visible='on';
    coli = ['clear ' strcat('des_spike_',tag1(end-2), '1')];
    coli2 = ['clear ' strcat('des_spike_',tag1(end-2), '2')];
    evalin('base',coli); % cleared desired spikes
    evalin('base',coli2);
    selectpeaked(str2double(tag1(end-2)),hf)
    peaks_found = evalin('base',strcat('region_3_',tag1(end-2)));
    lrnd = [];
    for i=1:length(peaks_found)
        lrnd = [lrnd;length(peaks_found{i})];
    end
    min_len = min(lrnd);
    df.String =['Enter X' ' Max=' num2str(min_len-1)];
    assignin('base',strcat('avai_spik_',tag1(end-2)),min_len-1);
else
    hf.Visible = 'on';
    gf.Visible = 'on';
    ff.Visible = 'on';
    ef.Visible = 'off';
    df.Visible = 'off';
    des_indices = evalin('base',strcat('rest_',tag1(end-2)));
    sel_var_1 = evalin('base',strcat('sel_var_',tag1(end-2)));
    des_ind = des_indices{sel_var_1}{is}; % get availiable spikes start and end
    assignin('base',strcat('des_ind1_',tag1(end-2)),des_ind{1}(1)); % selected spikes start
    assignin('base',strcat('des_inde_',tag1(end-2)),des_ind{end}(end)); % slecetd spikes end
    hf=findobj('Tag',strcat('datapre',tag1(end-2),'_1'));
    hf =hf(1);
    assignin('base','lim_graph',2)
    selectpeaked(str2double(tag1(end-2)),hf);
    peaks_found = evalin('base',strcat('region_3_',tag1(end-2)));
    avai_spikes = length(peaks_found{is});
    ff.String= ['Max =' num2str(avai_spikes-1)];
    assignin('base',strcat('avai_spikes_',tag1(end-2)),avai_spikes);
    hf.Visible='on';
end
end

function selectpeaked(val,pan)
% Callback to select and update peak graphs
% Val one == first shoe
tag1 = num2str(val);
% 'Tag','variable1_6',
try
    miner = evalin('base',strcat('cur_lim_',tag1));
    lim_stater = 1;
catch
    lim_stater =2;
    assignin('base',strcat('cur_lim_',tag1),99.5);
end

% cur_lim  = movelims(hObject);
assignin('base','cur_lim',tag1);
dat_shoe_1 = evalin('base',strcat('dat_shoe_',tag1));
sel_shoe_1 = evalin('base',strcat('sel_shoe_',tag1));
sel_shoe_1(regexp(sel_shoe_1 ,'_'))=' ';
sel_shoe_1 = upper(sel_shoe_1);
sel_var_1 = evalin('base',strcat('sel_var_',tag1));
list_2 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};
list_1 = {'LEFT HEEL','LEFT FOREFRONT','LEFT','RIGHT FOREFRONT','RIGHT HEEL','RIGHT'};

try
    [res,rest,rester,trap_area,shoe,timer,time_indices,ind_peak,num_ind_peak,region_3]= compare(dat_shoe_1,lim_stater,sel_var_1);
catch
    warndlg('Operation was unsuccessful, please restart an try manual mode. If problem still persists, check the data.','Variables Error');
    return
end
[num_peaks_1,~,data_ind] =  eq_sel_var(sel_var_1,list_2,trap_area,res,shoe);

assignin('base',strcat('region_3_',tag1),region_3); % indices for spikes
assignin('base',strcat('rest_indice_',tag1),time_indices{sel_var_1}); % indices for spikes

if strcmp(tag1,'1')
    shoe_state = 'FIRST SHOE';
else
    shoe_state = 'SECOND SHOE';
end

assignin('base',strcat('rest_',tag1),rest);
assignin('base',strcat('res_',tag1),res);
assignin('base',strcat('rester_',tag1),rester);

assignin('base',strcat('num_peaks_',tag1),num_peaks_1);
assignin('base',strcat('trap_area_',tag1),trap_area);


gf=findobj('Tag',strcat('variables',tag1,'_6')); % Create string for available peaks
gf = gf(1);
list_3 ={};
for i=1:num_peaks_1
    list_3{i} = num2str(i);
end
list_3{num_peaks_1+1} = 'All';
gf.String = list_3;
% gf.Value =1;
assignin('base',strcat('num_peaks_',tag1),num_peaks_1);
plot_readings(sel_var_1,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state,pan);
end

function [num_peaks_1,num_peaks_2,data_ind] = eq_sel_var(sel_var_1,list_2,trap_area,res,shoe)
% Get selected variable from data
% [t_errorr] = comp_brands_var(trap_area,sel_var_1);
num_peaks_1 = length(res{sel_var_1});
num_peaks_2 = num_peaks_1;
data_ind = shoe(:,sel_var_1);
% end
end


function [res,rest,rester,total,shoe,timer,time_indices,ind_peak,num_ind_peak,region_3]= compare(brand,lim_stater,sel_var_1)
% get areas covered
% res = readings, rester = actual time indices, rest = indices
Data_1 = brand(:,1:end-1); % data minus time
Data_1_t =  brand(:,end); % time
shoe = Data_1;
timer = Data_1_t;

k = sel_var_1;
res = cell(1,6);
rest = cell(1,6);
rester = cell(1,6);
ind_peak = cell(1,6);
num_ind_peak = cell(1,6);
unilim = zeros(1,6);

data_ind = shoe(:,k);
assignin('base','k',k)


try
    doo = evalin('base','operation_mode');
    if doo == 2 % manual mode
        prototype = evalin('base', 'prototype');       
        if prototype == 1
            pe_modi = evalin('base','cur_lim');
            pe_modi = str2double(pe_modi);
            [res{k},rest{k},rester{k},region_3,~]  =  metch_data(data_ind,timer,pe_modi);
            per = 500;
        else
            try
                assignin('base','expec',1500);
                [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
            catch
                try 
                    try
                        assignin('base','expec',2000);
                        [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                    catch
                        try
                            assignin('base','expec',500);
                            [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                        catch
                            assignin('base','expec',2500);
                            [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                        end
                    end
                catch
                    assignin('base','expec',3500);
                    [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                    
                end
                
            end
        end
    else
        try
            assignin('base','expec',1500);
            [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
        catch
            try
                try
                    assignin('base','expec',2000);
                    [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                catch
                    try
                        assignin('base','expec',500);
                        [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                    catch
                        assignin('base','expec',2500);
                        [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                    end
                end
            catch
                assignin('base','expec',3500);
                [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                
            end
            
        end
    end
catch
    try
        assignin('base','expec',1500);
        [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
    catch
        try
            try
                assignin('base','expec',2000);
                [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
            catch
                try
                    assignin('base','expec',500);
                    [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                catch
                    assignin('base','expec',2500);
                    [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks
                end
            end
        catch
            assignin('base','expec',3500);
            [res{k},rest{k},rester{k},region_3,per] = fetch_data_1(data_ind,timer,lim_stater); % fetch_data spikes and peaks    
        end
        
    end
end

ind_peak{k} = evalin('base','ind_peaks');
num_ind_peak{k} = evalin('base','ind_pea');
unilim(k) = per;

assignin('base','uni_lim',unilim);

time_indices ={}; % get areas covered
total={};
for u = 1:length(res)% peaks
    lop = res{u};
    po=[];
    for g = 1:length(lop) %spikes
        loper = lop{g};
        for r = 1: length(loper) %spike
            dater = loper{r};
            timers = rester{u}{g}{r};
            resger = rest{u}{g}{r};
            po = [po;resger];
            trap_area = trapz(timers,dater)*100;
            total{u}{g}(r) = trap_area;
        end
    end
    time_indices(u) = {po};
end
end

function [region,region_1,region_2,region_3,ptile] = fetch_data_1(data_ind,timer,lim_stater)

try
    cur_lim = evalin('base',strcat('cur_lim'));
    ur_lim = evalin('base',strcat('ur_lim_',cur_lim));
    val1 = ur_lim ;
catch
    val1 = 10;
    try
        cur_lim = evalin('base',strcat('cur_lim'));
        assignin('base',strcat('ur_lim_',cur_lim),10);
    catch
    end
end

success1 = false;
while (~success1)
    ptile1  = prctile(data_ind,val1);
    if ptile1 > 0
        success1 = true;
    else
        if val1 > 25
            val1 = val1+2.5;
        else
            val1=val1+1.5;
        end
    end
end
peaks1 = data_ind >ptile1;
assignin('base',strcat('ptile1_',cur_lim),ptile1);
assignin('base',strcat('ur_lim_',cur_lim),val1);

try
    if lim_stater ==1 % 1 is modified limits
        cur_lim = evalin('base',strcat('cur_lim'));
        limit = evalin('base',strcat('cur_lim_',cur_lim ));
        ptile =prctile(data_ind,limit);
    else % defaults
        if  (1.5*prctile(data_ind,95)) > prctile(data_ind,99)
            if prctile(data_ind,50) ~=0 && prctile(data_ind,50)>25
                od = 99.55;
                ptile = prctile(data_ind,od);
            else
                od = 99.2;
                ptile = prctile(data_ind,od);
            end
        else
            od =99;
            ptile =prctile(data_ind,od);
        end
    end
    peaks = data_ind >ptile;
    [region,region_1,region_2,region_3] = fetch_data(data_ind,timer,peaks,peaks1);
    try
        cur_lim = evalin('base',strcat('cur_lim'));
        assignin('base',strcat('cur_lim_',cur_lim),od);
    catch
    end
    
catch
    try
        if  (1.5*prctile(data_ind,95)) > prctile(data_ind,99)
            if prctile(data_ind,50) ~=0 && prctile(data_ind,50)>25
                od = 99.55;
                ptile = prctile(data_ind,od);
            else
                od = 99.2;
                ptile = prctile(data_ind,99.2);
            end
        else
            od = 99;
            ptile =prctile(data_ind,99);
        end
        
        peaks = data_ind > ptile;
        [region,region_1,region_2,region_3] = fetch_data(data_ind,timer,peaks,peaks1);
        try
            cur_lim = evalin('base',strcat('cur_lim'));
            assignin('base',strcat('cur_lim_',cur_lim),od);
        catch
        end
    catch
        val= 99.99;
        success = false;
        while (~success)
            try
                ptile  =prctile(data_ind,val);
                peaks = data_ind >ptile;
                [region,region_1,region_2,region_3] = fetch_data(data_ind,timer,peaks,peaks1);
                success = true;
                try
                    cur_lim = evalin('base',strcat('cur_lim'));
                    assignin('base',strcat('cur_lim_',cur_lim),od);
                catch
                end
            catch err
                if val > 5
                    val = val-1;
                else
                    return
                end
            end
        end
    end
end
end



function [region,region_1,region_2,region_3] = fetch_data(data_ind,timer,peaks,peaks1)
% get areas of interest
%peaks = data_ind > (mean(data_ind)+(3*(std(data_ind))));
assignin('base','data_ind',data_ind)

%peaks = data_ind > prctile(data_ind,99.4);
ind_peaks = find(peaks, sum(peaks));
con_in_groups = ind_peaks(diff(ind_peaks)==1);
con_out_groups = [con_in_groups(1);con_in_groups(diff(con_in_groups)>5);con_in_groups(end)];

expec = evalin('base','expec');%1000 ;%round(length(data_ind)/50);


distinct_sessions = con_out_groups(diff(con_out_groups)>expec);
disce = [distinct_sessions;con_in_groups(end)];
assignin('base','ind_peaks',con_in_groups);
assignin('base','ind_peaksu',con_in_groups);
assignin('base','ind_pea',disce);
assignin('base','peaks',peaks);
assignin('base','peaks1',peaks1);
ind_peaks = con_in_groups ;
ind_pea = disce;

region= {};
region_1= {};
region_2= {};
region_3= {};

ind_peaks1 =  find(peaks1, sum(peaks1));
con_in_groups = ind_peaks1(diff(ind_peaks1)==1);
bor = {};
for i = 1:length(disce)
    if  i ==1
        % prior
        b = con_in_groups(con_in_groups<ind_peaks(i));
        b = flip(b);
        try 
            b = b(1:15);
        catch
        end
        b1 = b(diff(b)<-3);
        if ~isempty(b1) && abs(b(1)-ind_peaks(i))<3
            pre = b1(1);
        else
            pre = ind_peaks(i);
        end
        
        %post
        b = con_in_groups>ind_pea(1) ;
        b1 = con_in_groups<ind_pea(2) ;
        b2 = con_in_groups(b+b1 == 2);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)>3);
        if ~isempty(b1) && abs(b2(1)-ind_pea(i))<3
            post = b1(1);
        else
            post = ind_pea(i);
        end
        
    elseif i>1&& i<length(ind_pea)
        
        %% prior
        b3 = ind_peaks>ind_pea(i-1) ;
        b4 = ind_peaks<=ind_pea(i) ;
        b = ind_peaks(b3+b4 == 2);
        cita = b(1); % beginning of a peak
        
        b3 = con_in_groups<cita ;
        b4 = con_in_groups>ind_pea(i-1) ;
        b = con_in_groups(b3+b4 == 2);
        b2 = flip(b);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)<-3);
        if ~isempty(b1) && abs(b2(1)-cita)<3
            pre = b1(1);
        else
            pre = cita;
            %pre = ind_pea(cita);
        end
        
        %% post
        b3 = ind_peaks>ind_pea(i) ;
        b4 = ind_peaks<=ind_pea(i+1) ;
        b = ind_peaks(b3+b4 == 2);
        cita = b(1); % beginning of a peak
        
        b3 = con_in_groups>ind_pea(i) ;
        b4 = con_in_groups<cita ;
        b2 = con_in_groups(b3+b4 == 2); 
        try
            b2 = b2(1:15);
        catch
        end
        b = b2(diff(b2)>3);
        if ~isempty(b) && abs(b2(1)-ind_pea(i))<3
            post = b(1);
        else
            post = ind_pea(i);
        end
   
    else
        %prior
        b3 = ind_peaks>ind_pea(i-1) ;
        b4 = ind_peaks<=ind_pea(i) ;
        b = ind_peaks(b3+b4 == 2);
        cita = b(1); % beginning of a peak
        
        b3 = con_in_groups<cita ;
        b4 = con_in_groups>ind_pea(i-1) ;
        b = con_in_groups(b3+b4 == 2);
        b2 = flip(b);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)<-3);
        if ~isempty(b1) && abs(b2(1)-cita)<3
            pre = b1(1);
        else
            pre = ind_pea(cita);
        end
        
        %post
        %b3 = con_in_groups>ind_pea(i) ;
        cita = ind_pea(i);
        
        cil = con_in_groups>ind_pea(i);
        b2 = con_in_groups(cil);
        try 
            b2 = b2(1:15);
        catch
        end
        b1 = b2(diff(b2)>3);
        if ~isempty(b1)  && abs(b2(1)-cita)<3
            post = b1(1);
        else
            post = ind_pea(i);
        end
    end    
    bor{i} = [pre;post];
end


vecs = [];
for i =1:length(bor)
    az = find(con_in_groups==bor{i}(1));
    az1 = find(con_in_groups==bor{i}(2));
    con_in_groupa = con_in_groups(az:az1);
    roter_1= [con_in_groupa(1);con_in_groupa(diff(con_in_groupa)>5);con_in_groupa(end)];
    try
        try
            cur_l=evalin('base','cur_lim');
        catch
            warndlg('Unexpected Error Type, please retry or restart session','Variables Error');
            return
        end
        try
            try
                cur_l=evalin('base','cur_lim');
                lim_graph = evalin('base','lim_graph');
                cond_peaks=evalin('base',strcat('cond_peaks',cur_l));
                peak_spec=evalin('base',strcat('peak_spec',cur_l));
                avail= evalin('base',strcat('avai_spik_',cur_l));
                if lim_graph == 1
                    if str2double(peak_spec)>avail
                        warndlg('Please select a value less or equal to the maximum available','Index Error');
                        return
                    end
                    if cond_peaks==1
                        v1 = 1;
                        v2 = str2double(peak_spec);
                    elseif cond_peaks==2
                        v2 = length(roter_1);
                        v1 = (length(roter_1)-str2double(peak_spec));
                    elseif cond_peaks==3
                        des_roter_1 = length(roter_1)-((str2double(peak_spec))+1);
                        v1 = ceil(des_roter_1/2)+1;
                        v2 = length(roter_1)-(floor(des_roter_1/2));
                    else
                        v1 = 1;
                        v2 = avail+1;
                    end
                    des_roter_1 = roter_1(v1:v2);
                else
                    try
                        des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                        des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                        des_roter_1 = roter_1((des_spike_1):(des_spike_2+1));
                    catch
                        des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                        des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                        des_roter_1 = roter_1(des_spike_1:(des_spike_2));
                    end
                end
            catch
                try
                    des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                    des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                    des_roter_1 = roter_1((des_spike_1):(des_spike_2+1));
                catch
                    des_spike_1 = str2double(evalin('base',strcat('des_spike_',cur_l,'1')));
                    des_spike_2 = str2double(evalin('base',strcat('des_spike_',cur_l,'2')));
                    des_roter_1 = roter_1(des_spike_1:(des_spike_2));
                end
                
            end
        catch
            if (length(roter_1)>=10) && (length(roter_1)<16)
                des_roter_1 = roter_1 ;
            else
                des_roter_1 = length(roter_1)-16;
                des_roter_1 = roter_1(ceil(des_roter_1/2)+1:end-floor(des_roter_1/2));
            end
        end
    catch
        if (length(roter_1)>=10) && (length(roter_1)<16)
            des_roter_1 = roter_1 ;
        else
            des_roter_1 = length(roter_1)-16;
            des_roter_1 = roter_1(ceil(des_roter_1/2)+1:end-floor(des_roter_1/2));
        end       
    end
    vecs =[vecs;con_in_groupa];
    %%
    oer= {};
    doer= {};
    doerer= {};
    for j = 2:length(des_roter_1)
        a1=con_in_groups>des_roter_1(j-1);
        a2=con_in_groups<=des_roter_1(j);
        ed = a1==a2; edw = con_in_groups(find(ed, sum(ed)));
        ed0 = edw(end)+1;
        ed = [edw;ed0];
        oer(j-1)={data_ind(ed)};
        doer(j-1)= {ed};
        doerer(j-1)= {timer(ed)};
    end
    region(i) = {oer};
    region_1(i) = {doer};
    region_2(i) = {doerer};
    region_3(i) = {roter_1};
end
assignin('base','ind_peaks',vecs)
end

function  plot_readings(sel_var_i,list_2,list_1,timer,sel_shoe_i,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state,pan)
%data_ind_1 =
tag1 = get(pan,'Tag');

try
    doo = evalin('base','operation_mode');
    if doo == 2 && strcmp(tag1(end),'2') % manual mode
        children = get(pan, 'children');
        delete(children);
        ind_ts = num_ind_peak{sel_var_i};
        ind_peaks = ind_peak{sel_var_i};
        subplot(1,1,1,'Parent',pan) ;
        plot(data_ind,'-p','MarkerIndices',ind_peaks,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',2);
        titled_1  = 'All Peaks Selected';
        title(titled_1);
        xlabel({'Time'},'FontSize',7)
        % ylabel('Readings')
        make_tick ={};
        for i = 1:length(ind_ts)
            make_tick{i} = floor(timer(ind_ts(i)));
        end
        set(gca,'XTick',ind_ts,'XTickLabel',make_tick,'fontsize',7)
        return
    end
catch    
end




foundlim = evalin('base','uni_lim');
num = evalin('base','cur_lim');
peak_now = evalin('base',strcat('sel_peak_',num));
foundlim = foundlim(sel_var_i);

try
    numo=evalin('base',strcat('ptile1_',num));
catch
end

children = get(pan, 'children');
delete(children);
% delete
subplot(1,1,1,'Parent',pan) ;
h(1)=plot(data_ind);

ind_peaks = ind_peak{sel_var_i};

hold on
if strcmp(tag1(end),'2')
    po = time_indices{sel_var_i};
else
    try
        lim_spike = evalin('base','lim_spike');
        time_ind = evalin('base',strcat('des_inv1_',num));
        if lim_spike == 2
            %             spike_now = evalin('base',strcat('sel_spike_',num));
            po = time_ind;
        else
            po = time_indices{sel_var_i};
        end
        
    catch
        po = time_indices{sel_var_i};
    end
end
assignin('base','por',ind_peaks)
assignin('base','pord',po)
h(2)=plot(data_ind,'p','MarkerIndices',ind_peaks,'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',3);
hold on
h(3)= plot(data_ind,'p','MarkerIndices',po,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',4);


h(4) = refline([0 foundlim]);
h(4).Color = ('r');
h(4).LineWidth = 2;

try
    h(5) = refline([0 numo]);
    h(5).Color = ('k');
    h(5).LineWidth = 2;
catch
    limos = evalin('base',strcat('peaks_cell_',num));
    
    if peak_now <= length(limos)
        numo  = limos{peak_now}(1);
        nums  = limos{peak_now}(2);
        h(5) = refline([0 numo]);
        h(5).Color = ('k');
        h(5).LineWidth = 2;
        h(6) = refline([0 nums]);
        h(6).Color = ('r');
        h(6).LineWidth = 2;
        delete(h(4));
    else
        delete(h(4));
    end
end

ind_ts = num_ind_peak{sel_var_i};

if strcmp(tag1(end),'2')
    legend(h([2 3 4]),{'Unconsidered spikes', 'Considered spikes','Limit'},'Orientation', 'Horizontal','Location', 'northoutside','FontSize',7);
else
    lim_graph = evalin('base','lim_graph');
    if lim_graph==2
        ind_no = evalin('base',strcat('des_ind1_',num));
        ind_noe = evalin('base',strcat('des_inde_',num));
        xlim([ind_no*0.975 ind_noe*1.025])
        try
            lim_spike = evalin('base','lim_spike');
            if lim_spike == 2
                titled_1  = 'Current Peak and Spike Selected';
            else
                titled_1  = 'All Spikes of Current Peak Selected';
            end
        catch
            titled_1  = 'Current Peak Selected';
        end
        
        
    else
        titled_1  = 'All Peaks Selected';
    end
    title(titled_1,'Interpreter', 'none');
end

if strcmp(tag1(end),'2')
    po = time_indices{sel_var_i};
else
    try
        lim_spike = evalin('base','lim_spike');
        time_ind = evalin('base',strcat('des_inv1_',num));
        
        if lim_spike == 2
            spike_now = evalin('base',strcat('sel_spike_',num));
            po = time_ind;
        else
            po = time_indices{sel_var_i};
        end
        
    catch
        po = time_indices{sel_var_i};
    end
end

xlabel({'Time'},'FontSize',7)
% ylabel('Readings')
make_tick ={};
for i = 1:length(ind_ts)
    make_tick{i} = floor(timer(ind_ts(i)));
end
set(gca,'XTick',ind_ts,'XTickLabel',make_tick,'fontsize',7)
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
if strcmp(data_source ,'SHOE')
    original_tag=evalin('base','original_tag');
    data_r = [data(:,2:end),data(:,1)];
    assignin('base',strcat('dat_shoe_',original_tag),data_r);
    hf = findobj('Tag',strcat('shoe_data_tab_',original_tag));
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
athleten = evalin('base','athlete');
if con == 1
    % get tag  for edited, (1 or 2)
    original_tag = evalin('base','original_tag');
    add_sub_1 = evalin('base',strcat('sel_sub_',original_tag));
    add_surf_1 = evalin('base',strcat('sel_surf_',original_tag));
    add_shoe_1 = evalin('base',strcat('sel_shoe_',original_tag));
    %     surf_1 = evalin('base','rem_surf_1');
    %     shoe_1 =  evalin('base','rem_shoe_1');
else
    add_sub_1 = evalin('base','add_sub_1');
    add_surf_1 = evalin('base','add_surf_1');
    add_shoe_1 = evalin('base','add_shoe_1');  
end

try
    Sw = getfield(athleten,add_sub_1); % try get athlete
catch
    athleten = setfield(athleten,add_sub_1,struct());
    Sw = getfield(athleten,add_sub_1);
end

try
    Sx = getfield(Sw,add_surf_1);
    
catch
    Sw = setfield(Sw,add_surf_1,struct());
    Sx = getfield(Sw,add_surf_1);
end

try
    Sy = getfield(Sx,add_shoe_1); % try get athlete
catch
    Sx = setfield(Sx,add_shoe_1,struct());
    Sy = getfield(Sx,add_shoe_1);
end
dat_shoe_1 = [data(:,2:end),data(:,1)];
Sy.Data = dat_shoe_1;

%%
Sx = setfield(Sx,add_shoe_1,Sy);
Sw = setfield(Sw,add_surf_1,Sx);
athleten = setfield(athleten,add_sub_1,Sw);
assignin('base','athlete',athleten);
pathed = evalin('base','pathed');
save([strcat(pathed,'\athletes.mat')],'athleten');
if con ==2
    hf = findobj('Tag','Databasetab');
    hf =hf(1);
    athl = fieldnames(athleten); % get listed athletes
    %% get athletes info for display
    athletes = uppertolower(athl,1);
    athletes{length(athletes)+1} ='ADD NEW ATHLETE';
    assignin('base','athletes',athletes)
    accessdatabase(hf);
    Analyze();
    evalin('base','clear add_sub_1 add_surf_1 add_shoe_1');
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