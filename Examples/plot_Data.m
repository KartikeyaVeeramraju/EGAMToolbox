close all
clc

figfont = 10;

%% Startup
if strcmp(testType,'start')

    iL1fig = figure(1);

    simoff = -1*(params.starttime+min(SwStartZero.time)); %min(Startup.time);
    spanlo = 0.15;%0.85*(min(SwStartZero.time)); %0.85*params.starttime;
    spanhi = 0.25;%sim_time+min(SwStartZero.time);

    hold on
    grid on
    grid on
    plot(t+simoff,real(iL1_t'),'-');
    plot(iL1_sim.time+simoff, iL1_sim.signals.values,'--');

    %legend('EGAM','PLECS','interpreter','latex','Location','best')
    legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
    xline(params.steptime - params.starttime,'--','HandleVisibility','off');
    xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
    ylabel('$$i_{L1}(t)$$ (A)','interpreter','latex','FontSize',figfont)
    xlim([spanlo spanhi])


    vC1fig = figure(2);
    hold on
    grid on
    plot(t+simoff,real(vC1_t'),'-');
    plot(vC1_sim.time+simoff, vC1_sim.signals.values,'--');

    %legend('EGAM','PLECS','interpreter','latex','Location','best')
    legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
    xline(params.steptime - params.starttime,'--','HandleVisibility','off');
    xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
    ylabel('$$v_{C1}(t)$$ (V)','interpreter','latex','FontSize',figfont)
    %xlim([-params.starttime sim_time-params.starttime ])
    xlim([spanlo spanhi])

    iL2fig = figure(3);
    hold on
    grid on
    plot(t+simoff,real(iL2_t'),'-');
    plot(iL2_sim.time+simoff, iL2_sim.signals.values,'--');

    %legend('EGAM','PLECS','interpreter','latex','Location','best')
    legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
    xline(params.steptime - params.starttime,'--','HandleVisibility','off');
    xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
    ylabel('$$i_{L2}(t)$$ (A)','interpreter','latex','FontSize',figfont)
    %xlim([-params.starttime sim_time-params.starttime ])
    xlim([spanlo spanhi])

    vC2fig = figure(4);
    hold on
    grid on
    plot(t+simoff,real(vC2_t'),'-');
    plot(vC2_sim.time+simoff, vC2_sim.signals.values,'--');

    %legend('EGAM','PLECS','interpreter','latex','Location','best')
    legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
    xline(params.steptime - params.starttime,'--','HandleVisibility','off');
    xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
    ylabel('$$v_{C2}(t)$$ (V)','interpreter','latex','FontSize',figfont)
    %xlim([-params.starttime sim_time-params.starttime ])
    xlim([spanlo spanhi])
    %fh.WindowState = 'maximized';


    %% Load step
elseif strcmp(testType,'loadstep')

    off = -params.steptime;%min(Load_Step.time) ;
    xlimmin = params.steptime - 2/50;
    xlimmax = params.steptime + 2/50;
    
    xlimminZoom = params.steptime - 0.1/50;
    xlimmaxZoom = params.steptime + 0.1/50;

    iL1fig = figure(1);
    subplot(2,1,1)
        hold on
        grid on
        grid on
        plot(t,iL1_t','-');
        plot(iL1_sim.time, iL1_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.steptime,'--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L1}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])
    subplot(2,1,2)
        hold on
        grid on
        grid on
        plot(t,iL1_t','-');
        plot(iL1_sim.time, iL1_sim.signals.values,'--');
        xline(params.steptime,'--','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L1}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimminZoom xlimmaxZoom])
    

    vC1fig = figure(2);
    subplot(2,1,1)
        hold on
        grid on
        plot(t,vC1_t','-');
        plot(vC1_sim.time, vC1_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.steptime,'--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C1}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])
    
    subplot(2,1,2)
        hold on
        grid on
        plot(t,vC1_t','-');
        plot(vC1_sim.time, vC1_sim.signals.values,'--');
        xline(params.steptime,'--','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C1}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimminZoom xlimmaxZoom])

    iL2fig = figure(3);
    subplot(2,1,1)
        hold on
        grid on
        plot(t,iL2_t','-');
        plot(iL2_sim.time, iL2_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.steptime,'--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L2}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])

    subplot(2,1,2)
        hold on
        grid on
        plot(t,iL2_t','-');
        plot(iL2_sim.time, iL2_sim.signals.values,'--');
        xline(params.steptime,'--','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L2}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimminZoom xlimmaxZoom])

    vC2fig = figure(4);
    subplot(2,1,1)
        hold on
        grid on
        plot(t,vC2_t','-');
        plot(vC2_sim.time, vC2_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.steptime,'--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C2}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])
        %fh.WindowState = 'maximized';

    subplot(2,1,2)
        hold on
        grid on
        plot(t,vC2_t','-');
        plot(vC2_sim.time, vC2_sim.signals.values,'--');
        xline(params.steptime,'--','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C2}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimminZoom xlimmaxZoom])


    %% Mod step
elseif strcmp(testType,'modstep')

    off = params.modsteptime + 4.015e-3;
    xlimmin = params.modsteptime - 2/50;
    xlimmax = params.modsteptime + 2/50;

    xlimminZoom = params.modsteptime - 0.1/50;
    xlimmaxZoom = params.modsteptime + 0.1/50;

    iL1fig = figure(1);
    %subplot(2,1,1)
        hold on
        grid on
        plot(t,iL1_t','-');
        plot(iL1_sim.time, iL1_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.modsteptime,'k--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L1}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])



    vC1fig = figure(2);
        hold on
        grid on
        plot(t,vC1_t','-');
        plot(vC1_sim.time, vC1_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.modsteptime,'k--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C1}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])
        ylim([0 60])

    

    iL2fig = figure(3);
        hold on
        grid on
        plot(t,iL2_t','-');
        plot(iL2_sim.time, iL2_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.modsteptime,'k--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$i_{L2}(t)$$ (A)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])


    vC2fig = figure(4);
        hold on
        grid on
        plot(t,vC2_t','-');
        plot(vC2_sim.time, vC2_sim.signals.values,'--');
        legend('EGAM','PLECS','interpreter','latex','Location','northoutside','orientation','horizontal')
        xline(params.modsteptime,'k--','HandleVisibility','off');
        xline(xlimminZoom,'r:','HandleVisibility','off');
        xline(xlimmaxZoom,'r:','HandleVisibility','off');
        xlabel('$$t$$(s)','interpreter','latex','FontSize',figfont)
        ylabel('$$v_{C2}(t)$$ (V)','interpreter','latex','FontSize',figfont)
        xlim([xlimmin xlimmax])

end

