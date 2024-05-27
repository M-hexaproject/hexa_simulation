function [Ac,Bc,alpha,beta] = hexarotor_dynamics_input_output(Rotordeg)
%load("linearization_input_output")

hexarotormodel_input_output_linearization
Ac = [zeros(3,3) eye(3) zeros(3,3) zeros(3,3);zeros(3,12);zeros(3,9) eye(3);zeros(3,12)];
Bc = double(gc);

save("1.mat","Ac","Bc","alpha","beta","h")