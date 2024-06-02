const Authors = require('../models/authors.model');

const getAllAuthors = async (req, res, next) => {
    try {
        const [result] = await Authors.selectAll();
        res.json(result);
    } catch (err) {
        next(err);
    }
}

const createAuthor = async (req, res, next) => {
    try {
        const [result] = await Authors.insert(req.body);
        const [[author]] = await Authors.selectById(result.insertId);
        res.status(201).json(author);
    } catch (err) {
        next(err);
    }
}

const updateAuthor = async (req, res, next) => {
    try {
        const { author_id } = req.params;
        const [result] = await Authors.updateById(author_id, req.body);
        if (result.affectedRows === 1) {
            const [[author]] = await Authors.selectById(author_id);
            res.json(author);
        } else {
            res.status(400).json({ error: 'Se ha producido un error al actualizar' });
        }
    } catch (err) {
        next(err);
    }
}

const deleteAuthor = async (req, res, next) => {
    try {
        const { author_id } = req.params;
        const [result] = await Authors.deleteById(author_id);
        if (result.affectedRows === 1) {
            res.status(200).send('El autor ha sido borrado');
        } else {
            res.status(404).json({ error: 'Autor no encontrado' });
        }
    } catch (err) {
        next(err);
    }
}

module.exports = {
    getAllAuthors,
    createAuthor,
    updateAuthor,
    deleteAuthor
}
