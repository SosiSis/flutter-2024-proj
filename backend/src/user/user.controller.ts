import { Body, Controller, Get, Param, Put, Req, UseGuards } from '@nestjs/common';
import { Request } from 'express';
import { JwtAuthGuard } from '../auth/jwt-auth.guard';
import { UpdateUserDto } from './dto/user_update_dto';
import { UserDocument } from './schemas/user.interface';
import { UserService } from './user.service';

@Controller('users')
export class UserController {
  constructor(private userService: UserService) {}

  @UseGuards(JwtAuthGuard)
  @Get('profile')
  async getProfile(@Req() req: Request) {
    const userId = req.user.userId; // Assuming userId is stored in the JWT
    console.log(`Fetching user with ID: ${userId}`); // Debug log
    return this.userService.getUserById(userId);
  }

  @Put(':id')
  async updateUser(@Param('id') id: string, @Body() updateData: UpdateUserDto): Promise<UserDocument> {
    console.log(`Updating user with ID: ${id}`);
    return await this.userService.updateUser(id, updateData);
  }
}
