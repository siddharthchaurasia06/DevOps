// src/config.js

const config = {
  GET_TASKS_API_BASE_URL: process.env.REACT_APP_GET_TASKS_API_BASE_URL || '10.0.54.159',
  DELETE_TASK_API_BASE_URL: process.env.REACT_APP_DELETE_TASK_API_BASE_URL || '10.0.50.26',
  CREATE_TASK_API_BASE_URL: process.env.REACT_APP_CREATE_TASK_API_BASE_URL || '10.0.149.5',
};

export default config;
