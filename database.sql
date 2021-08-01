﻿CREATE TABLE `USERS` (
	`id`	int	NOT NULL,
	`username`	varchar(255)	NOT NULL,
	`hashed_password`	varchar(255)	NOT NULL,
	`email`	varchar(255)	NOT NULL,
	`secret_key`	varchar(255)	NULL,
	`gender`	varchar(255)	NULL,
	`avg_rating`	float	NULL
);

CREATE TABLE `REVIEWS` (
	`user_id`	int	NOT NULL,
	`supplement_id`	bigint	NULL,
	`rating`	tinyint	NOT NULL,
	`text`	text	NULL,
	`registration_day`	date	NOT NULL
);

CREATE TABLE `SUPPLEMENTS` (
	`report_number`	bigint	NULL,
	`supplement_name`	varchar(255)	NOT NULL,
	`company_name`	varchar(255)	NULL,
	`registration_date`	date	NULL,
	`avg_rating`	float	NULL,
	`ingredient`	text	NULL,
	`expiry_date`	varchar(255)	NULL,
	`appearance`	text	NULL,
	`ingestion`	text	NULL,
	`packaging_material`	text	NULL,
	`storage_standard`	text	NULL,
	`ingest_precaution`	text	NULL,
	`effect`	text	NULL,
	`standard`	text	NULL
);

CREATE TABLE `TYPES` (
	`name`	varchar(255)	NULL
);

CREATE TABLE `SUPPLEMENT_TAGS` (
	`tag_name`	varchar(255)	NOT NULL,
	`supplement_id`	bigint	NULL
);

CREATE TABLE `WISHLIST` (
	`user_id`	int	NOT NULL,
	`supplement_id`	bigint	NULL
);

CREATE TABLE `REVIEW_IMGS` (
	`img_url`	varchar(255)	NULL,
	`user_id`	int	NOT NULL,
	`supplement_id`	bigint	NULL
);

CREATE TABLE `TEMP_PW` (
	`user_id`	int	NOT NULL,
	`temp_password`	varchar(255)	NOT NULL
);

CREATE TABLE `TYPE_TAG` (
	`type_name`	varchar(255)	NULL,
	`tag_name`	varchar(255)	NOT NULL
);

CREATE TABLE `TAGS` (
	`name`	varchar(255)	NOT NULL
);

CREATE TABLE `USER_TYPE` (
	`user_id`	int	NOT NULL,
	`type_name`	varchar(255)	NULL
);

ALTER TABLE `USERS` ADD CONSTRAINT `PK_USERS` PRIMARY KEY (
	`id`
);

ALTER TABLE `USERS` MODIFY id INT AUTO_INCREMENT;

ALTER TABLE `REVIEWS` ADD CONSTRAINT `PK_REVIEWS` PRIMARY KEY (
	`user_id`,
	`supplement_id`
);

ALTER TABLE `SUPPLEMENTS` ADD CONSTRAINT `PK_SUPPLEMENTS` PRIMARY KEY (
	`report_number`
);

ALTER TABLE `TYPES` ADD CONSTRAINT `PK_TYPES` PRIMARY KEY (
	`name`
);

ALTER TABLE `SUPPLEMENT_TAGS` ADD CONSTRAINT `PK_SUPPLEMENT_TAGS` PRIMARY KEY (
	`tag_name`,
	`supplement_id`
);

ALTER TABLE `WISHLIST` ADD CONSTRAINT `PK_WISHLIST` PRIMARY KEY (
	`user_id`,
	`supplement_id`
);

ALTER TABLE `REVIEW_IMGS` ADD CONSTRAINT `PK_REVIEW_IMGS` PRIMARY KEY (
	`img_url`,
	`user_id`,
	`supplement_id`
);

ALTER TABLE `TEMP_PW` ADD CONSTRAINT `PK_TEMP_PW` PRIMARY KEY (
	`user_id`
);

ALTER TABLE `TYPE_TAG` ADD CONSTRAINT `PK_TYPE_TAG` PRIMARY KEY (
	`type_name`,
	`tag_name`
);

ALTER TABLE `TAGS` ADD CONSTRAINT `PK_TAGS` PRIMARY KEY (
	`name`
);

ALTER TABLE `USER_TYPE` ADD CONSTRAINT `PK_USER_TYPE` PRIMARY KEY (
	`user_id`,
	`type_name`
);

ALTER TABLE `REVIEWS` ADD CONSTRAINT `FK_USERS_TO_REVIEWS_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`id`
) ON DELETE CASCADE;

ALTER TABLE `REVIEWS` ADD CONSTRAINT `FK_SUPPLEMENTS_TO_REVIEWS_1` FOREIGN KEY (
	`supplement_id`
)
REFERENCES `SUPPLEMENTS` (
	`report_number`
) ON DELETE CASCADE;

ALTER TABLE `SUPPLEMENT_TAGS` ADD CONSTRAINT `FK_TAGS_TO_SUPPLEMENT_TAGS_1` FOREIGN KEY (
	`tag_name`
)
REFERENCES `TAGS` (
	`name`
) ON DELETE CASCADE;

ALTER TABLE `SUPPLEMENT_TAGS` ADD CONSTRAINT `FK_SUPPLEMENTS_TO_SUPPLEMENT_TAGS_1` FOREIGN KEY (
	`supplement_id`
)
REFERENCES `SUPPLEMENTS` (
	`report_number`
) ON DELETE CASCADE;

ALTER TABLE `WISHLIST` ADD CONSTRAINT `FK_USERS_TO_WISHLIST_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`id`
) ON DELETE CASCADE;

ALTER TABLE `WISHLIST` ADD CONSTRAINT `FK_SUPPLEMENTS_TO_WISHLIST_1` FOREIGN KEY (
	`supplement_id`
)
REFERENCES `SUPPLEMENTS` (
	`report_number`
);

ALTER TABLE `REVIEW_IMGS` ADD CONSTRAINT `FK_REVIEWS_TO_REVIEW_IMGS_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `REVIEWS` (
	`user_id`
) ON DELETE CASCADE;

ALTER TABLE `REVIEW_IMGS` ADD CONSTRAINT `FK_REVIEWS_TO_REVIEW_IMGS_2` FOREIGN KEY (
	`supplement_id`
)
REFERENCES `REVIEWS` (
	`supplement_id`
) ON DELETE CASCADE;

ALTER TABLE `TEMP_PW` ADD CONSTRAINT `FK_USERS_TO_TEMP_PW_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`id`
) ON DELETE CASCADE;

ALTER TABLE `TYPE_TAG` ADD CONSTRAINT `FK_TYPES_TO_TYPE_TAG_1` FOREIGN KEY (
	`type_name`
)
REFERENCES `TYPES` (
	`name`
) ON DELETE CASCADE;

ALTER TABLE `TYPE_TAG` ADD CONSTRAINT `FK_TAGS_TO_TYPE_TAG_1` FOREIGN KEY (
	`tag_name`
)
REFERENCES `TAGS` (
	`name`
) ON DELETE CASCADE;

ALTER TABLE `USER_TYPE` ADD CONSTRAINT `FK_USERS_TO_USER_TYPE_1` FOREIGN KEY (
	`user_id`
)
REFERENCES `USERS` (
	`id`
) ON DELETE CASCADE;

ALTER TABLE `USER_TYPE` ADD CONSTRAINT `FK_TYPES_TO_USER_TYPE_1` FOREIGN KEY (
	`type_name`
)
REFERENCES `TYPES` (
	`name`
) ON DELETE CASCADE;

