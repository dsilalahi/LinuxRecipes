The following is an overview of how to train a model with scikit-learn, shown with a simple supervised learning example: building a classifier that distinguishes between different varieties of iris flowers based on their physical measurements.


1. Install scikit-learn
    ```sh
    pip install scikit-learn
    ```

2. Import libraries
    ```sh
    from sklearn.datasets import load_iris
    from sklearn.model_selection import train_test_split
    from sklearn.ensemble import RandomForestClassifier
    from sklearn.metrics import accuracy_score
    ```

3. Load dataset
    ```python
    iris = load_iris()
    X = iris.data  # features
    y = iris.target  # target variable  
    ```

4. Split data into training and test
    ```python
    # 70% training and 30% testing
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)  
    ```

5. Choose a model
    ```python
    # other models: SVM, logistic regression, k-nearest neighbors
    clf = RandomForestClassifier(n_estimators=100)
    ```

6. Train the model
    ```python
    clf.fit(X_train, y_train)
    ```

7. Make predictions
    ```python
    y_pred = clf.predict(X_test)
    ```

8. Evaluate the model
    ```python
    print("Accuracy:", accuracy_score(y_test, y_pred))
    ```

Use GridSearchCV or RandomizedSearchCV to perform hyperparameter tuning. 