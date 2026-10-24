CREATE TABLE edition (
    id BIGSERIAL PRIMARY KEY,
    index INT UNIQUE NOT NULL,
    type VARCHAR(7) NOT NULL,
    name VARCHAR(255) NOT NULL,
    price INT CHECK (price > 0) NOT NULL
);

CREATE TABLE recipient (
    id BIGSERIAL PRIMARY KEY,
    first_name VARCHAR(64) NOT NULL,
    last_name VARCHAR(64) NOT NULL,
    patronymic VARCHAR(64),
    settlement VARCHAR(128) NOT NULL,
    street VARCHAR(128) NOT NULL,
    building INT NOT NULL,
    apartment INT NOT NULL,
    phone VARCHAR(128) UNIQUE NOT NULL
);

CREATE TABLE subscription (
    id BIGSERIAL PRIMARY KEY,
    recipient_id BIGINT REFERENCES recipient(id) ON DELETE CASCADE,
    edition_id BIGINT REFERENCES edition(id) ON DELETE CASCADE,
    term INT CHECK (term > 0) NOT NULL,
    delivery_month SMALLINT CHECK (delivery_month > 0 AND delivery_month < 13) NOT NULL,
    delivery_year SMALLINT CHECK (delivery_year > 0) NOT NULL
);


CREATE INDEX edition_name_idx ON edition(name);
CREATE INDEX recipient_name_idx ON recipient(first_name, last_name);
CREATE INDEX recipient_settlement_idx ON recipient(settlement);
