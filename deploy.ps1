# Deploy script for Gold Tracker Cloud Run service

# Set variables
$PROJECT_ID = "crypto-canyon-426117-i3"
$REGION = "us-central1"
$SERVICE_NAME = "gold-tracker2"

# Build the container
Write-Host "Building container image..."
gcloud builds submit --tag gcr.io/$PROJECT_ID/$SERVICE_NAME

# Deploy to Cloud Run
Write-Host "Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME `
    --image gcr.io/$PROJECT_ID/$SERVICE_NAME `
    --platform managed `
    --region $REGION `
    --project $PROJECT_ID `
    --allow-unauthenticated

Write-Host "Deployment complete!"
