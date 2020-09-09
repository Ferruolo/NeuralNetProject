addpath 'infa';
addpath 'function_lib';
%Read Mnist




path = "infa/mnist_png/mnist_png/training/";
disp("Loading Data...");
data = readMnist(path);
disp("Data Loaded! Building Network...");
layers = [lay_wrapper(layer(1,logistic(1), 28, 50, [28 50]))  %Input: 28*28; Output: 28*50
    lay_wrapper(layer(2, logistic(2), 50, 10, [28 10]))       %Input: 28*50; Output: 28x10
    lay_wrapper(output_layer(3, logistic(3), 1, 28, [1 10]))];%Input: 28x10; Output: 1x10

%Build Network
loss_fxn = MSEloss();
update_fxn = SGD(0.0000001);%Hyperparam that yielded best results
net = network(layers, update_fxn);
disp("TRAINING")
net = train(net, data, 10000, loss_fxn);

test = net_forward(net, data(42345).img);
disp("**************Testing on object #1500**************");
disp("Out");
disp(test.output.value);
disp("expected");
disp(data(42345).label.value);