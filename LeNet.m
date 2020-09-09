%Simple implementation of LeNet
%Architecture:
%   Convolution #1. Input = 32x32x1. Output = 28x28x6 conv2d
%   SubSampling #1. Input = 28x28x6. Output = 14x14x6. SubSampling is simply Average Pooling so we use avg_pool
%   Convolution #2. Input = 14x14x6. Output = 10x10x16 conv2d
%   SubSampling #2. Input = 10x10x16. Output = 5x5x16 avg_pool
%   Fully Connected #1. Input = 5x5x16. Output = 120
%   Fully Connected #2. Input = 120. Output = 84
%   Output 10


%read mnist


