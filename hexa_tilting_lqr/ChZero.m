function out=ChZero(M)
out=0;
s=size(M);
for k1=1:s(1)
for k2=1:s(2)
if M(k1,k2) ~= M(1,1)-M(1,1)
return
end
end
end
out=1;