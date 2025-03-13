# Node Base Image
FROM node:18-alpine

#Working Directry
WORKDIR app

#Copy the Code
COPY . .

#Install the dependecies
RUN npm install

#Run Test case
RUN npm run test

EXPOSE 8000

#Run the code
CMD ["node","app.js"]
