const router = require('express').Router();

const { getAllAuthors, createAuthor, updateAuthor, deleteAuthor } = require('../../controllers/authors.controller');

router.get('/', getAllAuthors);
router.post('/', createAuthor);
router.put('/:author_id', updateAuthor);
router.delete('/:author_id', deleteAuthor);

module.exports = router;
