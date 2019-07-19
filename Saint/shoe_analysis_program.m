%% First part 
% Run this part at the start of each session, it loads the variables into the workspace. 
shoe_label = {'vasalies.mat','vasaliesspike.mat','vasiligrass.mat','vasilitoad.mat'};
for i  = 1:length(shoe_label)
    load(shoe_label{i});
end
%% Second Part
% Run this part after the first part, repeat the run anytime you have to perform some analysis 
% The First and Second Part are the only areas of concern
% It opens a GUI everytime and allows a user to interact with the program 

%close all
clc
tf_1 = 0;
list_1 = {'vasalis_shoe', 'vasalis_spike', 'vasilitoad_shoe','vasiligrass_shoes'};
while tf_1 == 0
    [indx_1,tf_1] = listdlg('Name','Shoe Selection','PromptString','Select first shoe:','SelectionMode','single','ListString',list_1,'ListSize',[450,300]);
end
sel_shoe_1  = indx_1;
disp('First shoe selected')

tf_2 = 0;
promp = ['Shoe Selection: '  list_1{indx_1} ' ' 'selected as first shoe'];
while tf_2 == 0
    [indx_2,tf_2] = listdlg('Name',promp,'PromptString','Select second shoe: second shoe can be same as first','SelectionMode','single','ListString',list_1,'ListSize',[450,300]);
end
sel_shoe_2 = indx_2;
disp('Second shoe selected')


list_2 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
if tf_1 == 1 && tf_2 ==1
    tf_3 = 0;
    while tf_3 == 0
        [indx_3,tf_3] = listdlg('Name','First Shoe Factor Selection','PromptString','Select first factor:','SelectionMode','single','ListString',list_2,'ListSize',[450,300]);
    end
    disp('First Shoe Factor Selected')
    sel_var_1 = indx_3;
    
    tf_4 = 0;
    promp1 = ['Factor Selection: '  list_2{indx_3} ' ' 'selected as first factor'];
    while tf_4 == 0
        [indx_4,tf_4] = listdlg('Name',promp1,'PromptString','Second shoe factor selection: second factor can be same as first','SelectionMode','single','ListString',list_2,'ListSize',[450,300]);
    end
    disp('Second Shoe Factor Selected')
    sel_var_2 = indx_4;
end

