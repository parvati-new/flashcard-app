import React, { useEffect, useState } from 'react';
import axios from 'axios';
import AddFlashcardForm from './components/AddFlashcardForm/AddFlashcardForm';
import ShuffleToggle from './components/ShuffleToggle/ShuffleToggle';
import CategoryFilter from './components/CategoryFilter/CategoryFilter';
import PaginationControls from './components/PaginationControls/PaginationControls';
import FlashcardsContainer from './components/FlashcardsContainer/FlashcardsContainer';
import Footer from './components/Footer/Footer';
import './App.css';

function App() {
  const [flashcards, setFlashcards] = useState([]);
  const [currentPageFlashcards, setCurrentPageFlashcards] = useState([]);
  const [page, setPage] = useState(1);
  const limit = 20;
  const [totalPages, setTotalPages] = useState(1);
  const [shuffle, setShuffle] = useState(false);
  const [categories, setCategories] = useState(['All Categories']);
  const [selectedCategory, setSelectedCategory] = useState('All Categories');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const handleCategorySelect = (category) => {
    setSelectedCategory(category);
    console.log(`Selected category: ${category}`);
};

  useEffect(() => {
    fetchFlashcards();
    fetchCategories();
  }, []);

  const fetchFlashcards = () => {
    setLoading(true);
    setError(null);
    axios
      .get(`${process.env.REACT_APP_API_URL}/flashcards?limit=1000`)
      .then((response) => {
        setFlashcards(response.data.flashcards);
        setTotalPages(Math.ceil(response.data.flashcards.length / limit));
      })
      .catch((error) => {
        console.error(error);
        setError('Failed to fetch flashcards. Please try again later.');
      })
      .finally(() => setLoading(false));
  };

  const fetchCategories = () => {
    axios
      .get(`${process.env.REACT_APP_API_URL}/categories`)
      .then((response) => {
        setCategories(['All Categories', ...response.data.categories]);
      })
      .catch((error) => console.error('Error fetching categories:', error));
  };

  useEffect(() => {
    let displayedFlashcards = [...flashcards];

    if (selectedCategory && selectedCategory !== 'All Categories') {
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

  const handleCategoryChange = (category) => {
    setSelectedCategory(category);
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
        fetchFlashcards();
        fetchCategories();
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
      {error && <div className="error-message">{error}</div>}
      {loading ? (
        <div className="loading">Loading...</div>
      ) : (
        <>
          <AddFlashcardForm
            newFlashcard={newFlashcard}
            handleInputChange={handleInputChange}
            addFlashcard={addFlashcard}
          />
          <ShuffleToggle shuffle={shuffle} handleShuffleChange={handleShuffleChange} />
          <CategoryFilter
            label="Filter by Category"
            options={categories}
            selectedOption={selectedCategory}
            onOptionSelect={handleCategoryChange}
          />
          <PaginationControls
            page={page}
            totalPages={totalPages}
            handleNextPage={handleNextPage}
            handlePrevPage={handlePrevPage}
          />
          <FlashcardsContainer
            currentPageFlashcards={currentPageFlashcards}
            deleteFlashcard={deleteFlashcard}
          />
        </>
      )}
      <Footer />
    </div>
  );
}

export default App;
