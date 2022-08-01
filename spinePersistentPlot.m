%load spine measurement data and make cumulative plot
clear all;
set(0,'defaultaxeslinewidth',3);    %sets the plotting parameters
set(0,'defaultaxesfontsize',16);
set(0,'defaulttextfontsize',16);

dataControl1=[3 1 1 1; 1 0 0 0; 1 0 0 0; 5 3 3 3; 4 2 nan 2; 3 0 1 2; 5 2 2 1; 6 4 3 2; 6 4 4 4; 4 1 1 1; 4 3 3 3; 3 1 0 1; 3 1 1 1];
dataControl2=[4 3 2 nan; 3 2 1 nan; 2 0 0 nan; 2 1 1 nan; 4 1 1 nan; 3 1 nan nan; 7 1 nan nan; 4 1 0 nan; 3 2 2 nan; 5 3 2 nan];
dataKet1=[4 nan 0 0; 14 nan 5 2; 7 nan 3 1; 3 nan 2 2; 9 nan 8 7; 2 nan 1 1; 10 nan 3 2];
dataKet2=[6 5 1 1; 8 2 0 0; 5 1 1 1; 8 3 3 3; 10 3 3 3; 6 1 0 0; 8 4 3 3; 4 2 1 1; 13 3 2 2; 18 6 5 nan; 2 1 1 0; 16 8 5 5; 13 3 1 1];
dataKet3=[7 4 2 1; 3 0 0 0; 1 0 nan nan; 9 2 2 nan; 6 0 0 0; 12 4 4 1];

dataControl=[dataControl1; dataControl2];
dataKet=[dataKet1; dataKet2; dataKet3];

%%
figure;

subplot(2,2,1); hold on;
title('Fraction of new spines that persist (%)');

subplot(2,2,3); hold on;
time=2;
bar(1,100*nanmean(dataControl(:,time)./dataControl(:,1)),'FaceColor','k','EdgeColor','k');
plot(1*[1 1],100*(nanmean(dataControl(:,time)./dataControl(:,1))+[0 nanstd(dataControl(:,time)./dataControl(:,1))./sqrt(size(dataControl,1))]),'k-','LineWidth',2);
time=3;
bar(2,100*nanmean(dataControl(:,time)./dataControl(:,1)),'FaceColor','k','EdgeColor','k');
plot(2*[1 1],100*(nanmean(dataControl(:,time)./dataControl(:,1))+[0 nanstd(dataControl(:,time)./dataControl(:,1))./sqrt(size(dataControl,1))]),'k-','LineWidth',2);
time=4;
bar(3,100*nanmean(dataControl(:,time)./dataControl(:,1)),'FaceColor','k','EdgeColor','k');
plot(3*[1 1],100*(nanmean(dataControl(:,time)./dataControl(:,1))+[0 nanstd(dataControl(:,time)./dataControl(:,1))./sqrt(size(dataControl,1))]),'k-','LineWidth',2);
xlabel('Day');
set(gca,'xticklabel',{'5' '10' '15'},'xtick',1:1:3);
xlim([0 4]); ylim([0 50]);

subplot(2,2,4); hold on;
time=2;
bar(1,100*nanmean(dataKet(:,time)./dataKet(:,1)),'FaceColor','b','EdgeColor','b');
plot(1*[1 1],100*(nanmean(dataKet(:,time)./dataKet(:,1))+[0 nanstd(dataKet(:,time)./dataKet(:,1))./sqrt(size(dataKet,1))]),'b-','LineWidth',2);
time=3;
bar(2,100*nanmean(dataKet(:,time)./dataKet(:,1)),'FaceColor','b','EdgeColor','b');
plot(2*[1 1],100*(nanmean(dataKet(:,time)./dataKet(:,1))+[0 nanstd(dataKet(:,time)./dataKet(:,1))./sqrt(size(dataKet,1))]),'b-','LineWidth',2);
time=4;
bar(3,100*nanmean(dataKet(:,time)./dataKet(:,1)),'FaceColor','b','EdgeColor','b');
plot(3*[1 1],100*(nanmean(dataKet(:,time)./dataKet(:,1))+[0 nanstd(dataKet(:,time)./dataKet(:,1))./sqrt(size(dataKet,1))]),'b-','LineWidth',2);
xlim([0 4]); ylim([0 50]);
xlabel('Day');
set(gca,'xticklabel',{'5' '10' '15'},'xtick',1:1:3);
xlim([0 4]);

%%
disp('% at day 5, saline vs ket, unpaired t-test p-value: ');
[h,p,ci,stat]=ttest2(dataControl(:,2)./dataControl(:,1),dataKet(:,2)./dataKet(:,1));
p

disp('% at day 5 vs 10, control, paired t-test p-value: ');
[h,p,ci,stat]=ttest(dataControl(:,2)./dataControl(:,1),dataControl(:,3)./dataControl(:,1));
p

disp('% at day 5 vs 15, control, paired t-test p-value: ');
[h,p,ci,stat]=ttest(dataControl(:,2)./dataControl(:,1),dataControl(:,4)./dataControl(:,1));
p

disp('% at day 5 vs 10, ket, paired t-test p-value: ');
[h,p,ci,stat]=ttest(dataKet(:,2)./dataKet(:,1),dataKet(:,3)./dataKet(:,1));
p

disp('% at day 5 vs 15, ket, paired t-test p-value: ');
[h,p,ci,stat]=ttest(dataKet(:,2)./dataKet(:,1),dataKet(:,4)./dataKet(:,1));
p
