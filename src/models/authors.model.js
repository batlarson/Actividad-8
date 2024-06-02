const selectAll = () => {
    const query = 'SELECT * FROM authors';
    return db.query(query);
}

const insert = ({ name, email, image }) => {
    const query = 'INSERT INTO authors (name, email, image) VALUES (?, ?, ?)';
    return db.query(query, [name, email, image]);
}

const updateById = (id, { name, email, image }) => {
    const query = 'UPDATE authors SET name = ?, email = ?, image = ? WHERE id = ?';
    return db.query(query, [name, email, image, id]);
}

const deleteById = (id) => {
    const query = 'DELETE FROM authors WHERE id = ?';
    return db.query(query, [id]);
}

const selectById = (id) => {
    const query = 'SELECT * FROM authors WHERE id = ?';
    return db.query(query, [id]);
}

module.exports = {
    selectAll,
    insert,
    updateById,
    deleteById,
    selectById
}