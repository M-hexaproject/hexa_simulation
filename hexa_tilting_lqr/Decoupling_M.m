function [E,D]=Decoupling_M(f,g,h,x,rho)
t1=h-h;
for k=1:length(h)
t1(k)=Lfhk(f,h(k),x,rho(k)-1);
end
t1=simplify(t1);
D=simplify(Lfh(g,t1,x));
E=simplify(Lfh(f,t1,x));