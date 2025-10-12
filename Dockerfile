# Example Dockerfile for a PyTorch development environment
FROM nvcr.io/nvidia/pytorch:24.12-py3

# Set the working directory
WORKDIR /workspace

# Copy the requirements file
COPY requirements.txt .

# Upgrade pip, install Jupyter
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir notebook ipywidgets pylatexenc

# Install additional Python dependencies listed in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt