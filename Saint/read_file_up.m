
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


function [dat,var1,T_data] = readdata(filename)
filename = 'sean McCMJ 3.txt';
opts = detectImportOptions(filename);
T = readtable(filename,opts);
VarName = T.Properties.VariableNames;
%%
[~,po] =size(T);
if po>10 || p == 18  % get for faulty data
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
    %% get time
    time =[];
    for i = 1:to
        roda = ROD(:,i);
        rodo = ol1(:,i);
        conda = roda(rodo==0);
        rol  = round(diff(conda),1,'significant');
        if round(mean(rol)*1000) == round(rol(2)*1000) || round(mean(rol)*1000) == round(rol(end-1)*1000)
            time =[time,i];
        end
        if ~isempty(time)
            return
        end
    end
    %%
    get_right = nanmean(ROD(:,time));
    RODg = ROD(:,time)>get_right; % get time values less than mean
    polu = find(RODg+~isnan(ROD(:,time))==0); % get na in time appearing early
    ROD(polu,:) = [];
    [~,q1] = size(ROD);
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
elseif po<6
else    
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
%%
[p,po] =size(T);
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
%% get time
time =[];
for i = 1:to
    roda = ROD(:,i);
    rodo = ol1(:,i);
    conda = roda(rodo==0);
    rol  = round(diff(conda),1,'significant');
    if round(mean(rol)*1000) == round(rol(2)*1000) || round(mean(rol)*1000) == round(rol(end-1)*1000)
        time =[time,i];       
    end 
    if ~isempty(time)
        return
    end
end
%%
get_right = nanmean(ROD(:,time));
RODg = ROD(:,time)>get_right; % get time values less than mean
polu = find(RODg+~isnan(ROD(:,time))==0); % get na in time appearing early
ROD(polu,:) = [];
[~,q1] = size(ROD);
if q1 == 14 && time ==1
    data1 = ROD(:,[1,2,4,6,8,10,12]);
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


%%
if po>11
    
end
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
