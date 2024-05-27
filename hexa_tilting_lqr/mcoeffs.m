function [C,T] = mcoeffs(P,vars)
% mcoeffs.m    Coeffients of Matrix Polynomial
%
% [C,T] = mcoeffs(P,vars)
%
% INPUT
% P: matrix polymomial
% vars: variable vector
%
% OUTPUT
% C: coefficient matrix cell
% T: monomial vector
%
% USAGE
% >> syms x1 x2
% >> P = [2*x1^2+4*x1*x2-1 3*x1*x2; 2*x1^2+x2 4*x2^2];
% >> [C,T] = mcoeffs(P,[x1;x2]);
% >> C{1}
% ans =
% [2, 0]
% [2, 0]
% >> T(1)
% ans = 
% x1^2
%

% December 12, 2023 written by Hiroyuki Ichihara

% size of matrix polynomial
[nr,nc] = size(P);

% extract coefficients of each components with monomials
CC = cell(nr,nc);
TT = cell(nr,nc);
TT_ = 0;
for ii = 1:nr
for jj = 1:nc
 [CC{ii,jj},TT{ii,jj}] = coeffs(P(ii,jj),vars);
 TT_ = TT_+sum(TT{ii,jj});
end
end

% gather monomials
[~,T] = coeffs(TT_,vars);

% collect coefficient matrices
nT = length(T);
C = cell(1,nT);
for kk = 1:nT
for ii = 1:nr
for jj = 1:nc
 lo = has(TT{ii,jj},T(kk));
 C{kk}(ii,jj) = CC{ii,jj}*lo';
end
end
end

end
% EOF