CREATE TABLE users (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    name VARCHAR(100) NOT NULL,
    birth_date DATE,
    gender VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    encrypted_password VARCHAR(255) NOT NULL,
    auth_provider VARCHAR(50),
    avatar VARCHAR(255),
    additional_data_completed BOOLEAN DEFAULT FALSE
);