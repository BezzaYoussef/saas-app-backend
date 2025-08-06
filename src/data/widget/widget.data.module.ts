import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { Widget, WidgetSchema } from '../models/widget/widget.model';
import { WidgetRepository } from './repository/widget.repository';

@Module({
  imports: [
    MongooseModule.forFeature([
      { name: Widget.name, schema: WidgetSchema }
    ])
  ],
  providers: [WidgetRepository],
  exports: [WidgetRepository, MongooseModule]
})
export class WidgetDataModule {} 