if sel_shoe_2  == sel_shoe_1
    
    [res,rest,rester,trap_area,shoe,timer,time_indices,ind_peak,num_ind_peak]= compare(sel_shoe_1);
    if sel_var_1 == sel_var_2
        [num_peaks_1,num_peaks_2,t_errorr,t_errorr_1,data_ind] =  eq_sel_var(sel_var_1,list_2,trap_area,res,shoe);
        shoe_state = 'First Shoe';
        plot_readings(sel_var_1,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state);
        shoe_state = 'Second Shoe';
        plot_readings(sel_var_1,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state);
    else
        [num_peaks_1,~,t_errorr,t_errorr_1,data_ind] =  eq_sel_var(sel_var_1,list_2,trap_area,res,shoe);
        shoe_state = 'First Shoe';
        plot_readings(sel_var_1,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state);
        [~,num_peaks_2,t_errorr,t_errorr_1,data_ind] =  eq_sel_var(sel_var_2,list_2,trap_area,res,shoe);
        shoe_state = 'Second Shoe';
        plot_readings(sel_var_2,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state);
    end
    [sel_peak_1, sel_peak_2] = peak_selector(num_peaks_1,num_peaks_2,list_1,indx_1);
    
    if sel_peak_1 <= num_peaks_1 || sel_peak_2 <= num_peaks_2
        [sel_spike_1, sel_spike_2] = spike_selector(list_1,indx_1,sel_peak_1,sel_peak_2,num_peaks_1,num_peaks_2);
        goter = [sel_spike_1,sel_spike_2];
        gote = [sel_var_1,sel_var_2];
        got = [sel_peak_1,sel_peak_2];
        for o=1:length(goter)
            sel_spike_k = goter(o);
            sel_var_k = gote(o);
            sel_peak_k = got(o);
            if sel_spike_k<16
                hfig1 = figure;
                dat = res{sel_var_k}{sel_peak_k};
                if sel_spike_k> length(dat)
                    sel_spike_k = length(dat);
                end
                dater = res{sel_var_k}{sel_peak_k}{sel_spike_k};
                timers = rester{sel_var_k}{sel_peak_k}{sel_spike_k};
                area_1 = trapz(timers,dater)*100;
                if sel_spike_1<16 && sel_spike_2<16
                    subplot(2,1,o,'parent',hfig1)
                end
                area(timers,dater);
                title(['Area covered = ' num2str(area_1)])
                list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
                list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
                title(['Area covered = ' num2str(area_1) ' by Spike ' num2str(sel_spike_k) ' of ' list_11{sel_shoe_1} ': ' list_21{sel_var_k} ': Peak ' num2str(sel_peak_k)])
                xlim([min(timers )*0.999995 max(timers )*1.000005])
                xlabel('Time')
                ylabel('Readings')
            else
                plot_areas(sel_var_k,res,sel_spike_k,sel_peak_k,rester,sel_shoe_1)
            end
        end
        
        gote = [sel_var_1,sel_var_2];
        got = [sel_peak_1,sel_peak_2];
        for o = 1:length(gote)
            sel_var_k = gote(o);
            sel_peak_k = got(o);
            dat = res{sel_var_k};
            if sel_peak_k>length(dat)
                sel_peak_k = length(dat);
                [speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1);
                [speaked_2, ~,sum_2,mean_2] = tablevalues(trap_area,sel_var_2);
                list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
                list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
                FirstShoe=['All Peaks of ' list_21{sel_var_1} ' of ' list_11{sel_shoe_1}];
                SecondShoe=['All Peaks of ' list_21{sel_var_2} ' of ' list_11{sel_shoe_1}];
                if sel_peak_1>length(dat) && sel_peak_2>length(dat)
                    editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,1)
                    return
                else
                    if o ==2
                        FirstShoe = SecondShoe;
                        sum_1 =sum_2;
                        mean_1=mean_2;
                        speaked_1= speaked_2;
                    end
                    editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,0)
                end
            else
            end
            
        end
    else
        sel_var_k = sel_var_1;
        dat = res{sel_var_k};
        sel_peak_k = length(dat);
        [speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1);
        [speaked_2, ~,sum_2,mean_2] = tablevalues(trap_area,sel_var_2);
        list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
        list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
        FirstShoe=['All Peaks of ' list_21{sel_var_1} ' of ' list_11{sel_shoe_1}];
        SecondShoe=['All Peaks of ' list_21{sel_var_2} ' of ' list_11{sel_shoe_1}];
        if sel_peak_1>length(dat) && sel_peak_2>length(dat)
            editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,1)
        end
    end
    
