import React from 'react';
import PropTypes from 'prop-types';
import './CategoryFilter.css';

function CategoryFilter({ selectedCategory, handleCategoryChange }) {
  return (
    <div className="category-filter">
      <select onChange={handleCategoryChange} value={selectedCategory}>
        <option value="">All Categories</option>
        <option value="Geography">Geography</option>
        <option value="Mathematics">Mathematics</option>
        {/* Add more categories as needed */}
      </select>
    </div>
  );
}

CategoryFilter.propTypes = {
  selectedCategory: PropTypes.string.isRequired,
  handleCategoryChange: PropTypes.func.isRequired,
};

export default CategoryFilter;