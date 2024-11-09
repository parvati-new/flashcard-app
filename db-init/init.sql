-- db-init/init.sql

-- Create the 'flashcards' table
CREATE TABLE IF NOT EXISTS flashcards (
    id INT AUTO_INCREMENT PRIMARY KEY,
    question VARCHAR(1500) NOT NULL,
    answer VARCHAR(1500) NOT NULL,
    category VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert seed data into 'flashcards' table
INSERT INTO flashcards (question, answer, category) VALUES
('How is machine learning defined?', 'Machine learning is a field of artificial intelligence (AI) that enables systems to learn from data and improve their performance over time without being explicitly programmed.', 'Machine Learning'),
('What are the three main types of machine learning?', 'Supervised Learning, Unsupervised Learning, Reinforcement Learning', 'Machine Learning'),
('What characterizes supervised learning?', 'Supervised learning involves training a model on labeled data, where each input has a corresponding correct output. The goal is to predict the output for new, unseen inputs based on the learned patterns.', 'Machine Learning'),
('How does unsupervised learning differ from supervised learning?', 'Unsupervised learning deals with unlabeled data. The model tries to identify hidden patterns, structures, or relationships within the data without predefined labels.', 'Machine Learning'),
('Name three examples of supervised learning applications.', 'Spam Detection: Classifying emails as spam or not spam. Speech Recognition: Converting audio clips into text transcripts. Housing Price Prediction: Estimating house prices based on features like size and location.', 'Machine Learning'),
('Provide two examples of unsupervised learning applications.', 'Customer Segmentation: Grouping customers based on purchasing behavior. Anomaly Detection: Identifying unusual transactions that may indicate fraud.', 'Machine Learning'),
('What are the two main types of supervised learning problems?', 'Regression: Predicting continuous values (e.g., house prices). Classification: Categorizing inputs into discrete classes (e.g., spam vs. non-spam).', 'Machine Learning'),
('What is regression in supervised learning?', 'Regression involves predicting a continuous output variable based on one or more input features. Example: Predicting house prices based on size.', 'Machine Learning'),
('What is classification in supervised learning?', 'Classification involves categorizing inputs into predefined classes or categories. Example: Determining whether an email is spam or not spam.', 'Machine Learning'),
('What is the purpose of a cost function in machine learning?', 'The cost function measures how well the model\'s predictions match the actual target values. The goal is to minimize this cost to improve model accuracy.', 'Machine Learning'),
('What is the Mean Squared Error (MSE) cost function?', 'MSE is the average of the squared differences between predicted values (ŷ) and actual values (y).', 'Machine Learning'),
('What is linear regression in machine learning?', 'Linear regression is a supervised learning technique that predicts a continuous output (e.g., house price) based on one or more input features using a linear relationship.', 'Machine Learning'),
('What is the mathematical form of a simple linear regression model?', 'f(x) = w ⋅ x + b, where w is the weight (slope) and b is the bias (intercept).', 'Machine Learning'),
('What are the parameters w and b in linear regression?', 'w (Weight): Determines the slope of the line. b (Bias): Determines the y-intercept of the line.', 'Machine Learning'),
('How does the linear regression model make predictions?', 'The model takes an input x and computes the predicted output y^ using the equation y^ = w ⋅ x + b.', 'Machine Learning'),
('What is gradient descent in machine learning?', 'Gradient descent is an optimization algorithm used to minimize the cost function by iteratively adjusting the model parameters in the direction of the steepest descent.', 'Machine Learning'),
('What is the update rule for gradient descent for parameter w?', 'w = w - α ⋅ ∂J(w, b) / ∂w, where α is the learning rate.', 'Machine Learning'),
('What is the learning rate (α) in gradient descent?', 'The learning rate controls the size of the steps taken towards minimizing the cost function. It is typically a small positive number (e.g., 0.01).', 'Machine Learning'),
('What role does the derivative play in gradient descent?', 'The derivative indicates the direction and magnitude to adjust the parameters to reduce the cost function. It points in the direction of the steepest ascent, so gradient descent moves in the opposite direction.', 'Machine Learning'),
('Why is it important to update parameters w and b simultaneously in gradient descent?', 'Simultaneous updates ensure that the adjustments to w and b are based on the same iteration of the cost function, preventing inconsistencies and ensuring correct convergence.', 'Machine Learning'),
('What is batch gradient descent?', 'Batch gradient descent updates the model parameters using the entire training dataset in each iteration to compute the gradients.', 'Machine Learning'),
('What is the difference between a local minimum and a global minimum in the context of gradient descent?', 'Global Minimum: The lowest possible point of the cost function across all possible parameter values. Local Minimum: A point where the cost function is lower than neighboring points but not necessarily the lowest overall.', 'Machine Learning'),
('What is a convex function and why is it important for gradient descent?', 'A convex function has a bowl-shaped curve with a single global minimum. It ensures that gradient descent will converge to the global minimum without getting stuck in local minima.', 'Machine Learning'),
('What is the effect of using a very small learning rate (α) in gradient descent?', 'A very small learning rate causes gradient descent to take tiny steps, leading to slow convergence towards the minimum.', 'Machine Learning'),
('What is the effect of using a very large learning rate (α) in gradient descent?', 'A very large learning rate can cause gradient descent to overshoot the minimum, potentially leading to divergence and preventing convergence.', 'Machine Learning'),
('What does convergence mean in gradient descent?', 'Convergence occurs when the updates to the parameters w and b become negligible, indicating that the cost function has reached or is near a minimum.', 'Machine Learning'),
('What are the main steps in the gradient descent algorithm?', '1. Initialize parameters w and b. 2. Compute the gradients ∂J/∂w and ∂J/∂b. 3. Update the parameters using the gradient descent update rule. 4. Repeat steps 2-3 until convergence.', 'Machine Learning'),
('How is the derivative of the cost function at a point w visualized?', 'The derivative is visualized as the slope of the tangent line drawn at that point on the cost function curve.', 'Machine Learning'),
('What does a positive derivative indicate in gradient descent?', 'A positive derivative indicates that the cost function is increasing with w, so gradient descent will decrease w to reduce the cost.', 'Machine Learning'),
('What does a negative derivative indicate in gradient descent?', 'A negative derivative indicates that the cost function is decreasing with w, so gradient descent will increase w to reduce the cost.', 'Machine Learning'),
('What is the difference between batch gradient descent and stochastic gradient descent (SGD)?', 'Batch Gradient Descent: Uses the entire training dataset to compute gradients in each iteration. Stochastic Gradient Descent (SGD): Uses one training example at a time to compute gradients and update parameters.', 'Machine Learning'),
('Why are partial derivatives used in gradient descent for models with multiple parameters?', 'Partial derivatives measure the change in the cost function with respect to each individual parameter, allowing gradient descent to update each parameter independently while considering their combined effect on the cost.', 'Machine Learning'),
('What is the correct way to implement gradient descent updates for multiple parameters?', 'Compute all parameter updates first and then apply them simultaneously to ensure consistency.', 'Machine Learning'),
('What happens if parameters are updated sequentially instead of simultaneously in gradient descent?', 'Sequential updates can lead to incorrect gradients and inconsistent parameter adjustments, potentially preventing convergence to the optimal solution.', 'Machine Learning'),
('How does gradient descent appear on a contour plot of the cost function?', 'Gradient descent appears as a path moving towards the center of concentric ellipses (global minimum) by taking steps in the direction of the steepest descent.', 'Machine Learning'),
('What should you consider when choosing a learning rate (α)?', 'The learning rate should be small enough to ensure convergence but large enough to make significant progress without overshooting the minimum.', 'Machine Learning'),
('What is the ultimate goal of the gradient descent algorithm?', 'To find the parameter values w and b that minimize the cost function J(w, b), achieving the best fit for the model.', 'Machine Learning'),
('Why is batch gradient descent called \'batch\'?', 'Because it processes the entire batch of training data in each iteration to compute the gradients and update the parameters.', 'Machine Learning'),
('Can gradient descent get stuck in local minima?', 'Yes, if the cost function has multiple minima, gradient descent may converge to a local minimum depending on the initial parameter values. However, for convex functions like the MSE in linear regression, there is only one global minimum.', 'Machine Learning'),
('Why does the cost function in linear regression have only one global minimum?', 'Because the cost function is convex, shaped like a bowl, ensuring there are no local minima other than the global minimum.', 'Machine Learning'),
('How do initial parameter values w and b affect gradient descent?', 'Initial values determine the starting point of gradient descent. For convex functions like linear regression\'s cost function, any starting point will lead to the global minimum. For non-convex functions, different starting points may lead to different local minima.', 'Machine Learning'),
('What typically happens to the cost function as gradient descent progresses?', 'The cost function generally decreases with each iteration, moving closer to the minimum.', 'Machine Learning'),
('What are common criteria to stop the gradient descent algorithm?', 'When the change in the cost function between iterations is below a threshold, when the number of iterations reaches a predefined limit, or when the parameter updates become negligible.', 'Machine Learning'),
('Beyond linear regression, where else is gradient descent used?', 'Gradient descent is used in training various machine learning models, including neural networks, logistic regression, and support vector machines.', 'Machine Learning'),
('What is a key implementation detail for correctly performing gradient descent updates?', 'Ensure that all parameter updates are computed based on the current state before applying them, typically by using temporary variables to hold new values before updating.', 'Machine Learning'),
('What is the impact of choosing an appropriate learning rate in gradient descent?', 'An appropriate learning rate ensures efficient convergence: too small leads to slow training, while too large can cause overshooting or divergence.', 'Machine Learning'),
('How does the shape of the cost function affect gradient descent\'s convergence?', 'For convex cost functions with a single global minimum, gradient descent reliably converges to the best solution. Non-convex functions with multiple minima can lead gradient descent to different local minima based on initial parameters.', 'Machine Learning'),
('What does the contour plot of a cost function represent in gradient descent?', 'The contour plot shows lines of equal cost, helping visualize how gradient descent moves towards the minimum by following the steepest descent paths.', 'Machine Learning'),
('How does a 3D surface plot of a cost function help in understanding gradient descent?', 'It provides a visual representation of the cost function\'s landscape, showing how gradient descent iteratively moves towards the lowest point (minimum).', 'Machine Learning'),
('What distinguishes batch gradient descent from other variants like stochastic and mini-batch gradient descent?', 'Batch Gradient Descent: Uses the entire dataset to compute gradients in each iteration. Stochastic Gradient Descent (SGD): Uses one training example at a time to compute gradients and update parameters. Mini-Batch Gradient Descent: Uses a subset of the dataset (mini-batch) per iteration.', 'Machine Learning'),
('In gradient descent, what do the terms ∂J(w,b)/∂w and ∂J(w,b)/∂b represent?', 'They represent the partial derivatives of the cost function with respect to w and b, indicating the direction and rate at which to adjust each parameter to minimize the cost.', 'Machine Learning'),
('How does the learning rate (α) influence the step size in gradient descent?', 'The learning rate directly scales the step size. A larger α results in larger steps, while a smaller α results in smaller steps.', 'Machine Learning'),
('How are the parameters w and b typically initialized in gradient descent for linear regression?', 'They are often initialized to 0, but can also be set to small random values or other starting points for demonstration purposes.', 'Machine Learning'),
('What is the formula for the squared error cost function J(w,b) in linear regression?', 'J(w,b) = (1/2m) ∑(w⋅xi + b - yi)^2, where m is the number of training examples.', 'Machine Learning'),
('What indicates that gradient descent has converged?', 'When the updates to w and b become negligible, or when the cost function stops decreasing significantly.', 'Machine Learning'),
('Why must parameter updates in gradient descent be simultaneous?', 'To ensure that each update step uses the original values of w and b from the current iteration, maintaining consistency in the update process.', 'Machine Learning'),
('How do changes in w and b affect the linear regression line?', 'Changing w alters the slope of the line, while changing b shifts the line up or down.', 'Machine Learning'),
('What does the derivative of the cost function with respect to a parameter indicate?', 'It indicates the slope of the cost function at that parameter\'s current value, showing the direction to adjust the parameter to reduce the cost.', 'Machine Learning'),
('Describe the iterative process of gradient descent.', 'Compute the gradient of the cost function with respect to each parameter. Update each parameter by moving it in the opposite direction of its gradient scaled by the learning rate. Repeat until convergence.', 'Machine Learning'),
('What factors affect the efficiency of gradient descent?', 'Learning Rate (α): Balances the speed and stability of convergence. Cost Function Shape: Convex functions ensure reliable convergence. Initialization: Proper starting points can reduce convergence time.', 'Machine Learning'),
('What is a key practical tip when implementing gradient descent in code?', 'Use temporary variables to store updated parameter values before applying them simultaneously to ensure consistency.', 'Machine Learning'),
('What is the final goal of applying gradient descent to a linear regression model?', 'To find the parameter values w and b that minimize the cost function, resulting in the best-fit line for the training data.', 'Machine Learning'),
('What additional resources are recommended for reinforcing gradient descent concepts?', 'Optional Labs: Run and interact with gradient descent code to visualize parameter updates and cost function minimization. Practice Quizzes: Test and reinforce understanding of gradient descent and related concepts.', 'Machine Learning'),
('How does gradient descent behave with non-convex cost functions?', 'Gradient descent may converge to different local minima depending on the starting parameters, and may not find the global minimum.', 'Machine Learning'),
('Can gradient descent be used for models with more than two parameters?', 'Yes, gradient descent can be generalized to minimize cost functions with multiple parameters by computing partial derivatives for each parameter.', 'Machine Learning'),
('Name two variants of gradient descent besides batch gradient descent.', 'Stochastic Gradient Descent (SGD): Uses one training example per iteration. Mini-Batch Gradient Descent: Uses a subset of the training data per iteration.', 'Machine Learning'),
('Why does gradient descent reliably find the global minimum in linear regression with MSE?', 'Because the MSE cost function for linear regression is convex, ensuring a single global minimum without any local minima.', 'Machine Learning'),
('How does feature scaling affect gradient descent?', 'Proper feature scaling can improve the efficiency and convergence speed of gradient descent by ensuring that all features contribute equally to the cost function.', 'Machine Learning'),
('Why do we divide the cost function by 2m in linear regression?', 'To simplify the gradient expressions, as the 2 from the squared term cancels out when taking derivatives, making gradient calculations cleaner.', 'Machine Learning'),
('If w=1, α=0.1, and ∂J/∂w=2, what is the updated w using gradient descent?', 'w = 1 - 0.1 × 2 = 1 - 0.2 = 0.8', 'Machine Learning'),
('How is the bias parameter b updated in gradient descent?', 'b = b - α ⋅ ∂J(w,b)/∂b', 'Machine Learning'),
('How can you visualize the steps of gradient descent on a cost function plot?', 'Each step of gradient descent moves the parameters w and b toward the direction of the steepest descent on the cost function plot, gradually approaching the minimum.', 'Machine Learning'),
('How does initializing parameters w and b to different values affect gradient descent?', 'Different initial values can lead gradient descent to converge along different paths, but for convex functions like linear regression\'s cost function, it will always reach the global minimum regardless of the starting point.', 'Machine Learning'),
('What does the derivative ∂J/∂w indicate about the direction to adjust w?', 'Positive Derivative: J increases as w increases, so decrease w. Negative Derivative: J decreases as w increases, so increase w.', 'Machine Learning'),
('After training a linear regression model with gradient descent, how can you use the model?', 'Use the trained model f(x) = w⋅x + b to make predictions on new input data, such as estimating the price of a house based on its size.', 'Machine Learning'),
('Can gradient descent be applied to non-linear models?', 'Yes, gradient descent can be used to optimize parameters in non-linear models, including neural networks and other complex machine learning algorithms.', 'Machine Learning'),
('What are common stopping criteria for gradient descent?', 'When the improvement in the cost function between iterations is below a threshold, when the number of iterations reaches a predefined limit, or when the parameter updates become negligible.', 'Machine Learning'),
('How does overfitting relate to gradient descent in linear regression?', 'While gradient descent minimizes the cost function on training data, overfitting occurs when the model learns noise in the training data, performing poorly on unseen data. Regularization techniques can help mitigate overfitting.', 'Machine Learning'),
('What is regularization in the context of linear regression and gradient descent?', 'Regularization adds a penalty to the cost function for large parameter values to prevent overfitting, encouraging simpler models.', 'Machine Learning'),
('Does the initial choice of w and b affect the final outcome in linear regression with gradient descent?', 'No, because the cost function for linear regression with MSE is convex, ensuring convergence to the global minimum regardless of initial parameter values.', 'Machine Learning'),
('Describe the process of cost function minimization using gradient descent.', 'Initialize w and b. Compute the gradients ∂J/∂w and ∂J/∂b. Update w and b using the gradients and learning rate. Repeat until convergence.', 'Machine Learning'),
('How does gradient descent scale to models with many parameters?', 'Gradient descent can handle high-dimensional parameter spaces by computing partial derivatives for each parameter and updating them simultaneously, making it suitable for complex models like deep neural networks.', 'Machine Learning'),
('What are some strategies for selecting an appropriate learning rate (α)?', 'Grid Search: Trying multiple learning rates and selecting the one that performs best. Adaptive Learning Rates: Using algorithms like AdaGrad, RMSProp, or Adam that adjust the learning rate during training. Learning Rate Schedules: Gradually decreasing the learning rate as training progresses.', 'Machine Learning'),
('How can you improve the efficiency of gradient descent?', 'Feature Scaling: Normalize or standardize input features to ensure they contribute equally to the cost function. Choosing an Optimal Learning Rate: Balance between too small and too large values. Using Momentum: Incorporate past gradients to smooth updates and accelerate convergence.', 'Machine Learning'),
('Why is feature scaling important for gradient descent?', 'Feature scaling ensures that all input features are on a similar scale, preventing features with larger scales from disproportionately influencing the cost function and improving the convergence speed of gradient descent.', 'Machine Learning'),
('How does the shape of the cost function affect gradient descent?', 'Convex Cost Function: Ensures a single global minimum, guaranteeing convergence. Non-Convex Cost Function: May have multiple local minima, causing gradient descent to converge to different minima based on initial parameters.', 'Machine Learning'),
('What happens if you adjust the learning rate during gradient descent?', 'Adjusting the learning rate can help in avoiding overshooting minima or speeding up convergence. Techniques like learning rate schedules or adaptive learning rates dynamically adjust α for better performance.', 'Machine Learning'),
('How can you intuitively understand the term α ⋅ ∂J/∂w in gradient descent?', 'It represents the step size and direction to adjust w to reduce the cost. α scales the step size, and ∂J/∂w determines the direction of adjustment based on the slope.', 'Machine Learning'),
('What factors influence the convergence rate of gradient descent?', 'Learning Rate (α), Feature Scaling, Cost Function Smoothness, Initialization of Parameters', 'Machine Learning'),
('How is gradient descent implemented in practice for linear regression?', 'Initialize w and b. For each iteration: a. Compute the predicted values y^ b. Calculate the gradients ∂J/∂w and ∂J/∂b c. Update w and b using the update rule. Repeat until convergence.', 'Machine Learning'),
('How does gradient descent compare to analytical solutions for linear regression?', 'Analytical solutions (like the Normal Equation) can directly compute the optimal parameters without iterations, but gradient descent is scalable to large datasets and higher-dimensional models where analytical solutions become computationally expensive.', 'Machine Learning'),
('What are some strategies for initializing parameters in gradient descent?', 'Zero Initialization: Starting with w=0 and b=0. Random Initialization: Assigning small random values to w and b. He or Xavier Initialization: Specific strategies used in neural networks to maintain variance.', 'Machine Learning'),
('How can gradient descent help in preventing overfitting?', 'While gradient descent itself doesn\'t prevent overfitting, it can be combined with regularization techniques (like L1 or L2 regularization) to penalize large weights and encourage simpler models.', 'Machine Learning'),
('Why do we divide the cost function by 2m in linear regression?', 'To simplify the gradient expressions, as the 2 from the squared term cancels out when taking derivatives, making gradient calculations cleaner.', 'Machine Learning'),
('How does the path of gradient descent appear on a 3D surface plot of the cost function?', 'It appears as a trajectory moving downhill towards the lowest point (global minimum) on the surface.', 'Machine Learning'),
('What is a common method to tune the learning rate α?', 'Experimenting with different values, using learning rate schedules, or employing adaptive algorithms like Adam that adjust α dynamically.', 'Machine Learning'),
('What happens during each update step in gradient descent?', 'The parameters w and b are adjusted by subtracting the product of the learning rate and their respective gradients, moving them closer to the optimal values.', 'Machine Learning'),
('What is a stopping condition in gradient descent?', 'When the improvement in the cost function between iterations falls below a predefined threshold, indicating convergence.', 'Machine Learning'),
('Provide a real-world scenario where gradient descent is used.', 'Training a self-driving car\'s perception system by minimizing the error between predicted sensor data interpretations and actual measurements to improve accuracy over time.', 'Machine Learning');
