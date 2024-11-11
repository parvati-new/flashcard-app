import React, { useState, useRef, useEffect } from 'react';
import PropTypes from 'prop-types';
import './CategoryFilter.css';

function CategoryFilter({ label, options, selectedOption, onOptionSelect }) {
    const [isOpen, setIsOpen] = useState(false);
    const dropdownRef = useRef(null);

    // Toggle the dropdown menu
    const handleToggle = () => setIsOpen(!isOpen);

    // Select an option and close the dropdown
    const handleOptionClick = (option) => {
        onOptionSelect(option);
        setIsOpen(false);
    };

    // Close the dropdown when clicking outside of it
    useEffect(() => {
        const handleClickOutside = (event) => {
            if (dropdownRef.current && !dropdownRef.current.contains(event.target)) {
                setIsOpen(false);
            }
        };
        document.addEventListener('mousedown', handleClickOutside);
        return () => document.removeEventListener('mousedown', handleClickOutside);
    }, []);

    return (
        <div className="custom-dropdown" ref={dropdownRef}>
            <button className="dropdown-button" onClick={handleToggle} aria-expanded={isOpen}>
                <span>{selectedOption ? selectedOption : label}</span>
                <span className={`dropdown-arrow ${isOpen ? 'rotated' : ''}`}>▼</span>
            </button>
            {isOpen && (
                <div className="dropdown-menu">
                    {options.map((option, index) => (
                        <div
                            key={index}
                            onClick={() => handleOptionClick(option)}
                            className="dropdown-item"
                        >
                            {option}
                        </div>
                    ))}
                </div>
            )}
        </div>
    );
}

CategoryFilter.propTypes = {
    label: PropTypes.string,
    options: PropTypes.arrayOf(PropTypes.string).isRequired,
    selectedOption: PropTypes.string,
    onOptionSelect: PropTypes.func.isRequired,
};

export default CategoryFilter;
