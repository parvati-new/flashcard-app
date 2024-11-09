import React, { useState } from 'react';

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
        {card.question}
        <button onClick={handleDelete}>Delete</button>
      </div>
      <div className="back">{card.answer}</div>
    </div>
  );
}

export default Flashcard;
