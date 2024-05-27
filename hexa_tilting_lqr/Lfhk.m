function out=Lfhk(f,h,x,k)
out = h;
for n=1:k
out=simplify(Lfh(f,out,x));
end
out = simplify(out);
