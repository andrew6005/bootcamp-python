#!/bin/bash

echo "📦 Setting up Python virtual environment..."

if [ -d "bootcamp-env" ]; then
  echo "🔁 Removing old virtual environment..."
  rm -rf bootcamp-env
fi

python3 -m venv bootcamp-env

echo "✅ Activating virtual environment..."
source bootcamp-env/bin/activate

python -m pip install --upgrade pip

if [ -f "requirements.txt" ]; then
  python -m pip install -r requirements.txt
else
  echo "⚠️ requirements.txt not found, skipping package install."
fi

python -m pip install ipykernel jupyter

python -m ipykernel install --user --name=bootcamp-env --display-name "Python (bootcamp-env)"

python --version
python -m pip --version
python -m jupyter --version

echo "✅ Environment Setup complete."