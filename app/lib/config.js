"use strict";

const { get } = require('env-var');

module.exports = {
  port: get('PORT').default(3000).asInt(),
  version: get('VERSION').default('local').asString(),
  nodeEnv: get('NODE_ENV').default('development').asString()
};
