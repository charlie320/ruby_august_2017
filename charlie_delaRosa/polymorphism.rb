2.3.1 :005 > comments = User.first.comments
  User Load (3.9ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
  Comment Load (9.2ms)  SELECT "comments".* FROM "comments" WHERE "comments"."commentable_id" = ? AND "comments"."commentable_type" = ?  [["commentable_id", 1], ["commentable_type", "User"]]
+----+---------+-------------+--------------+--------------+--------------+
| id | content | commenta... | commentab... | created_at   | updated_at   |
+----+---------+-------------+--------------+--------------+--------------+
| 1  |         | 1           | User         | 2017-08-0... | 2017-08-0... |
+----+---------+-------------+--------------+--------------+--------------+
1 row in set
2.3.1 :006 > comments2 = User.second.comments
  User Load (2.2ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1 OFFSET 1
  Comment Load (1.4ms)  SELECT "comments".* FROM "comments" WHERE "comments"."commentable_id" = ? AND "comments"."commentable_type" = ?  [["commentable_id", 2], ["commentable_type", "User"]]
 => #<ActiveRecord::Associations::CollectionProxy []>
2.3.1 :007 > comments2 = User.first.comments
  User Load (2.6ms)  SELECT  "users".* FROM "users"  ORDER BY "users"."id" ASC LIMIT 1
  Comment Load (2.1ms)  SELECT "comments".* FROM "comments" WHERE "comments"."commentable_id" = ? AND "comments"."commentable_type" = ?  [["commentable_id", 1], ["commentable_type", "User"]]
+----+---------+-------------+--------------+--------------+--------------+
| id | content | commenta... | commentab... | created_at   | updated_at   |
+----+---------+-------------+--------------+--------------+--------------+
| 1  |         | 1           | User         | 2017-08-0... | 2017-08-0... |
+----+---------+-------------+--------------+--------------+--------------+
1 row in set
2.3.1 :008 > comments2 = Blog.first.comments
  Blog Load (3.0ms)  SELECT  "blogs".* FROM "blogs"  ORDER BY "blogs"."id" ASC LIMIT 1
  Comment Load (1.5ms)  SELECT "comments".* FROM "comments" WHERE "comments"."commentable_id" = ? AND "comments"."commentable_type" = ?  [["commentable_id", 1], ["commentable_type", "Blog"]]
+----+---------+-------------+--------------+--------------+--------------+
| id | content | commenta... | commentab... | created_at   | updated_at   |
+----+---------+-------------+--------------+--------------+--------------+
| 2  |         | 1           | Blog         | 2017-08-0... | 2017-08-0... |
+----+---------+-------------+--------------+--------------+--------------+
1 row in set
2.3.1 :009 >


2.3.1 :041 > Comment.update(1, content: "I loved your post")
  Comment Load (1.3ms)  SELECT  "comments".* FROM "comments" WHERE "comments"."id" = ? LIMIT 1  [["id", 1]]
   (0.1ms)  begin transaction
  SQL (28.3ms)  UPDATE "comments" SET "content" = ?, "updated_at" = ? WHERE "comments"."id" = ?  [["content", "I loved your post"], ["updated_at", "2017-08-04 05:02:07.660401"], ["id", 1]]
   (2.9ms)  commit transaction
+----+-------------+------------+-------------+-------------+-------------+
| id | content     | comment... | commenta... | created_at  | updated_at  |
+----+-------------+------------+-------------+-------------+-------------+
| 1  | I loved ... | 1          | User        | 2017-08-... | 2017-08-... |
+----+-------------+------------+-------------+-------------+-------------+
1 row in set
2.3.1 :042 > Comment.all
  Comment Load (2.3ms)  SELECT "comments".* FROM "comments"
+----+-------------+------------+-------------+-------------+-------------+
| id | content     | comment... | commenta... | created_at  | updated_at  |
+----+-------------+------------+-------------+-------------+-------------+
| 1  | I loved ... | 1          | User        | 2017-08-... | 2017-08-... |
| 2  |             | 1          | Blog        | 2017-08-... | 2017-08-... |
+----+-------------+------------+-------------+-------------+-------------+
2 rows in set
2.3.1 :043 > Comment.update(2, content: "Thanks for sharing your story")
  Comment Load (2.2ms)  SELECT  "comments".* FROM "comments" WHERE "comments"."id" = ? LIMIT 1  [["id", 2]]
   (0.1ms)  begin transaction
  SQL (4.1ms)  UPDATE "comments" SET "content" = ?, "updated_at" = ? WHERE "comments"."id" = ?  [["content", "Thanks for sharing your story"], ["updated_at", "2017-08-04 05:03:03.393175"], ["id", 2]]
   (3.1ms)  commit transaction
+----+-------------+------------+-------------+-------------+-------------+
| id | content     | comment... | commenta... | created_at  | updated_at  |
+----+-------------+------------+-------------+-------------+-------------+
| 2  | Thanks f... | 1          | Blog        | 2017-08-... | 2017-08-... |
+----+-------------+------------+-------------+-------------+-------------+
1 row in set
2.3.1 :044 > Comment.all
  Comment Load (2.2ms)  SELECT "comments".* FROM "comments"
+----+-------------+------------+-------------+-------------+-------------+
| id | content     | comment... | commenta... | created_at  | updated_at  |
+----+-------------+------------+-------------+-------------+-------------+
| 1  | I loved ... | 1          | User        | 2017-08-... | 2017-08-... |
| 2  | Thanks f... | 1          | Blog        | 2017-08-... | 2017-08-... |
+----+-------------+------------+-------------+-------------+-------------+
2 rows in set
2.3.1 :045 > 
