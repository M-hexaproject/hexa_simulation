%% グラフ

label_lim % ラベルの各種値

for k = 0:3
    figure(k+1)
    l = k*3;
    for i = 1:3
        subplot(3,1,i)
        plot(t,xf(:,l+i),'linewidth',2);
        hold on
        yline(Xref(l+i),'linestyle','- -','color','red','linewidth',1);
        grid
        if i == 3
            xlabel('$$t$$','Interpreter','latex')
        end
        ylabel(Xstr(i+l),'Interpreter','latex') ;
%         xlabel('$$t$$','Interpreter','latex')
        fontsize=18;
        h=gca;
        set(h,'fontsize',fontsize)
        ylim([Ylim(2*(l+i)-1) Ylim(2*(l+i))])
    end
end
k = k + 1;

figure(k+1)%u ばらばらに表示
for i = 1:6
    subplot(3,2,i)
    plot(t,ucal(i,:),'linewidth',2);
    grid
    xlabel('$$t$$','Interpreter','latex')
    ylabel(ustr(i),'Interpreter','latex')
    fontsize=12;
    h=gca;
    set(h,'fontsize',fontsize)
    hold on
end
k = k + 1;

figure(k+1)%u まとめて表示
for i = 1:6
    if i <= 3
        plot(t,ucal(i,:),'linestyle','-','linewidth',2);
        hold on
    else
        plot(t,ucal(i,:),'linestyle','- -','linewidth',2);
        hold on
    end
end
grid
xlabel('$$t$$','Interpreter','latex')
ylabel('$$u$$','Interpreter','latex')
legend('$$u_1$$','$$u_2$$','$$u_3$$','$$u_4$$','$$u_5$$','$$u_6$$','Interpreter','latex')
fontsize=12;
h=gca;
set(h,'fontsize',fontsize)
k = k + 1;

% tlen_3d = round(tlen/scale_3d);
% xf_3d = zeros(tlen_3d,3);
% for i = 0:tlen_3d-1
%     xf_3d(i,1) = xf(i*scale_3d+1,1);
%     xf_3d(i,2) = xf(i*scale_3d+1,2);
%     xf_3d(i,3) = xf(i*scale_3d+1,3);
% end

figure(k+1)
for i = 1:6
    if i <= 3
        plot(t,rotor_rad(i,:),'linestyle','-','linewidth',2);
        hold on
    else
        plot(t,rotor_rad(i,:),'linestyle','- -','linewidth',2);
        hold on
    end
end
grid
xlabel('$$t$$','Interpreter','latex')
ylabel('$$u$$','Interpreter','latex')
legend('$$\omega_1$$','$$\omega_2$$','$$\omega_3$$','$$\omega_4$$','$$\omega_5$$','$$\omega_6$$','Interpreter','latex')
fontsize=12;
h=gca;
set(h,'fontsize',fontsize)
k = k + 1;


figure(k+1)
plot3(xf(:,1),xf(:,2),xf(:,3),'linewidth',1,'LineStyle',":",'Marker',"o");
% plot3(xf_3d(:,1),xf_3d(:,2),xf_3d(:,3),'linewidth',1,'LineStyle',":",'Marker',"o");
grid
hold on
[X,Y] = meshgrid(0:5:5,0:5:5);
Z = [1,1;1,1];
surf(X,Y,Z,'FaceAlpha',0.5,'FaceColor',"y")
%% %EOF