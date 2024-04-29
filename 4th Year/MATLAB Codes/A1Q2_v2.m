figure('Position', [100,100,1600,540]);

cnt = 1;
h=[.1, .75, 1.5];
lamda = -2;
dy = @(x,y) lamda*y;
u(1) = 0; %initial x
v(1) = 5; %initial y

for h_cnt = 1:length(h)
    for i=1:100-1
        v(i+1) = v(i)+ h(h_cnt)*dy(u(i),v(i));
        u(i+1) = u(i)+ h(h_cnt);
    end

    subplot(1,length(h),cnt)
    cnt = cnt+1;
    hold on
    plot(u,v);
    
    % syms y(x)
    % sol = dsolve(diff(y,1)==lamda*y, y(0)==5);
    % fplot(sol,'r--')
    % legend('euler','exact')
    % xlim([0,5])
    title(sprintf('for h=%4.2f',h(h_cnt)))
end