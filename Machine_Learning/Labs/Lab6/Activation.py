import numpy as np

class Activation():
    def __init__(self, activation_function, loss_function):
        self.activation_function = activation_function
        self.loss_function = loss_function
        self.cache = None

    def forward(self, Z):
        if self.activation_function == "sigmoid":
            """
            Implements the sigmoid activation in numpy

            Arguments:
            Z -- numpy array of any shape
            self.cache -- stores Z as well, useful during backpropagation

            Returns:
            A -- output of sigmoid(z), same shape as Z
            """

            # GRADED FUNCTION: sigmoid_forward
            ### START CODE HERE ###
            # Difficult 4
            
            A = np.where(Z>=0,1 / (1 + np.exp(-Z)),(np.exp(Z) / (1 + np.exp(Z))))
            # if Z.T@Z  : A = 1 / (1 + np.exp(-Z))
            # else      : A = np.exp(Z) / (1 + np.exp(Z))
            #print("forward Z:",Z.shape)
            # A = s_Z
            self.cache = Z.copy()
            ### END CODE HERE ###

            return A
        elif self.activation_function == "relu":
            """
            Implement the RELU function in numpy
            Arguments:
            Z -- numpy array of any shape
            self.cache -- stores Z as well, useful during backpropagation
            Returns:
            A -- output of relu(z), same shape as Z

            """

            # GRADED FUNCTION: relu_forward
            ### START CODE HERE ###
            # A = np.array([max(z,np.zeros(1)) for z in Z]) Difficult
            A = np.maximum(0, Z)
            #A = np.where(Z<0,0,Z)
            self.cache = Z.copy()
            ### END CODE HERE ###

            assert(A.shape == Z.shape)

            return A
        elif self.activation_function == "softmax":
            """
            Implements the softmax activation in numpy

            Arguments:
            Z -- np.array with shape (n, C)
            self.cache -- stores Z as well, useful during backpropagation

            Returns:
            A -- output of softmax(z), same shape as Z
            """

            # GRADED FUNCTION: softmax_forward
            ### START CODE HERE ###
            # print("Z=",Z.shape)#(3,4),3 row 4 column #keepdims=True
            b = np.max(Z,axis=1,keepdims=True) #b is the maximum value in each row of Z, and keep its dimension as Z
            #print("np.max(Z)=",Z,"b=",b)
            exp_Z = np.exp(Z-b) #Each column of same row will minus coresponding row in b
            A =  exp_Z / np.sum(exp_Z,axis=1,keepdims=True) 
            self.cache = Z.copy()
            #np.sum(exp_Z,axis=1,keepdims=True) : Will sum all columns in each row, keep dimension
            ### END CODE HERE ###

            return A
        elif self.activation_function == "linear":
            """
            Linear activation (returns Z directly).
            """
            self.cache = Z.copy()
            return Z

        else:
            raise ValueError(f"Unsupported activation function: {self.activation_function}")


    def backward(self, dA=None, Y=None):
        if self.activation_function == "sigmoid":
            """
            Implement the backward propagation for a single SIGMOID unit.
            Arguments:
            dA -- post-activation gradient, of any shape
            self.cache -- 'Z' where we store for computing backward propagation efficiently
            Returns:
            dZ -- Gradient of the loss with respect to Z
            """

            # GRADED FUNCTION: sigmoid_backward
            ### START CODE HERE ###
            Z = self.cache
            sig_Z = self.forward(Z)
            # print("sig_Z=",sig_Z,"1-sig_Z",1-sig_Z)
            dZ = dA * sig_Z * (1 - sig_Z)
            ### END CODE HERE ###

            assert (dZ.shape == Z.shape)

            return dZ

        elif self.activation_function == "relu":
            """
            Implement the backward propagation for a single RELU unit.
            Arguments:
            dA -- post-activation gradient, of any shape
            self.cache -- 'Z' where we store for computing backward propagation efficiently
            Returns:
            dZ -- Gradient of the loss with respect to Z
            """

            # GRADED FUNCTION: relu_backward
            ### START CODE HERE ###
            Z = self.cache
            #print("backward Z : ",Z.shape)
            # g_Z = np.array([np.ones(1) if z.T@z > 0 else np.zeros(1) for z in Z]) # Diffucult 2, will have problem in Model.forward
            g_Z = np.where(Z>0,1,0)
            # print("relu g_Z",g_Z," dA=",dA," Z=",Z)
            dZ = np.where(dA * g_Z==-0.,np.zeros(1),dA * g_Z)
            # dZ = dA
            # dZ[Z<=0]=0
            ### END CODE HERE ###

            assert (dZ.shape == Z.shape)

            return dZ

        elif self.activation_function == "softmax":
            """
            Implement the backward propagation for a [SOFTMAX->CCE LOSS] unit.
            Arguments:
            Y -- true "label" vector (one hot vector, for example: [1,0,0] represents rock, [0,1,0] represents paper, [0,0,1] represents scissors
                                      in a Rock-Paper-Scissors, shape: (n, C)
            self.cache -- 'Z' where we store for computing backward propagation efficiently
            Returns:
            dZ -- Gradient of the cost with respect to Z
            """

            # GRADED FUNCTION: softmax_backward
            ### START CODE HERE ###
            Z = self.cache
            s = self.forward(Z)
            dZ = s - Y
            ### END CODE HERE ###

            assert (dZ.shape == self.cache.shape)

            return dZ

        elif self.activation_function == "linear":
            """
            Backward propagation for linear activation.
            """
            return dA

        else:
            raise ValueError(f"Unsupported activation function: {self.activation_function}")