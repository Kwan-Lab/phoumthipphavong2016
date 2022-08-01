%load spine measurement data and make cumulative plot
clear all;
set(0,'defaultaxeslinewidth',3);    %sets the plotting parameters
set(0,'defaultaxesfontsize',16);
set(0,'defaulttextfontsize',16);

dirname='/Users/alexkwan/Box Sync/draft manuscripts/2015 victoria spines/';
filename='combined #28 and #86 pre and post ket.xlsx';

temp=xlsread(strcat(dirname,filename));

for k=1:2  
    if k==1 %new spines
        lengthPreKet(:,k)=temp(1:89,2);
        widthPreKet(:,k)=temp(1:89,3);
        lengthPostKet(:,k)=temp(104:end-7,2);
        widthPostKet(:,k)=temp(104:end-7,3);

        distPreKet(:,k)=nanmin(temp(1:89,4:5),[],2);
        distPostKet(:,k)=nanmin(temp(104:end-7,4:5),[],2);
        
    elseif k==2 %stable spines
        lengthPreKet(:,k)=temp(1:89,8);
        widthPreKet(:,k)=temp(1:89,9);
        lengthPostKet(:,k)=temp(104:end-7,8);
        widthPostKet(:,k)=temp(104:end-7,9);
    
        distPreKet(:,k)=nanmin(temp(1:89,8:9),[],2);
        distPostKet(:,k)=nanmin(temp(104:end-7,8:9),[],2);
    end
end

%%
figure;

subplot(2,3,1); hold on;
[fNew,edges]=ecdf(lengthPostKet(:,1));
plot(edges,fNew,'k','LineWidth',3);
[fStable,edges]=ecdf(lengthPostKet(:,2));
plot(edges,fStable,'r','LineWidth',3);
title('Post-ketamine');
xlabel('Spine length (um)');
ylabel('Cumulative fraction');
legend('New','Existing','location','SouthEast');
legend('boxoff');
xlim([0 3]);

[h,p,ci,stat]=ttest(lengthPostKet(:,1),lengthPostKet(:,2));
[h,p,ksstat]=kstest2(lengthPostKet(:,1),lengthPostKet(:,2))

subplot(2,3,4); hold on;
[fNew,edges]=ecdf(widthPostKet(:,1));
plot(edges,fNew,'k','LineWidth',3);
[fStable,edges]=ecdf(widthPostKet(:,2));
plot(edges,fStable,'r','LineWidth',3);
title('Post-ketamine');
xlabel('Spine width (um)');
ylabel('Cumulative fraction');
xlim([0 2]);

[h,p,ci,stat]=ttest(widthPostKet(:,1),widthPostKet(:,2));
[h,p,ksstat]=kstest2(widthPostKet(:,1),widthPostKet(:,2))

subplot(2,3,2); hold on;
[fPreK,edges]=ecdf(lengthPreKet(:,1));
plot(edges,fPreK,'k','LineWidth',3);
[fPostK,edges]=ecdf(lengthPostKet(:,1));
plot(edges,fPostK,'b','LineWidth',3);
title('New spines');
xlabel('Spine length (um)');
ylabel('Cumulative fraction');
legend('Pre-ket','Post-ket','location','SouthEast');
legend('boxoff');
xlim([0 3]);

[h,p,ksstat]=kstest2(lengthPreKet(:,1),lengthPostKet(:,1))

subplot(2,3,5); hold on;
[fPreK,edges]=ecdf(widthPreKet(:,1));
plot(edges,fPreK,'k','LineWidth',3);
[fPostK,edges]=ecdf(widthPostKet(:,1));
plot(edges,fPostK,'b','LineWidth',3);
title('New spines');
xlabel('Spine width (um)');
ylabel('Cumulative fraction');
xlim([0 2]);

[h,p,ksstat]=kstest2(widthPreKet(:,1),widthPostKet(:,1))

subplot(2,3,3); hold on;
[fPreK,edges]=ecdf(lengthPreKet(:,2));
plot(edges,fPreK,'k','LineWidth',3);
[fPostK,edges]=ecdf(lengthPostKet(:,2));
plot(edges,fPostK,'b','LineWidth',3);
title('Existing spines');
xlabel('Spine length (um)');
ylabel('Cumulative fraction');
xlim([0 3]);

[h,p,ksstat]=kstest2(lengthPreKet(:,2),lengthPostKet(:,2))

subplot(2,3,6); hold on;
[fPreK,edges]=ecdf(widthPreKet(:,2));
plot(edges,fPreK,'k','LineWidth',3);
[fPostK,edges]=ecdf(widthPostKet(:,2));
plot(edges,fPostK,'b','LineWidth',3);
title('Existing spines');
xlabel('Spine width (um)');
ylabel('Cumulative fraction');
xlim([0 2]);

[h,p,ksstat]=kstest2(widthPreKet(:,2),widthPostKet(:,2))

set(gcf,'Position',[40 40 800 450]);  %laptop
set(gcf, 'PaperPositionMode', 'auto');
%saveas(gcf, [filename(1:end-4) '-' 'Fig1'], 'fig'); %fig format

% %%
% figure;
% subplot(2,3,1); hold on;
% [fNew,edges]=ecdf(distPostKet(:,1));
% plot(edges,fNew,'k','LineWidth',3);
% [fStable,edges]=ecdf(distPostKet(:,2));
% plot(edges,fStable,'r','LineWidth',3);
% title('Post-ketamine');
% xlabel('Distance to nearest spine (um)');
% ylabel('Cumulative fraction');
% legend('New','Stable','location','SouthEast');
% xlim([0 10]);
% 
% set(gcf,'Position',[40 40 1000 600]);  %laptop
% set(gcf, 'PaperPositionMode', 'auto');
% %saveas(gcf, [filename(1:end-4) '-' 'Fig1'], 'fig'); %fig format

