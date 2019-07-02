# Login
$(aws ecr get-login --no-include-email --region ${AWS_REGION} --profile ${AWS_PROFILE})

# Build image
docker build -t ${APP_NAME}-${ENV_NAME} .

# Tag image
docker tag ${APP_NAME}-${ENV_NAME}:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${APP_NAME}-${ENV_NAME}:latest

# Push image
docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${APP_NAME}-${ENV_NAME}:latest