else
    [res,rest,rester,trap_area,shoe,timer,time_indices,ind_peak,num_ind_peak]= compare(sel_shoe_1);
    [num_peaks_1,~,t_errorr,t_errorr_1,data_ind] =  eq_sel_var(sel_var_1,list_2,trap_area,res,shoe);
    shoe_state = 'First Shoe';
    plot_readings(sel_var_1,list_2,list_1,timer,sel_shoe_1,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state);
    
    [res_2,rest_2,rester_2,trap_area_2,shoe_2,timer_2,time_indices_2,ind_peak_2,num_ind_peak_2]= compare(sel_shoe_2);
    [~,num_peaks_2,t_errorr_2,t_errorr_1__2,data_ind_2] =  eq_sel_var(sel_var_2,list_2,trap_area_2,res_2,shoe_2);
    shoe_state = 'Second Shoe';
    plot_readings(sel_var_2,list_2,list_1,timer_2,sel_shoe_2,data_ind_2,time_indices_2,ind_peak_2,num_ind_peak_2,shoe_state);
    
    [sel_peak_1, sel_peak_2] = peak_selector(num_peaks_1,num_peaks_2,list_1,indx_1);
    
    if sel_peak_1 <= num_peaks_1 || sel_peak_2 <= num_peaks_2
        [sel_spike_1, sel_spike_2] = spike_selector(list_1,indx_1,sel_peak_1,sel_peak_2,num_peaks_1,num_peaks_2);
        goter = [sel_spike_1,sel_spike_2];
        gote = [sel_var_1,sel_var_2];
        got = [sel_peak_1,sel_peak_2];
        for o=1:length(goter)
            sel_spike_k = goter(o);
            sel_var_k = gote(o);
            sel_peak_k = got(o);
            if sel_spike_k<16
                hfig1 = figure;
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
                if sel_spike_1<16 && sel_spike_2<16
                    subplot(2,1,o,'parent',hfig1)
                end
                area(timers,dater);
                title(['Area covered = ' num2str(area_1)])
                list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
                list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
                if o == 1
                    title(['Area covered = ' num2str(area_1) ' by Spike ' num2str(sel_spike_k) ' of ' list_11{sel_shoe_1} ': ' list_21{sel_var_k} ': Peak ' num2str(sel_peak_k)])
                else
                    title(['Area covered = ' num2str(area_1) ' by Spike ' num2str(sel_spike_k) ' of ' list_11{sel_shoe_2} ': ' list_21{sel_var_k} ': Peak ' num2str(sel_peak_k)])
                end
                xlim([min(timers )*0.999995 max(timers )*1.000005])
                xlabel('Time')
                ylabel('Readings')
            else
                if o == 1
                    plot_areas(sel_var_k,res,sel_spike_k,sel_peak_k,rester,sel_shoe_1)
                else
                    plot_areas(sel_var_k,res,sel_spike_k,sel_peak_k,rester,sel_shoe_2)
                end
                
            end
        end
        
        gote = [sel_var_1,sel_var_2];
        got = [sel_peak_1,sel_peak_2];
        for o = 1:length(gote)
            sel_var_k = gote(o);
            sel_peak_k = got(o);
            if o == 1
                dat = res{sel_var_k}{sel_peak_k};
            else
                dat = res_2{sel_var_k}{sel_peak_k};
            end
            if sel_peak_k>length(dat)
                sel_peak_k = length(dat);
                if o == 1
                    [speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1);
                    [speaked_2, ~,sum_2,mean_2] = tablevalues(trap_area,sel_var_2);
                else
                    [speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area_2,sel_var_1);
                    [speaked_2, ~,sum_2,mean_2] = tablevalues(trap_area_2,sel_var_2);
                end
                
                list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
                list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
                
                if o == 1
                    FirstShoe=['All Peaks of ' list_21{sel_var_1} ' of ' list_11{sel_shoe_1}];
                    SecondShoe=['All Peaks of ' list_21{sel_var_2} ' of ' list_11{sel_shoe_1}];
                else
                    FirstShoe=['All Peaks of ' list_21{sel_var_1} ' of ' list_11{sel_shoe_2}];
                    SecondShoe=['All Peaks of ' list_21{sel_var_2} ' of ' list_11{sel_shoe_2}];
                end
                if sel_peak_1>length(dat) && sel_peak_2>length(dat)
                    editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,1)
                    return
                else
                    if o ==2
                        FirstShoe = SecondShoe;
                        sum_1 =sum_2;
                        mean_1=mean_2;
                        speaked_1= speaked_2;
                    end
                    editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,0)
                end
            else
            end
        end
    else
        dat_1 = res{sel_var_1};
        dat_2 = res_2{sel_var_2};
        [speaked_1, sb,sum_1,mean_1] = tablevalues(trap_area,sel_var_1);
        [speaked_2, ~,sum_2,mean_2] = tablevalues(trap_area_2,sel_var_2);
        list_21 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
        list_11 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
        FirstShoe=['All Peaks of ' list_21{sel_var_1} ' of ' list_11{sel_shoe_1}];
        SecondShoe=['All Peaks of ' list_21{sel_var_2} ' of ' list_11{sel_shoe_2}];
        if sel_peak_1>length(dat_1) && sel_peak_2>length(dat_2)
            editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,1)
        end
    end
end
clef()
%% Compare plots
function [t_error] = comp_brands_var(trap_area,indicator)

if indicator ~= 0
    a_1 = trap_area{indicator};
    t_error = mean(cell2mat(a_1));
    %t_error=1;
else
    error =[];
    for i = 1:length(trap_area)
        a_1 = trap_area{i};
        error = [error;mean(cell2mat(a_1))];
    end
    t_error = mean(error);
    %t_error =0;
end
end
%%

function [num_peaks_1,num_peaks_2,t_errorr,t_errorr_1,data_ind] = eq_sel_var(sel_var_1,list_2,trap_area,res,shoe)
if  sel_var_1 == length(list_2)
    [t_errorr] = comp_brands_var(trap_area,0);
    t_errorr_1 = t_errorr;
    num_peaks_1 = length(res{1});
    num_peaks_2 = num_peaks_1;
    data_ind = shoe;
else
    [t_errorr] = comp_brands_var(trap_area,sel_var_1);
    t_errorr_1 = t_errorr;
    num_peaks_1 = length(res{sel_var_1});
    num_peaks_2 = num_peaks_1;
    data_ind = shoe(:,sel_var_1);
end

end


