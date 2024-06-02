const selectAll = () => {
    const query = `
        SELECT posts.*, authors.name, authors.email, authors.image
        FROM posts
        JOIN authors ON posts.authors_id = authors.id
        ORDER BY posts.id
        `;
    return db.query(query);
}

const selectById = (id) => {
    const query = `
        SELECT posts.*, authors.name, authors.email, authors.image
        FROM posts 
        JOIN authors ON posts.authors_id = authors.id
        WHERE posts.id = ?
    `;
    return db.query(query, [id]);
}

const insert = ({ title, description, creation_date, category, authors_id }) => {
    const query = 'INSERT INTO posts (title, description, creation_date, category, authors_id) VALUES (?, ?, ?, ?, ?)';
    return db.query(query, [title, description, creation_date, category, authors_id]);
}



const selectByAuthor = (authorId) => {
    const query = `
        SELECT posts.*, authors.name, authors.email, authors.image 
        FROM posts 
        JOIN authors ON posts.authors_id = authors.id
        WHERE authors.id = ?
    `;
    return db.query(query, [authorId]);
}

const updateById = (id, { title, description, creation_date, category, authors_id }) => {
    return db.query( `
        UPDATE posts 
        SET title = ?, description = ?, creation_date = ?, category = ?, authors_id = ?
        WHERE id = ?
    `, [title, description, creation_date, category, authors_id, id]);
}

const deleteById = (id) => {
    const query = 'DELETE FROM posts WHERE id = ?';
    return db.query(query, [id]);
}

module.exports = {
    selectAll,
    selectById,
    insert,
    selectByAuthor,
    updateById,
    deleteById
}