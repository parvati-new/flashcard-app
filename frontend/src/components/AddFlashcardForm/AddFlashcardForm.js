import React, { useState } from 'react';
import './AddFlashcardForm.css';

function AddFlashcardForm({ newFlashcard, handleInputChange, addFlashcard }) {
  const [isExpanded, setIsExpanded] = useState(false);

  return (
    <div className="add-flashcard-wrapper">
      <button 
        className="toggle-form-btn"
        onClick={() => setIsExpanded(!isExpanded)}
      >
        {isExpanded ? '− Close Form' : '+ Add New Flashcard'}
      </button>
      <div className={`add-flashcard-form ${isExpanded ? 'expanded' : ''}`}>
        <div className="form-content">
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
      </div>
    </div>
  );
}

export default AddFlashcardForm;