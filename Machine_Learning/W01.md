# A good representation
- Image space
    - If we get 2 pixels as input, when we plot these pixels into space we could get a 2 dimensional input space.(x-axis (pixel 1) and y-axis(pixel 2))
    - We take the same place of pixel on images of Obama and Thrump then turn these pixels into input space.
    - Then we find a boundary to seperate the 2 different people(Thrump and Obama)
    - Inpossible to get the boundary to seperate these 2 different input
- Feature representations
    - Take feature as input and add into feature space, ex: eyes and mouth(x-axis is mouth, y-axis is eyes)
    - Easier to seperate two different people

# Inductive Learning
- Given examples of a function $(x,F(x))$
- Predict function $F(x)$ for new examples X
    - Discrete F(x) -> classification
    - Continuous F(x) -> Regression

# Types
- Supervised
    - Training data need to include desired outputs
- Unsupervised
    - Training data does not include desired outputs
- Self-supervised
    - Training data does not include desired(cat/dog) but alternative(inside/outside) outputs
    - A cat is inside/outside
    - A dog is inside/outside 

# Why validation
- To select the model, parameters
- Try to find a best model, parameters