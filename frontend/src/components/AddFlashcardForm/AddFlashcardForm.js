
import React from 'react';
import './AddFlashcardForm.css';

function AddFlashcardForm({ newFlashcard, handleInputChange, addFlashcard }) {
  return (
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
  );
}

export default AddFlashcardForm;