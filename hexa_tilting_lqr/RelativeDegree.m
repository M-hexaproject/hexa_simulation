function rho=RelativeDegree(f,g,h,x)
for k=1:length(h)
rho(k)=CharacterNum(f,g,h(k),x);
end