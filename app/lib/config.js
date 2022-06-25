"use strict";

const { get } = require('env-var');

module.exports = {
  port: get('PORT').default(3000).asInt(),
  name: get('APP_NAME').default('hello-worl-rest').asString(),
  version: get('VERSION').default('local').asString(),
  nodeEnv: get('NODE_ENV').default('development').asString()
};
