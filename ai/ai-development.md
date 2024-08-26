High level steps of implementing AI:

1. Data preparation
    Cleansing, feature augmentation, standardization, deduplication.
    Tech: Apache Spark, NVidia Rapids accelerator

2. Model training
    usage of training data to train the selected model. Learn patterns and relationships within labeled datasets. 
    Tech: Tensor Flow, PyTorch, NVidia TAO Toolkit

3. Optimization
    Fine-tune and enhance the model performance.  Adjust hyperparameters: learning rates and batch sizes. 
    Tech: NVidia TensorRT

4. Inference/Deployment
    The trained model is deployed to allow inference/predictions. Generetes output based on new, unseed data to solve a domain-specific problem. 
    Tech: NVidia Triton Inference Server
