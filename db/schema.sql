CREATE TABLE `articles` (`id` integer NOT NULL PRIMARY KEY AUTOINCREMENT, `user_id` integer, `title` varchar(255) NOT NULL, `content` varchar(255), `created_at` timestamp, `updated_at` timestamp);
CREATE TABLE `schema_migrations` (`filename` varchar(255) NOT NULL PRIMARY KEY);
INSERT INTO "schema_migrations" VALUES('20150730081448_create_artcles.rb');
