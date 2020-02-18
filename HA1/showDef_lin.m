function xyz = showDef_lin(F,l,dm)

x = 200:5:300;
y = 200:5:300;
z = 200:5:300;

xyz = zeros(length(x),length(y), length(z));

for i = 1:length(x)
    for j = 1:length(y)
        for k = 1:length(z)
            K = VJM_lin_total(x(i)/1000, y(j)/1000, z(k)/1000,l,dm);
            temp = inv(K)*F
            xyz(i,j,k) = sqrt(temp(1)^2+temp(2)^2);
        end
    end    
end

end