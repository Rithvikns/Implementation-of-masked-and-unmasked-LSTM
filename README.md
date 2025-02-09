Here in this repo you get the code to implement the long short term memory (lstm) neural network from scratch on an FPGA .
I am using Spartan 6 FPGA board which is compatible with ISE 14.7 .
In case of any enquiries email me :- rithviknswamy@gmail.com .



The dataset used is an MNIST datset .The MNIST dataset, standing for Modified National Institute of Standards and Technology database,
is a large repository of handwritten digits widely recognized in the field of machine learning and
computer vision. It contains a set of 60,000 training images and 10,000 test images . These digits
are collected from a blend of scanned documents written by American Census Bureau employees
and high school students. The unique aspect of this dataset is that each image is size-normalized
and centered in a 28x28 pixel frame, making it a standard benchmark for algorithms in image
processing and pattern recognition.

Let's divide the work into different tasks .

## Task 1: Convert Real numbers to Fixed Point numbers

In ISE 14.7 the exponential function is not available and it cannot synthesize floating point numbers .

Therefore I am using a 16 bit binary number to represent a floating point number from start(input) to end (output) . Let me explain with a small example = "1000010100101101"

the first bit represents the sign bit . 0 - positive number , 1 - Negative number . 
in the example it is a negative number .

the next seven bits represents integer part of the number .
in the example it is 0000101 which is '5' .

the next eight bits represents fractional part of the number .
in the example it is 00101101 which is '0.17578125' .

The number is "1000010100101101" = -5.17578125 .

In this python code you can convert the numbers back and forth . 
```console
def binary_16bit_to_float(binary_representation):
    # Extract sign bit
    sign_bit = -1 if binary_representation[0] == '1' else 1
    
    # Extract integer part
    integer_part = int(binary_representation[1:8], 2)
    
    # Extract fractional part
    fractional_part = int(binary_representation[8:], 2) / 256.0
    
    # Combine integer and fractional parts
    number = sign_bit * (integer_part + fractional_part)
    
    return number
```
```console
def float_to_binary_16bit(number):
    # Handle sign
    sign_bit = '0' if number >= 0 else '1'
    
    # Split the number into integer and fractional parts
    integer_part = abs(int(number))
    fractional_part = abs(number) - integer_part
    
    # Convert integer part to 7-bit binary
    integer_binary = bin(integer_part)[2:].zfill(7)
    
    # Convert fractional part to 8-bit binary
    fractional_binary = format(int(fractional_part * 256), '08b')
    
    # Combine sign, integer, and fractional parts
    binary_representation = sign_bit + integer_binary + fractional_binary
    
    return binary_representation
```
## Task 2:Implementing Sigmoid and Tanh Function .

The python code to convert all the values of sigmoid function is in https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/python%20Scripts/sigmoid.py .
the python code to convert all the values  of tanh function is in https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/python%20Scripts/tanh.py .
Then the initial binary values is converted to int to create a look up table for sigmoid and tanh fuction .
```console
0 to 4 => "0000000010000000",
5 to 8 => "0000000010000001",
9 to 12 => "0000000010000010",
13 to 16 => "0000000010000011",
17 to 20 => "0000000010000100",
21 to 24 => "0000000010000101",
25 to 28 => "0000000010000110",

......

33904 to 34008 => "0000000000000010",
34009 to 34186 => "0000000000000001",
34187 to 65535 => "0000000000000000");

```
The VHDL code for sigmoid function :-  https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/lstm/neuron_1/sigmoid.vhd  .
similarly you can find the code for tanh function here :- https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/lstm/neuron_1/tanh.vhd .

## Task 3 : Implementing a LSTM neuron with two unit cells .

Long Short-Term Memory (LSTM) networks are a type of recurrent neural network (RNN)
architecture used in the field of deep learning. Unlike traditional RNNs, which struggle to capture
long-term dependencies in sequence data due to problems like vanishing or exploding gradients,
LSTMs are specifically designed to address this issue. They achieve this through their unique
structure, which includes memory cells that can maintain information in memory for long periods,
and gates that regulate the flow of information into and out of these cells. This allows LSTMs
to effectively remember and utilize past information, making them particularly suited for tasks
involving sequential data, such as time series prediction, natural language processing, and speech
recognition

Forget Gate: This gate determines which information should be discarded from the cell state.
It examines the short-term memory (the previous hidden state 𝐻𝑡 −1) and the current input 𝑋𝑡 ,
applying the equation 𝑓𝑡 = 𝜎(𝑊 𝑓 · [𝐻𝑡 −1, 𝑋𝑡 ] + 𝑏 𝑓 ), where 𝜎 is the sigmoid function, 𝑊 𝑓 is
the weight matrix for the forget gate, and 𝑏 𝑓 is the bias.

Input Gate: This gate decides on the new information to be stored in the cell state. It employs
two equations: one to generate a vector of candidate values ˜𝐶𝑡 = tanh(𝑊𝐶 · [𝐻𝑡 −1, 𝑋𝑡 ] + 𝑏𝐶 ),
and another to decide which values will be updated 𝑖𝑡 = 𝜎(𝑊𝑖 · [𝐻𝑡 −1, 𝑋𝑡 ] + 𝑏𝑖 ).

• Output Gate: This gate determines the next hidden state 𝐻𝑡 , which will be output. It first
computes 𝑜𝑡 = 𝜎(𝑊𝑜 · [𝐻𝑡 −1, 𝑋𝑡 ] + 𝑏𝑜), then updates the cell state to 𝐶𝑡 , and finally computes
the new hidden state as 𝐻𝑡 = 𝑜𝑡 ∗ tanh(𝐶𝑡 ).


To understand the working of a unit cell you can look at the figure https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/Diagram/LSTM%20unit%20Cell.pdf .
I am using a two staged unit cells inside a lstm neuron .
The code for the the neuron is in https://github.com/Rithvikns/lstm_neural_network_on_fpga/tree/main/lstm/neuron_1 .


## Task 4 : Implementing a LSTM network .

The lstm network gets an input of 784 numbers each number is 16 bit long . The numbers are divided into sets of 28 which represents each row of the image . The below image represents number 7 as you can observe each row has 28 numbers .
```console
[1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
```

So now each input is fed to the neuron having teo unit cell and is processed , The long and short memory are reset and the beginning of each row .
The code is in :- https://github.com/Rithvikns/lstm_neural_network_on_fpga/tree/main/lstm .

## Task 4 : Implementing a Fully Connected network .

The 4 layered FCNN used is 30-30-10-10 . This means that the first layer has 30 neurons , second layer has 30 neurons , third layer has 10 neurons and the last layer has 10 neurons .
The diagram represents how an FCNN works .

![FCNN_Example](https://github.com/Rithvikns/lstm_neural_network_on_fpga/assets/86957380/24398b5e-96c7-461f-be48-f15b2b4305df)

The complete python code using just for and if loop with the weights and biases is provided in https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/python%20Scripts/Final%20LSTM%20Neural%20Network.py .
The code provides an accuracy of 90% .
The vhdl code to implement this is provided in https://github.com/Rithvikns/lstm_neural_network_on_fpga/tree/main/fully_connected .
There is a seperate testbench folder to examine each layer seperately .

## Task 5 : Final Task is to Combine these two Networks.

To visualise this you can click here https://github.com/Rithvikns/lstm_neural_network_on_fpga/blob/main/Diagram/LSTM%20Neural%20Network.pdf .
the output recognises the handwritten digit number as expected from the vhdl code . 


