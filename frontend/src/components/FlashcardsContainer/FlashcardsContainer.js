
import React from 'react';
import Flashcard from '../Flashcard/Flashcard';
import './FlashcardsContainer.css';

function FlashcardsContainer({ currentPageFlashcards, deleteFlashcard }) {
  return (
    <div className="flashcards-container">
      {currentPageFlashcards.map((card) => (
        <Flashcard key={card.id} card={card} onDelete={deleteFlashcard} />
      ))}
    </div>
  );
}

export default FlashcardsContainer;