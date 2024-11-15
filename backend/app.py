from flask import Flask, jsonify, request
from flask_cors import CORS
import mysql.connector
import math
import os

app = Flask(__name__)
CORS(app)


db_config = {
    'host': os.getenv('DB_HOST', 'localhost'),
    'user': os.getenv('DB_USER', 'default_user'),
    'password': os.getenv('DB_PASSWORD', 'default_password'),
    'database': os.getenv('DB_NAME', 'default_db'),
    'port': int(os.getenv('DB_PORT', 3306))
}


# Connect to the database
def get_db_connection():
    return mysql.connector.connect(**db_config)

# Get flashcards with optional filtering and shuffling
@app.route('/flashcards', methods=['GET'])
def get_flashcards():
    conn = get_db_connection()
    cursor = conn.cursor(dictionary=True)

    page = int(request.args.get('page', 1))
    limit = int(request.args.get('limit', 20))
    offset = (page - 1) * limit

    category = request.args.get('category')
    shuffle = request.args.get('shuffle', 'false').lower() == 'true'

    query = "SELECT * FROM flashcards"
    params = []

    if category:
        query += " WHERE category = %s"
        params.append(category)

    if shuffle:
        query += " ORDER BY RAND()"
    else:
        query += " ORDER BY id ASC"

    query += " LIMIT %s OFFSET %s"
    params.extend([limit, offset])

    cursor.execute(query, params)
    flashcards = cursor.fetchall()

    # Get total count for pagination
    count_query = "SELECT COUNT(*) as total FROM flashcards"
    count_params = []

    if category:
        count_query += " WHERE category = %s"
        count_params.append(category)

    cursor.execute(count_query, count_params)
    total_items = cursor.fetchone()['total']
    total_pages = math.ceil(total_items / limit)

    cursor.close()
    conn.close()

    return jsonify({
        'flashcards': flashcards,
        'page': page,
        'total_pages': total_pages,
        'total_items': total_items
    })

# Add a new flashcard
@app.route('/flashcards', methods=['POST'])
def add_flashcard():
    data = request.get_json()
    conn = get_db_connection()
    cursor = conn.cursor()

    query = "INSERT INTO flashcards (question, answer, category) VALUES (%s, %s, %s)"
    params = (data['question'], data['answer'], data.get('category', ''))

    cursor.execute(query, params)
    conn.commit()

    new_id = cursor.lastrowid
    cursor.close()
    conn.close()

    return jsonify({'id': new_id}), 201

# Delete a flashcard
@app.route('/flashcards/<int:id>', methods=['DELETE'])
def delete_flashcard(id):
    conn = get_db_connection()
    cursor = conn.cursor()

    query = "DELETE FROM flashcards WHERE id = %s"
    params = (id,)

    cursor.execute(query, params)
    conn.commit()

    cursor.close()
    conn.close()

    return jsonify({'message': 'Flashcard deleted successfully'})

# Get all unique categories
@app.route('/categories', methods=['GET'])
def get_categories():
    conn = get_db_connection()
    cursor = conn.cursor()
    
    query = "SELECT DISTINCT category FROM flashcards WHERE category != '' ORDER BY category"
    cursor.execute(query)
    
    categories = [category[0] for category in cursor.fetchall()]
    
    cursor.close()
    conn.close()
    
    return jsonify({'categories': categories})

if __name__ == '__main__':
    app.run(host='0.0.0.0')
