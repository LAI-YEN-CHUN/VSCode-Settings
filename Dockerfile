# Example Dockerfile for a CUDA development environment with UV and PyTorch
FROM nvcr.io/nvidia/cuda:12.9.1-base-ubuntu24.04

# Install Git if not already installed
RUN if ! command -v git >/dev/null 2>&1; then \
    echo "Git not found, installing..."; \
    apt-get update && \
    apt-get install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*; \
    fi

# Install UV and set up Python virtual environment
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# UV venv directory stored outside the project
ENV UV_PROJECT_ENVIRONMENT=/opt/.venv
ENV PATH="/opt/.venv/bin:$PATH"

# Set the working directory
WORKDIR /workspace

# Install dependencies using UV
COPY pyproject.toml .
RUN uv sync