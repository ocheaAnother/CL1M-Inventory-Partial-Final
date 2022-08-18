'use strict';

/**
 * id-number service.
 */

const { createCoreService } = require('@strapi/strapi').factories;

module.exports = createCoreService('api::id-number.id-number');
