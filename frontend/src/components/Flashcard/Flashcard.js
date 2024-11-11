
import React, { useState } from 'react';
import './Flashcard.css';

function Flashcard({ card, onDelete }) {
  const [flip, setFlip] = useState(false);

  const handleDelete = (e) => {
    e.stopPropagation();
    onDelete(card.id);
  };

  return (
    <div
      className={`flashcard ${flip ? 'flip' : ''}`}
      onClick={() => setFlip(!flip)}
    >
      <div className="front">
        <div className="content">
          {card.question}
        </div>
        <button onClick={handleDelete}>Delete</button>
      </div>
      <div className="back">
        <div className="content">
          {card.answer}
        </div>
      </div>
    </div>
  );
}

export default Flashcard;