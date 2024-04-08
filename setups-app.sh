# Create a virtual environment
python3 -m venv myenv

# Activate the virtual environment
source myenv/bin/activate

# Install Flask
pip install Flask

# Install mysql-connector-python
pip install mysql-connector-python

# Build the Docker Image
docker build -t myflaskapp .

# Run the Docker Container
docker run -p 5000:5000 myflaskapp

# Create a Helm Chart
helm create myflaskapp-chart

