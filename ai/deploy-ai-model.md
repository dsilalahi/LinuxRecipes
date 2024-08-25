The following is an example MLOps workflow for a CI/CD pipeline that includes Python, Docker, and GitHub Actions, assuming the model has previously been trained and serialized.

1. Model preparation
    ```python
    import joblib

    joblib.dump(model, 'model.pkl') # Assuming `model` is the trained model
    ```

2. Flask App to serve the model
    ```python
    from flask import Flask, request, jsonify
    import joblib

    app = Flask(__name__)

    model = joblib.load('model.pkl')  # load trained model

    @app.route('/predict', methods=['POST'])
    def predict():
        data = request.get_json(force=True)
        prediction = model.predict([data['features']])
        return jsonify(prediction.tolist())

    if __name__ == '__main__':
        app.run(host='0.0.0.0', port=5000)
    ```

3. Containerize the app
    ```docker
    FROM python:3.8-slim

    # Set a directory for the app
    WORKDIR /usr/src/app

    # Install dependencies
    COPY requirements.txt .
    RUN pip install --no-cache-dir -r requirements.txt

    # Copy the current directory contents into the container
    COPY . .

    # Make port 5000 publicly available
    EXPOSE 5000

    # Define environment variable
    ENV NAME World

    # Run app.py when the container launches
    CMD ["python", "app.py"]
    ```

4. Set up GitHub Actions for CI/CD
    ```yaml
    name: Python application

    on:
    push:
        branches: [ main ]
    pull_request:
        branches: [ main ]

    jobs:
    build:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: Set up Python 3.8
        uses: actions/setup-python@v2
        with:
            python-version: 3.8
        - name: Install dependencies
        run: |
            pip install --upgrade pip
            pip install -r requirements.txt
        - name: Test
        run: |
            # Add commands to test the application here
            echo "Tests passed"
            
    deploy:
        needs: build
        runs-on: ubuntu-latest
        steps:
        - name: Deploy to your server
            run: |
            # Add commands to deploy the application
            echo "Deployed successfully"
    ```

5. Deploy

    For deployment, services like AWS ECS, Azure Container Instances, or Google Cloud Run can be used.