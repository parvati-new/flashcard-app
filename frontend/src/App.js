import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Flashcard from './Flashcard';
import './App.css';

function App() {
  const [flashcards, setFlashcards] = useState([]);
  const [currentPageFlashcards, setCurrentPageFlashcards] = useState([]);
  const [page, setPage] = useState(1);
  const limit = 20;
  const [totalPages, setTotalPages] = useState(1);
  const [shuffle, setShuffle] = useState(false);
  const [selectedCategory, setSelectedCategory] = useState('');

  useEffect(() => {
    fetchFlashcards();
  }, []);

  const fetchFlashcards = () => {
    axios
      .get(`${process.env.REACT_APP_API_URL}/flashcards?limit=1000`)
      .then((response) => {
        setFlashcards(response.data.flashcards);
        setTotalPages(Math.ceil(response.data.flashcards.length / limit));
      })
      .catch((error) => console.error(error));
  };

  useEffect(() => {
    let displayedFlashcards = [...flashcards];

    if (selectedCategory) {
      displayedFlashcards = displayedFlashcards.filter(
        (card) => card.category === selectedCategory
      );
    }

    if (shuffle) {
      displayedFlashcards.sort(() => Math.random() - 0.5);
    }

    const total = Math.ceil(displayedFlashcards.length / limit);
    setTotalPages(total);

    const start = (page - 1) * limit;
    const end = start + limit;
    setCurrentPageFlashcards(displayedFlashcards.slice(start, end));
  }, [flashcards, page, shuffle, selectedCategory]);

  const handleShuffleChange = (e) => {
    setShuffle(e.target.checked);
    setPage(1);
  };

  const handleCategoryChange = (e) => {
    setSelectedCategory(e.target.value);
    setPage(1);
  };

  const handleNextPage = () => {
    if (page < totalPages) {
      setPage(page + 1);
    }
  };

  const handlePrevPage = () => {
    if (page > 1) {
      setPage(page - 1);
    }
  };

  const [newFlashcard, setNewFlashcard] = useState({
    question: '',
    answer: '',
    category: '',
  });

  const handleInputChange = (e) => {
    setNewFlashcard({ ...newFlashcard, [e.target.name]: e.target.value });
  };

  const addFlashcard = () => {
    axios
      .post(`${process.env.REACT_APP_API_URL}/flashcards`, newFlashcard)
      .then((response) => {
        const updatedFlashcards = [
          ...flashcards,
          { ...newFlashcard, id: response.data.id },
        ];
        setFlashcards(updatedFlashcards);
        setNewFlashcard({ question: '', answer: '', category: '' });
        setPage(1);
      })
      .catch((error) => console.error(error));
  };

  const deleteFlashcard = (id) => {
    axios
      .delete(`${process.env.REACT_APP_API_URL}/flashcards/${id}`)
      .then(() => {
        const updatedFlashcards = flashcards.filter((card) => card.id !== id);
        setFlashcards(updatedFlashcards);
        if (currentPageFlashcards.length === 1 && page > 1) {
          setPage(page - 1);
        } else {
          setCurrentPageFlashcards(
            currentPageFlashcards.filter((card) => card.id !== id)
          );
        }
      })
      .catch((error) => console.error(error));
  };

  return (
    <div className="App">
      <h1>Flashcards</h1>
      {/* Add Flashcard Form */}
      <div className="add-flashcard-form">
        <input
          type="text"
          name="question"
          placeholder="Question"
          value={newFlashcard.question}
          onChange={handleInputChange}
        />
        <input
          type="text"
          name="answer"
          placeholder="Answer"
          value={newFlashcard.answer}
          onChange={handleInputChange}
        />
        <input
          type="text"
          name="category"
          placeholder="Category"
          value={newFlashcard.category}
          onChange={handleInputChange}
        />
        <button onClick={addFlashcard}>Add Flashcard</button>
      </div>
      {/* Shuffle Toggle */}
      <div className="shuffle-toggle">
        <label>
          <input
            type="checkbox"
            checked={shuffle}
            onChange={handleShuffleChange}
          />
          Shuffle Flashcards
        </label>
      </div>
      {/* Category Filter */}
      <div className="category-filter">
        <select onChange={handleCategoryChange} value={selectedCategory}>
          <option value="">All Categories</option>
          <option value="Geography">Geography</option>
          <option value="Mathematics">Mathematics</option>
          {/* Add more categories as needed */}
        </select>
      </div>
      {/* Pagination Controls */}
      <div className="pagination">
        <button onClick={handlePrevPage} disabled={page === 1}>
          Previous
        </button>
        <span>
          Page {page} of {totalPages}
        </span>
        <button onClick={handleNextPage} disabled={page === totalPages}>
          Next
        </button>
      </div>
      {/* Flashcards */}
      <div className="flashcards-container">
        {currentPageFlashcards.map((card) => (
          <Flashcard key={card.id} card={card} onDelete={deleteFlashcard} />
        ))}
      </div>
    </div>
  );
}

export default App;
