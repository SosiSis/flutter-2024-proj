import { Body, Controller, Param, Put } from '@nestjs/common';
import { UpdateUserDto } from './dto/user_update_dto';
import { UserDocument } from './schemas/user.interface';
import { UserService } from './user.service';


@Controller('users')
export class UserController {
  constructor(private userService: UserService) {}

  @Put(':id')
async updateUser(@Param('id') id: string, @Body() updateData: UpdateUserDto): Promise<UserDocument> {
  return await this.userService.updateUser(id, updateData);
}
}
