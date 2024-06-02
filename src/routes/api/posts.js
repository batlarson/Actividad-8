const router = require('express').Router();

const { getAllPosts, createPost, updatePost, deletePost, getPostsByAuthor, getById } = require('../../controllers/posts.controller');

router.get('/', getAllPosts);
router.get('/:post_id', getById)
router.get('/author/:author_id', getPostsByAuthor)
router.post('/', createPost);
router.put('/:post_id', updatePost);
router.delete('/:post_id', deletePost);

module.exports = router;