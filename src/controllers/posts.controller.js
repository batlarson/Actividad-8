const Posts = require ('../models/posts.model')

const getAllPosts = async (req, res, next) => {
    try {
        const [result] = await Posts.selectAll();
        res.json(result);
    } catch (err) {
        next(err);
    }
}

const getById = async (req, res, next) => {
    try {
        const [result] = await Posts.selectById(req.params.post_id);
        res.json(result);
    } catch (err) {
        next(err);
    }
}


const getPostsByAuthor = async (req, res, next) => {
    try {
        const [result] = await Posts.selectByAuthor(req.params.author_id);
        res.json(result);
    } catch (err) {
        next(err);
    }
}

const createPost = async (req, res, next) => {
    try {
        const [result] = await Posts.insert(req.body);
        const [[post]] = await Posts.selectById(result.insertId);
        res.status(201).json(post);
    } catch (err) {
        next(err);
    }
}

const updatePost = async (req, res, next) => {
    try {
        const { post_id } = req.params;
        const [result] = await Posts.updateById(post_id, req.body);
        if (result.changedRows === 1) {            
            const [[post]] = await Posts.selectById(post_id);    
            res.json(post);
        } else {
            res.status(400).json({ error: 'Se ha producido un error al actualizar el post' });
        }
        
    } catch (err) {
        next(err);
    }
}


const deletePost = async (req, res, next) => {
    try {
        const { post_id } = req.params;
        const [result] = await Posts.deleteById(post_id);
        if (result.affectedRows === 1) {
            res.status(200).send('El post ha sido borrado');
        } else {
            res.status(404).json({ error: 'Post no encontrado' });
        }
    } catch (err) {
        next(err);
    }
}



module.exports = {
    getAllPosts,
    getById,
    getPostsByAuthor,
    createPost,
    updatePost,
    deletePost    
}