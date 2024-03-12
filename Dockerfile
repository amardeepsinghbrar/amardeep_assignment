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

# Exposing port
EXPOSE 3000

# Running the application
CMD ["npm", "start"]
