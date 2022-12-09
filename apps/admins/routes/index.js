const router = require('express').Router();
const controllers = require('../controllers');

router.get('/', controllers.get);

module.exports = router;