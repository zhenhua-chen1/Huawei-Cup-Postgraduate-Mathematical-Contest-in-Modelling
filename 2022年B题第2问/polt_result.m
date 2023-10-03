function polt_result(Materials,b)
%画图
load data1
 flag=0;
s = cell2mat(Materials(:,2));
[v,p] = sort(s,'descend' );
for i =1:length(v)
    if v(i)>0.8
        p1=p(i);
        pos = Materials{p1,3};
        item = Materials{p1,1};
        item_size = data1{item,[4,5]};
        if length(item_size)~=length(pos)
            continue
        end
        f = Materials{p1,4};
        flag2=0;
        if isempty(find(pos<0))
            [a,~] = size(pos);
                    if f==0
                        ylim([0 1220])
                        xa = [0 1220];
                        xlim([0 2440])
                        xb = [0 2440];
                        n_v = tabulate(item_size(:,1));
                        [~,n_v2] = max(n_v(:,2));
                        n_v = n_v(n_v2);
                    else
                        xlim([0 1220])
                        ylim([0 2440])
                        xa = [0 2440];
                        xb = [0 1220];
                        n_v = tabulate(item_size(:,2));
                        [~,n_v2] = max(n_v(:,2));
                        n_v = n_v(n_v2);
                    end

            
            for j =1: a
                if pos(j,1)+item_size(j,1)<=max(xb) && pos(j,2)+item_size(j,2)<=max(xa)&&pos(j,1)<=max(xb)&&pos(j,2)<=max(xa)
                   if flag2 == 0
                        fg=figure('visible','off');
                        xlim(xb)
                        ylim(xa)
                        xticks(xb)
                        yticks(xa)
                        hold on
                        grid on
                        title(['第',num2str(b),'批次第',num2str(p1),'块板'])
                        flag2=1;
                    end
                    plot(pos(j,1)+item_size(j,1),pos(j,2)+item_size(j,2),'bo')
                    
                    text(pos(j,1)+item_size(j,1),pos(j,2)+item_size(j,2),['(',num2str(pos(j,1)+item_size(j,1)),',',num2str(pos(j,2)+item_size(j,2)),')']);
                    if pos(j,2)>=1/3*max(xa) &&pos(j,1)<=1/3*max(xb)&& flag~=1
                        line([pos(j,1)+item_size(j,1),pos(j,1)+item_size(j,1)],[pos(j,2)+item_size(j,2),xa(2)],'Color','blue')
                        flag=1;
                    else
                       
                        line([pos(j,1)+item_size(j,1),pos(j,1)+item_size(j,1)],xa,'Color','black')
                    end
                    
                    line(xb,[pos(j,2)+item_size(j,2),pos(j,2)+item_size(j,2)],'Color','yellow')
               folder_path = [folder_path,'/'];
               filename = ['第', num2str(b), '批次第', num2str(p1), '块板'];
               new_full_path = [folder_path, filename];
               if ~exist(folder_path, 'dir')
                    mkdir(folder_path);
               end
               % 定义完整的文件保存路径
               print(fg, '-dpng', '-r200', new_full_path)
                %print(fg,'-dpng','-r200', ['第',num2str(b),'批次第',num2str(p1),'块板']) 
               disp(['第',num2str(b),'批次第',num2str(p1),'块板'])
               end
            end
            
        end
    else
        break
    end
end
end
