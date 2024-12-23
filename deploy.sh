#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Building Flutter web app..."
flutter build web

echo "Deploying to Firebase Hosting..."
firebase deploy --only hosting

echo "Deployment complete!"
