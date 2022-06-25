"use strict";
// https://github.com/expressjs/express/tree/master/examples
var express = require('express');

const config = require("./config");
const { listEnvs } = require("./listenvs");

console.log(`Start application ${config.name}, version: ${config.version}. On port: ${config.port}`);

var app = express();

app.use(function (req, res, next) {
  res.set('Cache-Control', 'no-cache, no-store');
  next();
});

// Routes
app.get('/status', function (req, res) {
  let status = { status: 'up' }
  console.log(`endpoint: /status. result ${JSON.stringify(status)}`);
  res.status(200).send(status);
});

app.get('/health', function (req, res) {
  let status = { status: 'up' }
  console.log(`endpoint: /health. result ${JSON.stringify(status)}`);
  res.status(200).send(status);
});

app.get('/version', function (req, res) {
  let json = { version: config.version };
  console.log(`endpoint: /version. result ${JSON.stringify(json)}`);
  res.status(200).send({ version: config.version });
});

app.get('/env', function (req, res) {
  let envs = listEnvs();
  res.setHeader('Content-Type', 'application/json');
  let json = { length: envs.size, data: envs };
  console.log(`endpoint: /env. result ${JSON.stringify(json)}`);
  res.status(200).send({length: envs.size, data: envs});
});

app.get('/env/:pattern', function (req, res) {
  let envs = listEnvs(req.params.pattern);
  res.status(200).send({ length: envs.size, data: envs });
});

app.all('/echo/:id', function (req, res) {
  res.json({
    param: req.params.id
  });
});

app.post('/echo/headers', function (req, res) {
  res.json(req.headers);
});

// assume 404 since no middleware responded
app.use(function (req, res, next) {
  res.status(404).render('404', { url: req.originalUrl });
});

module.exports = app;
