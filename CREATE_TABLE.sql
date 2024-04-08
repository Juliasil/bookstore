CREATE TABLE publishers (
    id SERIAL  PRIMARY KEY,
  publisher_name VARCHAR(100),
  phone VARCHAR(30),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE generes (
  id SERIAL PRIMARY KEY,
  description VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE ebooks (
    id SERIAL PRIMARY KEY,
  title VARCHAR(100),
  isbn VARCHAR(50) unique,
  language_id INT,
  num_pages INT,
  price FLOAT,
  stock INT,
  publication_date DATE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  publisher_id INT REFERENCES publishers(id),
  genere_id INT REFERENCES generes(id) 
)


CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  e-mail VARCHAR(100),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  telephone VARCHAR(45),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE writes (
    id SERIAL PRIMARY KEY,
  author_id INT REFERENCES authors(id),
  ebook_id INT REFERENCES ebooks(id),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
  date DATE,
  total FLOAT,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  customer_id INT REFERENCES customers(id)
)

CREATE TABLE sales_items (
    id SERIAL PRIMARY KEY,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
  sale_id INT REFERENCES sales(id),
  ebook_id INT REFERENCES ebooks(id)
)


