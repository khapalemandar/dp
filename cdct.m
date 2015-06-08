function fv=cdct(img)
dct8=@(block_struct)dct2(block_struct.data);
bdct=blockproc(img,[8,8],dct8);
fv=zeros([1,125]);
x=1;
for i=1:8:40
    for j=1:8:200
        fv(x)=mean(mean(bdct(i:i+1,j:j+1)));
        x=x+1;
        fv(x)=std2(bdct(i:i+1,j:j+1));
        x=x+1;
        s2=sum(sum(bdct(i:i+1,j:j+1)));
        s4=sum(sum(bdct(i:i+3,j:j+3)));
        m4=(s4-s2)/12;
        s8=sum(sum(bdct(i:i+7,j:j+7)));
        m8=(s8-s4)/48;
        fv(x)=m4;
        x=x+1;
        bm=bdct(i:i+1,i+2:i+3);
        bm=cat(2,bm,bdct(i+2:i+3,i+2:i+3),bdct(i+2:i+3,i:i+1));
        fv(x)=std2(bm);
        x=x+1;
        fv(x)=m8;
        x=x+1;
        bl=bdct(i:i+3,i+4:i+7);
        bl=cat(2,bl,bdct(i+4:i+7,i+4:i+7),bdct(i+4:i+7,i:i+3));
        fv(x)=std2(bl);
        x=x+1;
    end
end

end



%
% for row=1:8:40
%     for column=1:8:200
%         % high
%         for i=1:2
%             x=randi([1 2]);
%             y=randi([1 2]);
%             fv(c)=bdct(x+row-1,y+column-1);
%              x
%              y
%             c=c+1;
%         end
%
%         % mid
%         for i=1:4
%             x=randi([3 4]);
%             y=randi([3 4]);
%             fv(c)=bdct(x+row-1,y+column-1);
%             x
%             y
%             c=c+1;
%         end
%
%         % low
%         for i=1:6
%             x=randi([5 8]);
%             y=randi([5 8]);
%             fv(c)=bdct(x+row-1,y+column-1);
%             x
%             y
%             c=c+1;
%         end
%     end
% end