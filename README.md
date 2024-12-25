# Gold Tracker Application

Live XAUUSD (Gold) Price Tracker with real-time updates, historical charts, and market analysis.

## Project Overview

This application provides:
- Real-time XAUUSD price updates
- Historical price charts
- Market news with impact analysis
- Responsive design for all devices

## Local Development Setup

1. Clone the repository:
```bash
git clone https://github.com/clickeon/gold-tracker.git
cd gold-tracker
```

2. Create and activate virtual environment:
```bash
python -m venv venv
.\venv\Scripts\activate  # Windows
source venv/bin/activate  # Linux/Mac
```

3. Install dependencies:
```bash
pip install -r requirements.txt
```

4. Set up environment variables:
```bash
cp .env.example .env
# Edit .env with your API keys
```

5. Run locally:
```bash
python app.py
```
Access at http://localhost:5010

## Deployment Configuration

### Google Cloud Setup

1. Create a Google Cloud Project:
   - Project ID: crypto-canyon-426117-i3
   - Region: us-central1
   - Service: gold-tracker2

2. Create Service Account for GitHub Actions:
   - Name: github-actions-deployer
   - Email: github-actions-deployer@crypto-canyon-426117-i3.iam.gserviceaccount.com

3. Required IAM Roles:
   - Cloud Run Admin
   - Storage Admin
   - Service Account User
   - Service Account Token Creator
   - Cloud Run Service Agent
   - Cloud Build Editor

### GitHub Repository Setup

1. Create GitHub Repository:
   - Name: gold-tracker
   - URL: https://github.com/clickeon/gold-tracker

2. Configure GitHub Secrets:
   - Name: GCP_SA_KEY
   - Value: Service account JSON key
   - Path: Settings → Secrets → Actions → New repository secret

### Deployment Files

1. GitHub Actions Workflow (.github/workflows/deploy.yml):
   - Builds Docker container
   - Pushes to Google Container Registry
   - Deploys to Cloud Run
   - Configured with service account authentication

2. Dockerfile:
   - Python base image
   - Installs dependencies
   - Configures environment
   - Exposes port 5010

3. Cloud Run Configuration:
   - Service name: gold-tracker2
   - Region: us-central1
   - Allow unauthenticated access
   - Uses custom service account

## Deployment Process

1. Local Development:
   - Make changes
   - Test locally at http://localhost:5010
   - Commit changes

2. Automatic Deployment:
   ```bash
   git add .
   git commit -m "your changes"
   git push
   ```
   GitHub Actions will automatically:
   - Build new container
   - Deploy to Cloud Run
   - Update live service

3. Monitor Deployments:
   - GitHub Actions: https://github.com/clickeon/gold-tracker/actions
   - Cloud Run Console: https://console.cloud.google.com/run

## API Keys Required

1. Alpha Vantage API:
   - Used for: Real-time gold prices
   - Get key: https://www.alphavantage.co/support/#api-key

2. Finnhub API (optional):
   - Used for: Market news
   - Get key: https://finnhub.io/register

## Maintenance

- Monitor API usage limits
- Check Cloud Run logs for errors
- Update dependencies regularly
- Review GitHub Actions workflow runs

## Troubleshooting

1. Deployment Issues:
   - Check GitHub Actions logs
   - Verify service account permissions
   - Ensure secrets are properly set

2. API Issues:
   - Verify API keys in .env
   - Check API rate limits
   - Monitor response formats

## Contact

For support or contributions:
- GitHub: @clickeon
- Email: daniel@clickeon.com
