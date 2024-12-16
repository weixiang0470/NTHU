# **Supervised Learning**
- Feed Forward Neural Networks(FFNNs)
    - classification and regression based on features
```
Input(values) -> Dense Encoder -> Representation -> Prediction <-> Ground truth
```
- Convolutional Neural Network (CNNs)
    - image classification, object detection, video action recognition
```
Input(image) -> Convolutional Encoder(conv,acti,pool,flat,dense) -> Representation -> Prediction <-> Ground Truth
```
- Reccurent Neural Networks (RNNs)
    - language modeling, speech recognition/generation 
```
Input(sequence) -> Reccurent Encoder(self loop) -> Represtiontation -> Prediction <-> Ground Truth
```
- Encoder Decoder Architectures
    - semantic segmentation, machine translation
    - Attention mechanism, Transformer 
```
Input(img/text/...) -> Any Encoder(img/text -> vector/matric) -> Representation -> Any Decoder(vector/matric -> img/text) -> Prediction(img/text/...) <-> Ground Truth(img/text/...)
```


## **RNN**
1. Basic rnn is a **short term** memorise network, output of $x_1 -> h_1$(hidden state) will **feedback** into next round and **impact future output & hidden state** $x_2,x_3,...$, but the impact of $x_1$ will **diminish over time**.
2. Long Short Term Memory (**LSTM**) of RNN designed to keep the **long-term** and **short-term** memory using **cell state** and **hidden state**.
    - **Forget gate** : To control which part of cell state from the **previous cell state** should be **kept or forgotten**,[0~1] ==> 0 -> forget all,1 -> keep all.
        - $f_t = \sigma(W_f \cdot [h_{t-1}, x_t] + b_f)$
    - **Input gate** : To control how much **candidate state** should be added to the **cell state**. (candidate state computed by **current input** and **previous hidden state**)
        - $\tilde{C}_t = \tanh(W_C \cdot [h_{t-1}, x_t] + b_C)$ (candidate state)
        - $i_t = \sigma(W_i \cdot [h_{t-1}, x_t] + b_i)$
        - $C_t = f_t * C_{t-1} + i_t * \tilde{C}_t$
    - **Output gate** : To control how much the **cell state** should **contribute** to the **current hidden state & output**
        - $o_t = \sigma(W_o \cdot [h_{t-1}, x_t] + b_o)$
        - $h_t = o_t * \tanh(C_t)$
3. Model types
    - 1 to 1 : normal classification and regression
    - 1 to n : generate text or audio
    - n to 1 : stock prediction by time series, heart beat predict die or not
    - n to n : Q&A systems

## **Encoder Decoder Architecture**
1. Attention mechanism
    - To eliminates the **vanishing gradient** in RNN, provides direct connections between encoder and decoder.
    - Ask the network to **weigh its sensitive** to the input based on memory on previous inputs
    - Hard vs Soft attention
        - **Soft attention** : Function varies **smoothly** over its domain, **differentiable** 
        - **Hard attention** : Varies **discretely** over its domain, **non-differentiable**
    - **Dynamically scores** the **relationship** between 2 states **_(current Q and each input K)_**, these scores determine how much each corresponding **_V_** will contribute into final context vector.
        - Q(query),K(key),V(value)
    - Global vs local attention
        - Global attention : Consider the **entire input** units/tokens
        - Local attention : Only consider a **subset of input** units/tokens
2. Transformer
    - **Self attention**
        - Use to find the **attention scores**(relationships) between an **input word** and **other words** in the sequence, then generate the **weighted representation**(Z) of each word based on these scores(relationships). 
            - Attention score : softmax(Q @ K)
            - Z = Sum(attention scores @ V)
                - Summation of dot product of attention scores with corresponding V
        - Ex: "The cat sat on the mat", if now we got input "cat", then self attention will compute the attention scores between "cat" and all other words "The","sat","on","the","mat". These **attention scores** represent **how** much each word **contribute** to the **representation** of "cat". The final representation of "cat" is determined by the **weighted sum** of the **V** of these words, where **weights** are given by the **attention scores**.
    - **Cross attention**
        - Use to find the **attention relationship** of **current output**(hidden state) of **_decoder_** and **output** of **_encoder_**.
        - **Q** is from **current hidden state** of **_decoder_**, while **K** and **V** are from output(**self-attention result**) of **_encoder_**.
        - Help decoder **generate output** based on the **relationship** between **decoder's current state** and entire **input sequence** provided by the encoder.

# **Unsupervised Learning**
- Autoencoder
    - Unsupervised embeddings, denoising
```
Input(img/text/...) -> Any Encoder -> Representation -> Any Decoder -> Input(img/text/...)
```
- Generative Adversarial Networks (GANs)
    - Generate realistic images
```
Input(noise) -> Generator(to cheat discriminator) -> Fake Image -> Discriminator(to identify real of fake) -> Predict real or fake 
                                                                            ^
                                                                            |
                                                                        Real image
```
## **Autoencoder**
1. Convolutional AutoEncoder
    - Encoder **transforms** the **input image** into **compressed representation**(feature map) through convolutional layers that capture the **essential features** of the image.
    - Decoder **reconstructs** the input image **from** the **feature map** by progressively **upsampling** it using deconvolutional layers.
2. Variational AutoEncoder (VAE)
    - Encoder **transforms** the **input** image into a **set of parameters**(mean and variance) that define a **Gaussian distribution** in the **latent space**.
    - Decoder **reconstructs** the image by **sample drawn** from the **latent space** (Gaussian distribution by encoder)

## **Generative Adversarial Networks (GANs)**
1. Generator 
    - To **generate fake image** that **resemble** to **real image** in order **to fool discriminator**. The **goal** is to **generates** images that are **indistinguishable** from **real images**.
2. Discriminator
    - To **distinguish** between **real images**(from dataset) and **fake images**(by generator). The **goal** is to **correctly identify** whether is **real or fake**.

## **Diffusion Models**
- Use to generate high quality images through adding noise and then reversing it to recover the image.
1. Forward diffusion
    - Keep adding noise to an images over multiple time steps, transforming it into pure noise
2. Backward diffusion
    - Learns to reverse the forward diffusion process, start from pure noise and removes noise step by step. The goal is to recover the original image from pure noise.

## **Good Generative AI**
1. High quality
2. Diversity
3. Fast 