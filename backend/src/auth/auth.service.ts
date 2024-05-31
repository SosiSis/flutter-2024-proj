import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { InjectModel } from '@nestjs/mongoose';
import * as bcrypt from 'bcryptjs';
import { Model } from 'mongoose';
import { LoginDto } from './dto/login.dto';
import { SignUpDto } from './dto/signup.dto';
import { User } from './schemas/user.schema';

@Injectable()
export class AuthService {
  constructor(
    @InjectModel(User.name)
    private userModel: Model<User>,
    private jwtService: JwtService,
  ) {}

  async signUp(signUpDto: SignUpDto): Promise<{ token: string }> {
    const { email, password } = signUpDto;

    let roles = ['user'];

    if (email === process.env.ADMIN_EMAIL) {
      const isPasswordMatched = await bcrypt.compare(password, process.env.ADMIN_PASSWORD_HASH);
      if (isPasswordMatched) {
        roles = ['admin'];
      } else {
        throw new UnauthorizedException('Invalid credentials for admin signup.');
      }
    }

    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await this.userModel.create({
      ...signUpDto,
      password: hashedPassword,
      roles,
    });

    const payload = { id: newUser._id, roles: newUser.roles };
    const token = this.jwtService.sign(payload);

    return { token };
  }

  async login(loginDto: LoginDto): Promise<{ token: string }> {
    const { email, password } = loginDto;

    const user = await this.userModel.findOne({ email }).exec();
    if (!user) {
      throw new UnauthorizedException('Invalid email or password.');
    }

    const isPasswordMatched = await bcrypt.compare(password, user.password);
    if (!isPasswordMatched) {
      throw new UnauthorizedException('Invalid email or password.');
    }

    const payload = { id: user._id, roles: user.roles };
    const token = this.jwtService.sign(payload);

    return { token };
  }
}
