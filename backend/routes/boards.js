const express = require('express');
const pool = require('../db');
const router = express.Router();
router.get('/', async (req, res, next) => {
  try {
    const [rows] = await pool.query(
      'SELECT id, name, description, ownerId, createdAt FROM boards WHERE isDeleted = 0'
    );
    res.json(rows);
  } catch (err) {
    next(err);
  }
});

router.post('/', async (req, res, next) => {
  try {
    const name = (req.body.name || '').trim();
    if (name.length < 1 || name.length > 80) {
      return res.status(400).json({ error: 'Nazwa musi mieć od 1 do 80 znaków' });
    }
    const ownerId = 1; // do poniedziałku 3 na sztywno, potem z sesji
    const [result] = await pool.query(
      'INSERT INTO boards (name, description, ownerId) VALUES (?, ?, ?)',
      [name, req.body.description || null, ownerId]
    );
    res.status(201).json({ id: result.insertId, name });
  } catch (err) {
    next(err);
  }
});

router.delete('/:id', async (req, res, next) => {
  try {
    const [result] = await pool.query(
      'UPDATE boards SET isDeleted = 1, deletedAt = NOW() WHERE id = ? AND isDeleted = 0',
      [req.params.id]
    );
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Nie znaleziono tablicy' });
    }
    res.status(204).end();
  } catch (err) {
    next(err);
  }
});


// Sprawdzamy, czy tablica istnieje
// Pobieramy zadania z wybranej tablicy
// Zwracamy blad 404, jesli nie ma tablicy
// Wyswietlamy liste zadan

router.get('/:boardId/tasks', async (req, res, next) => {
    try {
        const [boards] = await pool.query(
            'SELECT id FROM boards WHERE id = ? AND isDeleted = 0',
            [req.params.boardId]
        );

        if (boards.length === 0) {
            return res.status(404).json({
                error: 'Nie znaleziono tablicy'
            });
        }

        const [tasks] = await pool.query(
            'SELECT * FROM tasks WHERE boardId = ? AND isDeleted = 0',
            [req.params.boardId]
        );

        res.json(tasks);
    } catch (err) {
        next(err);
    }
});

module.exports = router;