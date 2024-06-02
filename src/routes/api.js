const router = require('express').Router();


router.use('/posts', require('./api/posts'));
router.use('/authors', require('./api/authors'));


module.exports = router;