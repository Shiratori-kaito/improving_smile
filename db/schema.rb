# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_23_063247) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "analyse_face_details", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.integer "smile"
    t.boolean "sunglass"
    t.integer "eye_open"
    t.integer "mouth_open"
    t.integer "eye_direction_yaw"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "eye_direction_pitch"
    t.string "agerange_low"
    t.string "agerange_high"
    t.index ["photo_id"], name: "index_analyse_face_details_on_photo_id"
  end

  create_table "analyse_face_emotions", force: :cascade do |t|
    t.bigint "photo_id", null: false
    t.string "happy"
    t.string "sad"
    t.string "angry"
    t.string "surprised"
    t.string "calm"
    t.string "fear"
    t.string "confused"
    t.string "disgusted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "emotion_comment"
    t.index ["photo_id"], name: "index_analyse_face_emotions_on_photo_id"
  end

  create_table "analyse_face_landmarks", force: :cascade do |t|
    t.float "mouth_left_x"
    t.float "mouth_left_y"
    t.float "mouth_right_x"
    t.float "mouth_right_y"
    t.float "mouth_up_x"
    t.float "mouth_up_y"
    t.float "mouth_down_x"
    t.float "mouth_down_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "photo_id"
    t.index ["photo_id"], name: "index_analyse_face_landmarks_on_photo_id"
  end

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id", null: false
    t.bigint "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "post_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_favorites_on_post_id"
    t.index ["user_id", "post_id"], name: "index_favorites_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "photos", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "content"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "analyse_face_detail_id", null: false
    t.bigint "analyse_face_emotion_id", null: false
    t.bigint "photo_id", null: false
    t.boolean "blur"
    t.index ["analyse_face_detail_id"], name: "index_posts_on_analyse_face_detail_id"
    t.index ["analyse_face_emotion_id"], name: "index_posts_on_analyse_face_emotion_id"
    t.index ["photo_id"], name: "index_posts_on_photo_id"
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["follower_id", "following_id"], name: "index_relationships_on_follower_id_and_following_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
    t.index ["following_id"], name: "index_relationships_on_following_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "analyse_face_details", "photos"
  add_foreign_key "analyse_face_emotions", "photos"
  add_foreign_key "analyse_face_landmarks", "photos"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "posts"
  add_foreign_key "favorites", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "posts", "analyse_face_details"
  add_foreign_key "posts", "analyse_face_emotions"
  add_foreign_key "posts", "photos"
  add_foreign_key "posts", "users"
end
