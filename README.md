# Live XAUUSD Gold Price Tracker

## Overview
A professional-grade web application that provides real-time gold (XAUUSD) price tracking, historical data analysis, and market insights. Deployed on Google Cloud Run with automatic scaling and high availability.

## Live Demo
Visit [Gold Tracker on Cloud Run](https://gold-tracker2-i3pnera4eq-uc.a.run.app)

## Features
- Real-time gold price tracking with FCS API integration
- Historical price data with interactive charts
- Market analysis and trading signals
- News feed with market impact analysis
- Responsive design for all devices
- Cloud-based caching for optimal performance
- Automatic failover with fallback data

## Technologies
- **Backend**: Python 3.11, Flask
- **Frontend**: HTML5, JavaScript, Bootstrap
- **APIs**: 
  - FCS API (real-time prices)
  - Finnhub (market news)
- **Cloud Infrastructure**:
  - Google Cloud Run
  - Google Cloud Storage
  - Google Cloud Build

## Prerequisites
- Python 3.11+
- pip (Python package manager)
- Google Cloud SDK
- Docker (for local container testing)

## Local Development Setup
1. Clone the repository:
```bash
git clone <your-repo-url>
cd XAUUSD-local
```

2. Create a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows use `venv\Scripts\activate`
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your API keys and configuration
```

5. Run locally:
```bash
python app.py
```
Visit `http://localhost:5010` in your browser

## Docker Development
Build and run with Docker:
```bash
docker build -t gold-tracker .
docker run -p 8080:8080 gold-tracker
```

## Cloud Deployment
Deploy to Google Cloud Run:
```bash
# Build the container
gcloud builds submit --tag gcr.io/crypto-canyon-426117-i3/gold-tracker2

# Deploy to Cloud Run
gcloud run deploy gold-tracker2 \
    --image gcr.io/crypto-canyon-426117-i3/gold-tracker2 \
    --platform managed \
    --region us-central1 \
    --project crypto-canyon-426117-i3 \
    --allow-unauthenticated
```

## Environment Variables
Required environment variables:
- `FCS_API_KEY`: API key for FCS
- `FINNHUB_API_KEY`: API key for Finnhub
- `GOOGLE_CLOUD_PROJECT`: Your GCP project ID
- `GOOGLE_CLOUD_REGION`: GCP region (default: us-central1)

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License
MIT License - see LICENSE file for details
