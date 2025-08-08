-- Initialize database with sample data
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (name, email) VALUES 
    ('John Doe', 'john@example.com'),
    ('Jane Smith', 'jane@example.com'),
    ('Alice Johnson', 'alice@example.com'),
    ('Bob Wilson', 'bob@example.com')
ON CONFLICT (email) DO NOTHING;

-- Create a simple products table for more interesting queries
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(50),
    in_stock BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample products
INSERT INTO products (name, price, category, in_stock) VALUES 
    ('Laptop', 999.99, 'Electronics', TRUE),
    ('Mouse', 29.99, 'Electronics', TRUE),
    ('Keyboard', 79.99, 'Electronics', FALSE),
    ('Coffee Mug', 12.99, 'Kitchen', TRUE),
    ('Notebook', 5.99, 'Office', TRUE)
ON CONFLICT DO NOTHING;