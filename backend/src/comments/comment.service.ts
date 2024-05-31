// src/comments/comment.service.ts
import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Comment } from './schema/comment.schema';

@Injectable()
export class CommentService {
  constructor(@InjectModel('Comment') private commentModel: Model<Comment>) {}

  async createComment(postId: string, content: string): Promise<Comment> {
    const newComment = new this.commentModel({
      postId,
      content
    });
    return newComment.save();
  }

  async findCommentsByPost(postId: string): Promise<Comment[]> {
    return this.commentModel.find({ postId }).exec();
  }
}
