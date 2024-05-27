function out=ChInverseF(F,iF,x)
out=0;
cc1=simplify(subs(F,x,iF));
if ChZero(cc1-x)==0
return
end
cc2=simplify(subs(iF,x,F));
if ChZero(cc2-x)==0
return
end
out=1;