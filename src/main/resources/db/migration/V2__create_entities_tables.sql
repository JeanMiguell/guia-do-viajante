CREATE TABLE history_events (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_year DATE,
    end_year DATE,
    period_description VARCHAR(255),
    event_type VARCHAR(50),
    intro_text TEXT
);

CREATE TABLE units (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    history_event_id UUID NOT NULL,
    title VARCHAR(255),
    description TEXT,
    order_index INT NOT NULL,

    CONSTRAINT fk_units_event
        FOREIGN KEY (history_event_id) REFERENCES history_events(id)
);

CREATE TABLE unit_contents (
     id UUID PRIMARY KEY,
     created_date_at TIMESTAMP NOT NULL,
     updated_date_at TIMESTAMP NOT NULL,
     unit_id UUID NOT NULL,
     hint TEXT,
     title VARCHAR(255),
     content TEXT NOT NULL,
     image_url VARCHAR(500),
     page_order INT NOT NULL,

     CONSTRAINT fk_unit_contents_unit
         FOREIGN KEY (unit_id) REFERENCES units(id) ON DELETE CASCADE
);

CREATE TABLE elements
(
    id              UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    unit_content_id UUID      NOT NULL,
    title           VARCHAR(255),
    description     TEXT,
    pos_x           FLOAT,
    pos_y           FLOAT,

    CONSTRAINT fk_elements_content
        FOREIGN KEY (unit_content_id)
            REFERENCES unit_contents (id)
            ON DELETE CASCADE
);

CREATE TABLE user_element_interactions (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,

    user_id UUID NOT NULL,
    element_id UUID NOT NULL,

    CONSTRAINT fk_uei_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_uei_element
        FOREIGN KEY (element_id) REFERENCES elements(id)
);

CREATE TABLE user_unit_progress (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    unit_id UUID NOT NULL,
    progress_percentage INT DEFAULT 0,
    completed BOOLEAN DEFAULT FALSE,
    last_accessed_at TIMESTAMP,
    completed_at TIMESTAMP,

    CONSTRAINT fk_uup_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_uup_unit
        FOREIGN KEY (unit_id) REFERENCES units(id)
);

CREATE TABLE activities (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    unit_id UUID,
    history_event_id UUID,
    type VARCHAR(20) NOT NULL,
    title VARCHAR(255),
    minimum_score INT,

    CONSTRAINT fk_activity_unit
        FOREIGN KEY (unit_id) REFERENCES units(id),

    CONSTRAINT fk_activity_event
        FOREIGN KEY (history_event_id) REFERENCES history_events(id),

    CONSTRAINT chk_activity_owner
        CHECK (
            (unit_id IS NOT NULL AND history_event_id IS NULL)
                OR
            (unit_id IS NULL AND history_event_id IS NOT NULL)
            )
);

CREATE TABLE questions (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    activity_id UUID NOT NULL,
    statement TEXT,
    type VARCHAR(50),

    CONSTRAINT fk_question_activity
        FOREIGN KEY (activity_id) REFERENCES activities(id)
);

CREATE TABLE answers (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    question_id UUID NOT NULL,
    text TEXT,
    is_correct BOOLEAN,

    CONSTRAINT fk_answer_question
        FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE user_answers (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    question_id UUID NOT NULL,
    answer_id UUID NOT NULL,
    is_correct BOOLEAN,

    CONSTRAINT fk_ua_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_ua_question
        FOREIGN KEY (question_id) REFERENCES questions(id),

    CONSTRAINT fk_ua_answer
        FOREIGN KEY (answer_id) REFERENCES answers(id)
);

CREATE TABLE activity_result (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    activity_id UUID NOT NULL,
    score INT,
    total_questions INT,
    correct_answers INT,
    approved BOOLEAN,
    completed_at TIMESTAMP,

    CONSTRAINT fk_ar_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_ar_activity
        FOREIGN KEY (activity_id) REFERENCES activities(id)
);

CREATE TABLE achievements (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    name VARCHAR(255),
    description TEXT,
    goal INT
);

CREATE TABLE user_achievements (
    id UUID PRIMARY KEY,
    created_date_at TIMESTAMP NOT NULL,
    updated_date_at TIMESTAMP NOT NULL,
    user_id UUID NOT NULL,
    achievement_id UUID NOT NULL,
    progress INT,
    is_completed BOOLEAN,

    CONSTRAINT fk_ua2_user
        FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT fk_ua2_achievement
        FOREIGN KEY (achievement_id) REFERENCES achievements(id)
);