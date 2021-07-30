from sqlalchemy import text


class SupplementsDao:
    def __init__(self, database):
        self.db = database

    def get_supplement_info(self, supplement_id):
        return self.db.execute(
            text(
                """
                SELECT * 
                FROM SUPPLEMENTS
                WHERE id = :supplement_id
                """
            ),
            {"supplement_id": supplement_id},
        ).fetchone()

    def search_supplements_by_name(self, supplement_name):
        return self.db.execute(
            text(
                """
                SELECT *
                FROM SUPPLEMENTS
                WHERE product_name LIKE :supplement_name
                """
            ),
            {"supplement_name": "%" + supplement_name + "%"},
        ).fetchall()

    def get_type_tags(self, type):
        return self.db.execute(
            text(
                """
                SELECT tag_name
                FROM TYPE_TAG
                RIGHT JOIN TYPES
                ON TYPE_TAG.type_name = TYPES.name
                WHERE type_name = :type
                """
            ),
            {"type": type},
        ).fetchall()

    def search_supplements_by_tag(self, tag):
        return self.db.execute(
            text(
                """
                SELECT *
                FROM SUPPLEMENTS
                LEFT JOIN SUPPLEMENT_TAGS 
                ON SUPPLEMENTS.id = SUPPLEMENT_TAGS.supplement_id
                WHERE SUPPLEMENT_TAGS.tag_name = :tag
                """
            ),
            {"tag": tag},
        ).fetchall()

    def search_supplements_by_tags(self, tags):
        tags_string = ""
        for i in range(len(tags)):
            tags_string += '"' + tags[i] + '"'
            if i == len(tags) - 1:
                break
            tags_string += ", "

        return self.db.execute(
            text(
                """
                SELECT *
                FROM SUPPLEMENTS
                LEFT JOIN SUPPLEMENT_TAGS 
                ON SUPPLEMENTS.id = SUPPLEMENT_TAGS.supplement_id
                WHERE SUPPLEMENT_TAGS.tag_name IN (
                """
                + tags_string
                + ")"
            )
        ).fetchall()
