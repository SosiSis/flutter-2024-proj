import { Injectable, UnauthorizedException } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { PassportStrategy } from '@nestjs/passport';
import { Model } from 'mongoose';
import { ExtractJwt, Strategy } from 'passport-jwt';
import { User } from './schemas/user.schema'; // Adjust the import path as needed

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy, 'jwt') {
  constructor(
    @InjectModel(User.name)
    private userModel: Model<User>, 
  ) {
    super({
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: process.env.JWT_SECRET,
    });
  }

  async validate(payload: any): Promise<any> {
    console.log('JWT Payload:', payload); // Log the payload
    const { id } = payload; // Ensure payload contains `id` field

    const user = await this.userModel.findById(id).select('+roles');
    if (!user) {
      throw new UnauthorizedException('Login first to access this endpoint.');
    }

    return { userId: user._id, roles: user.roles }; // Return userId and roles
  }
}
