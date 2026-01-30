# syntax=docker/dockerfile:1
FROM nvcr.io/nvidia/cuda:12.9.1-base-ubuntu24.04

# Set the working directory
WORKDIR /workspace

# Install Git and Bash Completion
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash-completion \
    git \
    && \
    rm -rf /var/lib/apt/lists/*

# Set environment variables for UV
ENV UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    UV_TOOL_BIN_DIR=/usr/local/bin \
    UV_PROJECT_ENVIRONMENT=/opt/.venv \
    VIRTUAL_ENV=/opt/.venv \
    PATH="/opt/.venv/bin:$PATH"

# Install UV and UVX from the official pre-built images
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Enable shell completions
RUN echo '[ -f /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc && \
    echo 'eval "$(uv generate-shell-completion bash)"' >> /etc/bash.bashrc && \
    echo 'eval "$(uvx --generate-shell-completion bash)"' >> /etc/bash.bashrc

# Install dependencies packaged
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync

# Set the default command to bash
CMD ["/bin/bash"]
