function out=transp(M)
s=size(M);
out=M'-M';
for k1=1:s(1)
out(:,k1)=M(k1,:);
end
out=simplify(out);