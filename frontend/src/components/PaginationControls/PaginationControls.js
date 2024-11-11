import React from 'react';
import PropTypes from 'prop-types';
import './PaginationControls.css';

function PaginationControls({ page, totalPages, handleNextPage, handlePrevPage }) {
  return (
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
  );
}

PaginationControls.propTypes = {
  page: PropTypes.number.isRequired,
  totalPages: PropTypes.number.isRequired,
  handleNextPage: PropTypes.func.isRequired,
  handlePrevPage: PropTypes.func.isRequired,
};

export default PaginationControls;