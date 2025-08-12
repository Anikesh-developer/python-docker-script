FROM python:3.10-slim

WORKDIR /app

# Copy and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Set default environment variables
ENV OTEL_SERVICE_NAME="recommendation-service"
ENV PRODUCT_CATALOG_ADDR="http://product-catalog:8080"
ENV RECOMMENDATION_PORT 5000
   

# Run the application
CMD ["python", "recommendation_server.py"]
