import React from 'react';
import PropTypes from 'prop-types';
import './ShuffleToggle.css';

function ShuffleToggle({ shuffle, handleShuffleChange }) {
  return (
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
  );
}

ShuffleToggle.propTypes = {
  shuffle: PropTypes.bool.isRequired,
  handleShuffleChange: PropTypes.func.isRequired,
};

export default ShuffleToggle;