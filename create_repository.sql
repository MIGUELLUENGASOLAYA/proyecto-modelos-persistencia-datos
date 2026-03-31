CREATE TABLE datasource (
    datasource_id SERIAL PRIMARY KEY,
    datasource_name VARCHAR(100) NOT NULL,
    database_type VARCHAR(50) NOT NULL,
    host VARCHAR(100),
    port INTEGER,
    description VARCHAR(500)
);

CREATE TABLE metadata_table (
    table_id SERIAL PRIMARY KEY,
    datasource_id INTEGER NOT NULL REFERENCES datasource(datasource_id),
    table_name VARCHAR(100) NOT NULL,
    row_count INTEGER,
    description VARCHAR(500)
);

CREATE TABLE metadata_column (
    column_id SERIAL PRIMARY KEY,
    table_id INTEGER NOT NULL REFERENCES metadata_table(table_id),
    column_name VARCHAR(100) NOT NULL,
    data_type VARCHAR(100),
    column_type VARCHAR(100),
    is_nullable VARCHAR(3),
    is_primary_key BOOLEAN DEFAULT FALSE,
    is_foreign_key BOOLEAN DEFAULT FALSE,
    referenced_table VARCHAR(100),
    referenced_column VARCHAR(100),
    ordinal_position INTEGER
);

CREATE TABLE business_entity (
    entity_id SERIAL PRIMARY KEY,
    entity_name VARCHAR(100) NOT NULL,
    description VARCHAR(500),
    data_domain VARCHAR(100)
);

CREATE TABLE business_attribute (
    attribute_id SERIAL PRIMARY KEY,
    entity_id INTEGER NOT NULL REFERENCES business_entity(entity_id),
    attribute_name VARCHAR(100) NOT NULL,
    definition VARCHAR(500)
);

CREATE TABLE semantic_lineage (
    lineage_id SERIAL PRIMARY KEY,
    column_id INTEGER NOT NULL REFERENCES metadata_column(column_id),
    attribute_id INTEGER NOT NULL REFERENCES business_attribute(attribute_id)
);
