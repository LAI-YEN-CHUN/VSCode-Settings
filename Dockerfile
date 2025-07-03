# Example Dockerfile for a PyTorch development environment
FROM nvcr.io/nvidia/pytorch:23.12-py3

# Set the working directory
COPY . /workspace
WORKDIR /workspace

# Set the environment variable to avoid cross-platform git autocrlf issues
RUN git config core.autocrlf input

# Install the required packages
RUN pip install --upgrade pip && \
    pip install notebook ipywidgets pylatexenc && \
    pip install -r requirements.txt