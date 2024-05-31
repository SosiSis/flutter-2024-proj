import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { APP_GUARD } from '@nestjs/core';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from './auth/auth.module';
import { RolesGuard } from './auth/roles/role.guard';
import { UserSchema } from './auth/schemas/user.schema';
import { CommentModule } from './comments/comment.module';
import { ItemsModule } from './items/items.module';
import { UserController } from './user/user.controller';
import { UserModule } from './user/user.module';
import { UserService } from './user/user.service';


@Module({
  imports: [
    MongooseModule.forFeature([{name:'User',schema:UserSchema}],

    ),


    ConfigModule.forRoot({
      envFilePath:'.env',
      isGlobal:true,
    }),
    MongooseModule.forRoot(process.env.DB_URL),
    UserModule,
    ItemsModule,
    AuthModule,
    UserModule,
    CommentModule],
    
  controllers: [AppController,UserController],
  providers: [AppService,{
    provide: APP_GUARD,
    useClass: RolesGuard,
    

  },UserService],
})
export class AppModule {}
