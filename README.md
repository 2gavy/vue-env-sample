# vue-env-sample
Different Environment Variables for Different Vue Environments 

# Step 1
npm install

# Step 2
Run on development mode - npm run serve  
Go to https://localhost:8080  
It takes in the .env.development title

# Step 3
Run on production mode - npm run build, serve -s dist  
Go to https://localhost:5000  
It takes in the .env.production title

# Step 4
Build docker image
docker build -t vue-env-sample:1 .

# Step 5
Run docker image
docker run -p 5000:5000 -e VUE_APP_FOO="docker_foo" vue-env-sample:1