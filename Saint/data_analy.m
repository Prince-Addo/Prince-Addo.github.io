
vard = 1; 
lim_stater = 2;
curlim = 2;

brand = T_data;
[res,rest,rester,total,shoe,timer,time_indices,ind_peak,num_ind_peak,region_3]= compare(brand,lim_stater,vard);

figo ={};
for i = 1 :length(ind_pe)
    try
        ol  = (ind_pea>ind_pe(i-1)) + (ind_pea<=ind_pe(i));
        oz = ind_pea(ol==2);
        figo{i} = oz(1:2);
    catch
        try
            ol  = (ind_pea<=ind_pe(i));
            oz = ind_pea(ol==1);
            figo{i} = oz(1:2);
        catch
        end
    end
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
[res{k},rest{k},rester{k}] = fetch_data(data_ind,timer);

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

function [region,region_1,region_2] = fetch_data(data_ind,timer)
%peaks = data_ind > (mean(data_ind)+(3*(std(data_ind))));
assignin('base','data_ind',data_ind)
if  (1.5*prctile(data_ind,85)) > prctile(data_ind,89)
    if prctile(data_ind,50) ~=0 && prctile(data_ind,50)>15
        peaks = data_ind >prctile(data_ind,89.55);
    else
        peaks = data_ind >prctile(data_ind,89.2);
    end
else
    peaks = data_ind >prctile(data_ind,89);
end
%peaks = data_ind > prctile(data_ind,99.4);
ind_peaks = find(peaks, sum(peaks));
con_in_groups = ind_peaks(diff(ind_peaks)==1);
con_out_groups = [con_in_groups(diff(con_in_groups)>10);con_in_groups(end)];
distinct_sessions = con_out_groups(diff(con_out_groups)>100);
disce = [distinct_sessions;con_in_groups(end)];
distinct_sessns = [con_out_groups(diff(con_out_groups)>500);disce(end)];
assignin('base','ind_peaks',con_in_groups);
assignin('base','ind_pea',disce);
assignin('base','ind_pe',distinct_sessns);
%assignin('base','peaks',peaks);
prev = 0;
region= {};
region_1= {};
region_2= {};

for i =1:length(disce)
    if i>1
        prev = find(con_out_groups==disce(i-1));
    end
    rote_1 = find(con_out_groups==disce(i));
    roter_1 = con_out_groups(prev+1:rote_1);
    %assignin('base','roter_1',roter_1);
    if (length(roter_1)>=10) && (length(roter_1)<16)
        des_roter_1 = roter_1 ;
    else
        des_roter_1 = length(roter_1)-3;
        des_roter_1 = roter_1(ceil(des_roter_1/2)+1:end-floor(des_roter_1/2));
        %assignin('base','des_roter_1',des_roter_1);
    end
    
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
end
end
