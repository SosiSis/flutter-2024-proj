// src/comments/comment.controller.ts
import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CommentService } from './comment.service';

@Controller('comments')

export class CommentController {
  constructor(private readonly commentService: CommentService) {}

  @Post()
  async addComment(
    @Body('postId') postId: string,
    @Body('content') content: string,
  ) {
    return this.commentService.createComment(postId, content);
  }

  @Get('test')
  testRoute() {
    return { message: 'This is a test route' };
  }

  @Get(':postId')
  async getComments(@Param('postId') postId: string) {
    return this.commentService.findCommentsByPost(postId);
  }
}
