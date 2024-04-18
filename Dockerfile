FROM node:17.3.0 AS frontend
WORKDIR /frontend
COPY frontend/ ./
RUN npm install
RUN npm install axios@1.1.2
RUN npm install --save font-awesome
RUN npm install react@^18.2.0 react-dom@^18.2.0 react-scripts@5.0.1 web-vitals@^2.1.4
RUN npm install @testing-library/jest-dom@^5.16.5


FROM node:17.3.0 AS backend
WORKDIR /todo
COPY todo/ ./
RUN npm install
RUN npm install express
RUN npm install async@^2.5.0
RUN npm install body-parser@~1.18.2
RUN npm install cookie-parser@~1.4.3
RUN npm install express@~4.15.5
RUN npm install morgan@~1.9.0
RUN npm install mysql2
RUN npm install nodemailer@*
RUN npm install cors
RUN npm install serve-favicon@~2.4.5


FROM node:17.3.0
WORKDIR /app
COPY --from=backend /todo .
COPY --from=frontend /frontend ./frontend

EXPOSE 3000
CMD ["node", "app.js"]
