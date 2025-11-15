# Example Dockerfile for a CUDA development environment with UV and PyTorch
FROM nvcr.io/nvidia/cuda:12.9.1-cudnn-runtime-ubuntu24.04

# Install Git if not already installed
RUN if ! command -v git >/dev/null 2>&1; then \
    echo "Git not found, installing..."; \
    apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*; \
    fi

# Set the working directory
WORKDIR /workspace

# Install UV and set up Python virtual environment
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
RUN uv venv /opt/.venv --python 3.12
ENV PATH="/opt/.venv/bin:$PATH"

# Install Jupyter Notebook, and PyTorch with CUDA support
RUN uv pip install --no-cache-dir --upgrade pip && \
    uv pip install --no-cache-dir notebook ipywidgets pylatexenc && \
    uv pip install --no-cache-dir torch==2.8.0 torchvision==0.23.0 torchaudio==2.8.0 --index-url https://download.pytorch.org/whl/cu129

# Install additional Python dependencies listed in requirements.txt
COPY requirements.txt .
RUN uv pip install --no-cache-dir -r requirements.txt