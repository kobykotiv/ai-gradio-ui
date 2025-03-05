FROM python:3.10-slim

WORKDIR /app

# Install uv and create virtual environment
RUN pip install --no-cache-dir uv && \
    uv venv .venv

# Add virtual environment to PATH
ENV PATH="/app/.venv/bin:$PATH"
ENV VIRTUAL_ENV="/app/.venv"

# Copy dependency files
COPY pyproject.toml poetry.lock* README.md ./

# Install dependencies using uv into the virtual environment
RUN . .venv/bin/activate && \
    uv pip install gradio && \
    uv pip install --no-cache .

# Copy the rest of the application code
COPY . .

# Command to run the application
CMD ["python", "-m", "ai_gradio"]