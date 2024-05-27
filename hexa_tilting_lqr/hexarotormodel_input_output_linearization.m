% input_output_linearization
% clear all
%% 状態空間表現
hexarotormodel_linearization
%load("linearization_model")
f=simplify(fx);
g=simplify(gx);
h=simplify(hx);
[n,m]=size(g); x=sym('x',[n,1]); u=sym('u',[m,1]);
%% 条件
[flag,kf,GAMMA,bargammak]=StructureA(f,g,h,x);
if flag==0
    display('By Thm , NOT locally i-o linearizable.');
    return
end
display('By Thm , system is locally i-o linearizable.');
%% 線形化
bsk=length(GAMMA);
D=Lfh(g,GAMMA,x);
D0=subs(D,x,x-x);
L1=RowReorder(D0');
R1=L1';
bD=D*R1;
bS1=bD(:,1:bsk);
bS2=bD(:,bsk+1:m);
R2=jacobian(u,u);
R2(1:bsk,:)=[inv(bS1) -inv(bS1)*bS2];
beta=R1*R2;
t3=Lfh(f,GAMMA,x);
alpha=beta(:,1)-beta(:,1);
alpha(1:bsk)=t3;
alpha=-beta*alpha;
alpha=simplify(alpha);
beta=simplify(beta);
fc=simplify(f+g*alpha);
gc=simplify(g*beta);
Tc=h;
save("linearization_input_output.mat","fc","gc","alpha","beta","h")
return