function  plot_readings(sel_var_i,list_2,list_1,timer,sel_shoe_i,data_ind,time_indices,ind_peak,num_ind_peak,shoe_state)
fi = figure;
%data_ind_1 =
if sel_var_i < length(list_2)
    plot(data_ind);
    po = time_indices{sel_var_i};
    ind_peaks = ind_peak{sel_var_i};
    hold on
    plot(data_ind,'p','MarkerIndices',ind_peaks,'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',3)
    hold on
    plot(data_ind,'p','MarkerIndices',po,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',4)
    titled_1  = [shoe_state ' ' 'Preview: ' list_2{sel_var_i} ' ' 'of ' list_1{sel_shoe_i}];
    title(titled_1,'Interpreter', 'none')
    ind_ts = num_ind_peak{sel_var_i};
    legend('Readings','Unconsidered spikes', 'Considered spikes','Orientation', 'Horizontal')
    xlabel('Time')
    ylabel('Readings')
    make_tick ={};
    for i = 1:length(ind_ts)
        make_tick{i} = floor(timer(ind_ts(i)));
    end
    set(gca,'XTick',ind_ts,'XTickLabel',make_tick)
else
    dataind_1 = data_ind;
    ker = length(list_2)-1;
    ker_1 = ceil(ker/3);
    for i = 1:length(list_2)-1
        subplot(ker_1,3,i);
        sel_var_i = i;
        data_ind = dataind_1(:,sel_var_i);
        po = time_indices{sel_var_i};
        ind_peaks = ind_peak{sel_var_i};
        plot(data_ind);
        po = time_indices{sel_var_i};
        ind_peaks = ind_peak{sel_var_i};
        hold on
        plot(data_ind,'p','MarkerIndices',ind_peaks,'MarkerEdgeColor','red','MarkerFaceColor','red','MarkerSize',3)
        hold on
        plot(data_ind,'p','MarkerIndices',po,'MarkerEdgeColor','green','MarkerFaceColor','green','MarkerSize',4)
        titled_1  = [list_2{sel_var_i} ' ' 'of ' list_1{sel_shoe_i}];
        title(titled_1,'Interpreter', 'none')
        ind_ts = num_ind_peak{sel_var_i};
        xlabel('Time')
        ylabel('Readings')
        make_tick ={};
        for j = 1:length(ind_ts)
            make_tick{j} = floor(timer(ind_ts(j)));
        end
        set(gca,'XTick',ind_ts,'XTickLabel',make_tick)
    end
    suptitle([shoe_state ' ' 'Preview'])
end
end

function [res,rest,rester,total,shoe,timer,time_indices,ind_peak,num_ind_peak]= compare(brand)
shoe_lab = {'vasalis_shoe','vasalis_spike','vasilitoad_shoe','Vasiligrass_shoes'};
shoe_lab_t = {'vasalis_shoe_time','vasalis_spike_time','vasilitoad_shoe_time','Vasiligrass_shoes_time'};

Data_1 = evalin('base',shoe_lab{brand});
%Data_2 = evalin('base',shoe_lab{brand});

Data_1_t = evalin('base',shoe_lab_t{brand});
%Data_2_t = evalin('base',shoe_lab_t{brand});

shoe = Data_1;
timer = Data_1_t;

[~,h] = size(shoe);
res = {};
rest = {};
for k = 1:h
    data_ind = shoe(:,k);
    assignin('base','k',k)
    [res{k},rest{k},rester{k}] = fetch_data(data_ind,timer);
    ind_peak{k} = evalin('base','ind_peaks');
    num_ind_peak{k} = evalin('base','ind_pea');
end

time_indices ={};
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
if  (1.5*prctile(data_ind,95)) > prctile(data_ind,99)
    if prctile(data_ind,50) ~=0 && prctile(data_ind,50)>25
        peaks = data_ind >prctile(data_ind,99.55);
    else
        peaks = data_ind >prctile(data_ind,99.2);
    end
else
    peaks = data_ind >prctile(data_ind,99);
end
%peaks = data_ind > prctile(data_ind,99.4);
ind_peaks = find(peaks, sum(peaks));
con_in_groups = ind_peaks(diff(ind_peaks)==1);
con_out_groups = [con_in_groups(diff(con_in_groups)~=1);con_in_groups(end)];
distinct_sessions = con_out_groups(diff(con_out_groups)>3000);
disce = [distinct_sessions;con_in_groups(end)];
assignin('base','ind_peaks',con_in_groups);
assignin('base','ind_pea',disce);
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
        des_roter_1 = length(roter_1)-16;
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

function [sel_peak_1, sel_peak_2] = peak_selector(num_peaks_1,num_peaks_2,list_1,indx_1)
list_3 ={};
for i=1:num_peaks_1
    list_3{i} = num2str(i);
end
list_3{num_peaks_1+1} = 'All';

list_4 ={};
for i=1:num_peaks_2
    list_4{i} = num2str(i);
end
list_4{num_peaks_2+1} = 'All';

tf_5 = 0;
promp = ['Total of ' num2str(num_peaks_1) ' peaks available for selected first shoe: ' list_1{indx_1}];
while tf_5==0
    [indx_5,tf_5] = listdlg('Name','First Shoe: Selection of Peak (group of spikes)','PromptString',promp,'SelectionMode','single','ListString',list_3,'ListSize',[500,300]);
end
sel_peak_1 = indx_5;

if sel_peak_1  == length(list_4)
    promp_1 = ['Second Shoe: Selection of Peak, Peak: All,' ' selected for First shoe: ' list_1{indx_1}];
else
    promp_1 = ['Second Shoe: Selection of Peak, Peak: ' list_3{indx_5} ' selected for First shoe: ' list_1{indx_1}];
end

disp('Peak Selected for First Shoe')

tf_6 = 0;
promp = ['Total of ' num2str(num_peaks_2) ' peaks available for selected second shoe: ' list_1{indx_1}];
while tf_6==0
    [indx_6,tf_6] = listdlg('Name',promp_1,'PromptString',promp,'SelectionMode','single','ListString',list_4,'ListSize',[500,300]);
end
sel_peak_2 = indx_6;
disp('Peak Selected for Second Shoe')
end

function [sel_spike_1, sel_spike_2] = spike_selector(list_1,indx_1,sel_peak_1,sel_peak_2,n_peaks_1,n_peaks_2)
list_5 ={};
num_peaks_1= 15;
num_peaks_2= 15;
for i=1:num_peaks_1
    list_5{i} = num2str(i);
end
list_5{num_peaks_1+1} = 'All';

if sel_peak_1 <= n_peaks_1
    tf_7 = 0;
    promp = ['Total of ' num2str(num_peaks_1) ' spikes available for Peak: ' num2str(sel_peak_1) ' for selected first shoe: ' list_1{indx_1}];
    while tf_7==0
        [indx_7,tf_7] = listdlg('Name','First Shoe: Selection of Spike','PromptString',promp,'SelectionMode','single','ListString',list_5,'ListSize',[550,300]);
    end
    sel_spike_1 = indx_7;
    disp('Peak Selected for First Shoe')
    
    if sel_peak_1  == length(list_5)
        promp_1 = ['Second Shoe: Selection of Spike, Spike: All,' ' selected for First shoe: ' list_1{indx_1}];
    else
        promp_1 = ['Second Shoe: Selection of Spike, Spike: ' list_5{indx_7} ' selected for First shoe: ' list_1{indx_1}];
        
    end
else
    sel_spike_1 = 16;
    promp_1 = 'Second Shoe: Selection of Spike';
end

if sel_peak_2 <= n_peaks_2
    tf_8 = 0;
    promp = ['Total of ' num2str(num_peaks_2) ' spikes available for Peak: ' num2str(sel_peak_2) ' for selected second shoe: ' list_1{indx_1}];
    while tf_8==0
        [indx_8,tf_8] = listdlg('Name',promp_1,'PromptString',promp,'SelectionMode','single','ListString',list_5,'ListSize',[550,300]);
    end
    sel_spike_2 = indx_8;
    disp('Peak Selected for Second Shoe')
else
    sel_spike_2 = 16;
    
end
end

function  plot_areas(sel_var_1,res,sel_spike_1,sel_peak_1,rester,sel_shoe_1)
figure;
traps = [];
if  sel_peak_1<=length(res{sel_var_1})
    dat = res{sel_var_1}{sel_peak_1};
    ker = sel_spike_1-1;
    ker_1= ceil(ker/3);
    for i = 1:ker
        sel_var_i = i;
        if sel_var_i>length(dat)
            sel_var_i = length(dat);
        end
        subplot(3,ker_1,i);
        dater = res{sel_var_1}{sel_peak_1}{sel_var_i};
        timers = rester{sel_var_1}{sel_peak_1}{sel_var_i};
        area(timers,dater);
        area_1 = trapz(timers,dater)*100;
        title(['Spike ' num2str(sel_var_i) ' area = ' num2str(area_1)])
        traps= [traps;area_1];
    end
    list_2 = {'2W0020-L: heel','2W0020-L: forefoot','2W0020-L', '2W0021-R: forefoot', '2W0021-R: heel','2W0021-R'};
    list_1 = {'vasalis shoe', 'vasalis spike', 'vasilitoad shoe','vasiligrass shoes'};
    suptitle([list_1{sel_shoe_1} ': ' list_2{sel_var_1} ': Peak ' num2str(sel_peak_1) ': Spike Areas; Total = ' num2str(sum(traps)) ', Mean = ' num2str(mean(traps))])
end
end

function editPCAdata(speaked_1,speaked_2,sb,sum_1,sum_2,mean_1,mean_2,FirstShoe,SecondShoe,state)
FirstShoe_1 = ['Overall Total = ' num2str(sum_1)];
FirstShoe_2 = ['Overall Mean = ' num2str(mean_1)];
SecondShoe_1 = ['Overall Total = ' num2str(sum_2)];
SecondShoe_2 = ['Overall Mean = ' num2str(mean_2)];

MainFigScale = .6;
[~,f] = getscreen( MainFigScale,'COMPARISON OF ALL PEAKS FOR SELECTED SHOES AND FACTORS');
tgroup = uitabgroup('Parent', f);
tab1 = uitab('Parent', tgroup, 'Title', 'Peak Areas','BackgroundColor', 'blue');
a = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', FirstShoe,'Tag','Transpose', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.1  0.9 0.4 0.07]);

a_1 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', FirstShoe_1,'Tag','Transpose1', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.1  0.05 0.4 0.04]);

a_11 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', FirstShoe_2,'Tag','Transpose11', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.1  0.1 0.4 0.04]);

a1 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', 'Second Shoe','Tag','Deletecolrow', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.55  0.9 0.4 0.07]);

a1_1 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', SecondShoe_1,'Tag','Transpose1_1', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.55  0.05 0.4 0.04]);

a1_11 = uicontrol('Parent', tab1, 'Style', 'pushbutton', 'String', SecondShoe_2,'Tag','Transpose1_11', ...
    'HorizontalAlignment', 'left','Units', 'normal','BackgroundColor', 'green', 'Position', [0.55  0.1 0.4 0.04]);
%
as = uitable('Parent', tab1,'Units', 'normal','Position',[0.1  0.15 0.4 0.75],...
    'Visible','on','Tag','tabletabdata1' );

as1 = uitable('Parent', tab1,'Units', 'normal','Position',[0.55  0.15 0.4 0.75],...
    'Visible','on','Tag','tabletabdata2' );

as.Data = speaked_1;
as.ColumnName = sb;

as1.Data = speaked_2;
as1.ColumnName =sb;
a1.String = SecondShoe;

if state ==0
    as1.Visible = 'off';
    a1.Visible = 'off';
    a1_1.Visible = 'off';
    a1_11.Visible ='off';
    as.Position =  [0.15  0.15 0.7 0.75];
    a.Position =  [0.15  0.9 0.7 0.07];
    a_1.Position =  [0.15  0.05 0.7 0.04];
    a_11.Position =  [0.15  0.1 0.7 0.04];
end

end


function[PanelWidth,f] = getscreen( MainFigScale,Name)
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
    'Position',[ XBorder, YBorder, MaxWindowX, MaxWindowY ],...
    'NumberTitle', 'off',...
    'Name', Name,...
    'MenuBar', 'none',...
    'Resize', 'on',...
    'DockControls', 'off',...
    'Color', White);
end

function [peaked_1, b,sum_1,mean_1] = tablevalues(trap_area,sel_var_k)
r=  trap_area{sel_var_k};
oe =[];
for f =1 :length(r)
    np = length(r{f});
    if np < 15
        np_1 = 15-np-1;
        rodr = [r{f},r{f}(end-np_1:end)];
        oe = [oe;rodr];
    else
        oe = [oe; r{f}];
    end
end
mean_z = mean(oe,2);
mean_1 = mean(mean_z);
sum_z = sum(oe,2);
sum_1 = sum(sum_z);
t1 = 1:1:length(mean_z);
peaked_1 = [t1',mean_z , sum_z];
b = {'Peak Number';'Mean';'Total'};
end

function clef()
% closes empty figures
fig_array = get(0, 'Children');
for i = 1 : numel(fig_array)
    if isempty(get(fig_array(i), 'Children'))
        close(fig_array(i));
    end
end
end