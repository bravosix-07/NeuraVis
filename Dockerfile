FROM python:3.10-slim

# System dependencies for Manim rendering
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libcairo2-dev \
    libpango1.0-dev \
    texlive \
    texlive-latex-extra \
    texlive-fonts-extra \
    texlive-latex-recommended \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

# Install backend deps
RUN pip install --no-cache-dir -r Backend/requirements.txt \
    && pip install sqlalchemy passlib python-jose supabase langchain-openai

EXPOSE 8000

CMD ["python", "Backend/main.py"]
