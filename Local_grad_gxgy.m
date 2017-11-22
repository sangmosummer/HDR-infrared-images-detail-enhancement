function[gx,gy]=Local_grad_gxgy(I)
% input : input image(I)
% output : local gradient on x direction and y direction (gx and gy)
% we use Sobel operator here
% local gradient is a vector, whose size is equal to input image
% add zeros to the input image to become a (m+1)x(n+1) image
% started form the left-up pixel
[m,n] = size(I);
I = [zeros(1,n);I;zeros(1,n)];
I = [zeros(m+2,1),I,zeros(m+2,1)];
gx = zeros(m,n);
gy = zeros(m,n);
for i = 1:m-2
    for j = 1:n-2
        gx(i,j) = I(i+2,j)+2*I(i+2,j+1)+I(i+2,j+2)-I(i,j)-2*I(i,j+1)-I(i,j+2);
        gy(i,j) = I(i,j+2)+2*I(i+1,j+2)+I(i+2,j+2)-I(i,j)-2*I(i+1,j)-I(i+2,j);
    end
end
