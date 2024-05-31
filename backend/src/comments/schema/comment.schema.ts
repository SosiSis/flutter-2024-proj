// src/comments/schemas/comment.schema.ts
import * as mongoose from 'mongoose';

export const CommentSchema = new mongoose.Schema({
  postId: mongoose.Schema.Types.ObjectId,  // Link to Post model if needed
  content: String,
}, { timestamps: true });

export interface Comment extends mongoose.Document {
  postId: mongoose.Types.ObjectId;
  content: string;
}
