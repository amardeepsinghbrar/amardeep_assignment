# Taking node:20.11-apline as lightweight image
FROM node:20.11-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY ./src ./src
COPY ./.env .
COPY ./.babelrc .

# Create a non-root user
RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser

# Change ownership of the application files to the non-root user
RUN chown -R appuser:appuser /app

# Exposing port
EXPOSE 3000

# Switch to the non-root user before running the application
USER appuser

# Running the application
CMD ["npm", "start"]
